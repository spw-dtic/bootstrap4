import org.jahia.api.Constants
import org.jahia.services.content.*

import javax.jcr.NodeIterator
import javax.jcr.RepositoryException
import javax.jcr.query.Query

def logger = log;
boolean doIt=false;

Set<String> nodesToPublish = new HashSet<String>();

JCRTemplate.getInstance().doExecuteWithSystemSession(null, Constants.EDIT_WORKSPACE, new JCRCallback() {
    @Override
    Object doInJCR(JCRSessionWrapper session) throws RepositoryException {
        def q = "SELECT * FROM [bootstrap4mix:imageAdvancedSettings]";

        NodeIterator iterator = session.getWorkspace().getQueryManager().createQuery(q, Query.JCR_SQL2).execute().getNodes();
        while (iterator.hasNext()) {
            final JCRNodeWrapper node = (JCRNodeWrapper) iterator.nextNode();
            String borderRadius = node.getProperty('borderRadius').getString();
            //logger.info(borderRadius + " " + node.getPath());
            if ("default".equals(borderRadius)) {
                node.setProperty("borderRadius", "rounded-0");
                logger.info("Change borderRadius value to rounded-0 on " + node.getPath());
                nodesToPublish.add(node.getIdentifier())
            }

        }

        if (CollectionUtils.isNotEmpty(nodesToPublish)) {
            logger.info("");
            logger.info("You need to publish the following nodes:")
            for (String identifier : nodesToPublish) {
                logger.warn("   " + session.getNodeByIdentifier(identifier).getPath());
            }
        }
        if (doIt) {
            session.save();
        }
        return null;
    }
});

