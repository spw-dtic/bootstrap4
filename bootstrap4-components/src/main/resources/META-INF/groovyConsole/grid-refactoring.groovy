import org.jahia.api.Constants
import org.jahia.services.content.*

import javax.jcr.NodeIterator
import javax.jcr.RepositoryException
import javax.jcr.query.Query

def logger = log;

Set<String> nodesToAutoPublish = new HashSet<String>();
Set<String> nodesToManuelPublish = new HashSet<String>();

JCRTemplate.getInstance().doExecuteWithSystemSession(null, Constants.EDIT_WORKSPACE, new JCRCallback() {
    @Override
    Object doInJCR(JCRSessionWrapper session) throws RepositoryException {
        def q = "SELECT * FROM [bootstrap4mix:predefinedGrid]";

        NodeIterator iterator = session.getWorkspace().getQueryManager().createQuery(q, Query.JCR_SQL2).execute().getNodes();
        while (iterator.hasNext()) {
            final JCRNodeWrapper node = (JCRNodeWrapper) iterator.nextNode();
            if (!node.isNodeType('bootstrap4mix:createRow')) {
                node.addMixin('bootstrap4mix:createRow');
                logger.info("Add mixin bootstrap4mix:createRow on " + node.getPath());
            }
            node.setProperty("typeOfGrid", "predefinedGrid");
            if (hasPendingModification(node)) {
                nodesToManuelPublish.add(node.getIdentifier());
            } else {
                nodesToAutoPublish.add(node.getIdentifier())
            }
        }
        q = "SELECT * FROM [bootstrap4mix:customGrid]";
        iterator = session.getWorkspace().getQueryManager().createQuery(q, Query.JCR_SQL2).execute().getNodes();
        while (iterator.hasNext()) {
            final JCRNodeWrapper node = (JCRNodeWrapper) iterator.nextNode();
            if (!node.isNodeType('bootstrap4mix:createRow')) {
                node.addMixin('bootstrap4mix:createRow');
                logger.info("Add mixin bootstrap4mix:createRow on " + node.getPath());
            }
            node.setProperty("typeOfGrid", "customGrid");
            if (hasPendingModification(node)) {
                nodesToManuelPublish.add(node.getIdentifier());
            } else {
                nodesToAutoPublish.add(node.getIdentifier())
            }
        }
        q = "SELECT * FROM [bootstrap4mix:createRow]";
        iterator = session.getWorkspace().getQueryManager().createQuery(q, Query.JCR_SQL2).execute().getNodes();
        while (iterator.hasNext()) {
            final JCRNodeWrapper node = (JCRNodeWrapper) iterator.nextNode();
            String typeOfGrid = "";
            if (node.hasProperty("typeOfGrid")) {
                JCRPropertyWrapper typeOfGridProp = node.getProperty("typeOfGrid");
                if (typeOfGridProp != null) {
                    typeOfGrid = typeOfGridProp.getString();
                }
            }
            if ("".equals(typeOfGrid)) {
                node.setProperty("typeOfGrid", "nogrid");

                logger.info("Set [typeOfGrid] to 'nogrid' on " + node.getPath() + " (legacy value on list value was " + node.properties.gridType.string + ")")
                if (hasPendingModification(node)) {
                    nodesToManuelPublish.add(node.getIdentifier());
                } else {
                    nodesToAutoPublish.add(node.getIdentifier())
                }
            }
        }

        if (CollectionUtils.isNotEmpty(nodesToAutoPublish)) {
            if (doIt) {
                JCRPublicationService.getInstance().publish(nodesToAutoPublish.asList(), Constants.EDIT_WORKSPACE, Constants.LIVE_WORKSPACE, false, null)
            };
            logger.info("");
            logger.info("Nodes which where republished:")
            for (String identifier : nodesToAutoPublish) {
                logger.warn("   " + session.getNodeByIdentifier(identifier).getPath());
            }
        }
        if (CollectionUtils.isNotEmpty(nodesToManuelPublish)) {

            logger.info("");
            logger.info("Nodes publish manually:")
            for (String identifier : nodesToManuelPublish) {
                logger.warn("   " + identifier + " " + session.getNodeByIdentifier(identifier).getPath()) + "/vanityUrlMapping/*";
            }
        }
        if (doIt) {
            session.save();
        }
        return null;
    }
});


public boolean hasPendingModification(final JCRNodeWrapper node) throws RepositoryException {
    try {
        if (!Constants.EDIT_WORKSPACE.equals(node.getSession().getWorkspace().getName())) {
            throw new IllegalArgumentException("The node has to be accessed through a session opened on the default workspace");
        }
        return JCRTemplate.getInstance().doExecuteWithSystemSession(null, Constants.LIVE_WORKSPACE, null, new JCRCallback<Boolean>() {
            public Boolean doInJCR(JCRSessionWrapper session) throws RepositoryException {
                int status = JCRPublicationService.getInstance().getStatus(node, session, null);
                if (status == null) {
                    status = PublicationInfo.UNPUBLISHED;
                }
                return PublicationInfo.PUBLISHED != status;
            }
        });
    } catch (Exception e) {
        return false;
    }
}