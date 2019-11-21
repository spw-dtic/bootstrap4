
# Bootstrap 4 This is a Bootstrap 4 implementation of http://getbootstrap.com for Digital Experience Manager. This unofficial version is not compliant with the official bootstrap 3.  
  
## Migration from a Bootstrap 4 components v1  
If you update an existing Jahia from Bootstrap 4 components v1 to the v2, please read the dedicated part bellow  
  
## Installation/dependencies  
You first need to install this dependency (external modules):  
 * Popper.js: available on the store https://store.jahia.com/module/popperjs  
  
Then you can deploy the bootstrap4-core module and the bootstrap4-components  
  
## List of components : ### Breadcrumb  
Indicate the current page’s location within a navigational hierarchy  
  
### Button  
Use Bootstrap’s custom button styles for actions in forms, dialogs, and more. Includes support for a handful of contextual variations, sizes, states, and more.  
#### Button action can be  
 * An internal or an external link  
 * A collapsible content   
 * A modal (dialog prompts)  
 * A popover  
  
### Card  
A card is a flexible and extensible content container. It includes options for headers and footers, a wide variety of content, contextual background colors, and powerful display options.  
Cards replace our old panels, wells, and thumbnails in bootstrap 3.  
  
### Carousel  
The carousel is a slideshow for cycling through a series of content  
  
### Figure  
Anytime you need to display a piece of content—like an image with an optional caption, consider using a figure.  
  
### Grid  
Bootstrap includes a powerful mobile-first flexbox grid system for building layouts of all shapes and sizes. It’s based on a 12 column layout and has multiple tiers, one for each media query range.  
  
### Media object  
The media object helps build complex and repetitive components where some media is positioned alongside content that doesn’t wrap around said media.   
  
### Navbar  
The navbar provides simple navigation for your site  
  
### Pagination  
Pagination links indicate a series of related content exists across multiple pages.  
  
### Text  
This component provides bootstrap 4 styles and CK templates  
  
### Version  
Adds a div describing the bootstrap version used  
  
# Migration from a Bootstrap 4 components v1  
  
**Please read this file if you update Bootstrap 4 components from v1.x to v2.x**  
We did refactor the *Layout / Grid* component by moving the *Grid* part to the *Create Row*.  
  
As a result, when you want to create some columns, you will need to check the *Create Row / Columns* checkbox and then select the type of grid that you want to use (*Predefined* or *Custom*).  
## How to apply this refactoring?  
A groovy script has been made to helps you refactoring existing content. To execute this script, go to the  *Groovy Console* (via the tools http://localhost:8080/tools). The name of the script is **grid-refactoring.groovy**  
First, you can execute this script to test it without checking the *Apply refactoring*. It will list the nodes that will need to be updated. Then, you can check the **Apply refactoring** to save the updates by on the default workspace.  
  
## What is done on this script?  
This script executes a query on your default repository and check on all *Layout / Grid* nodes if they use a *Predefined* or a *Custom* grid type, and set the right type on the *Create Row* mixin.  
  
## What is not done with this script?  
### Publication  
This script only updates the default workspace; you will need to publish the content on live. Note that the publication is not mandatory; the output should be correct on Live even if you don't execute the groovy script.  
### Templates and other modules  
You will also need to update all your modules or templates set that use the *Layout / Grid* module, and if you were using the legacy grid, you will need to check the *Create Row / Column* checkbox and select the right grid type.