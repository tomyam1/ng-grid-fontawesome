# ng-grid-fontawesome

The font used by [ui-grid](http://ui-grid.info/) is a font generated using fontello, and is a subset of font-awesome (except for one icon - spin5 from fontelico).

If you already use font-awesome, this will let use it instead of the ui-grid font.

You can either use the pre compiled files in the `dist` dir or generate them on your own:

    cd /path/to/ng-grid-fontawesome
    npm install
    bower install
 
    # will output the css file
    node .
    
    # will output the less file
    # don't forget to change /path/to to point to where you put font-awesome
    node . --less
 
 
Example plunker http://plnkr.co/edit/TkO3eEQOxJ4dSPbfwSoo?p=preview