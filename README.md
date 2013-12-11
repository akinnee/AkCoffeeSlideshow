AkCoffeeSlideshow
=================

A lightweight, object-oriented, fluid width slideshow built with CoffeeScript and SCSS


### Dependencies

jQuery (Tested with 1.7.1)


### Usage

##### CoffeeScript

Already using CoffeeScript in your project?

    slideshow = new AkCoffeeSlideshow "#slideshow", {
      slides: [
        {
          html: "<div>First slide</div>"
        }
        {
          html: "<div>Second slide</div>"
        }
      ]
    }
    
##### JavaScript

If you aren't using CoffeeScript in your project, no problem. You can simply use the compiled JavaScript version of this slideshow.

    var slideshow = new AkCoffeeSlideshow("#slideshow", {
      slides: [
        {
          html: "<div>First slide</div>"
        },
        {
          html: "<div>Second slide</div>"
        }
      ]
    });
    
##### Stylesheet

If you're using SASS/SCSS, great! The styles for this slideshow are written in SCSS. If you aren't using SASS/SCSS, you can just use the generated CSS.


### Contributing

#### Testing

##### The test suite

This project uses Test'em and Jasmine. Simply run "testem" in the root of the project to run the tests. Each class should have its own spec file in the tests directory. All the tests run in a few milliseconds. Test'em runs in the background, watching for changes, and runs the tests every time a source file is changed.

##### Employing TDD

This project employes test-driven development (TDD). This means I write the tests first, and then do the bare minimum to make them pass. The tests define how the program should behave before it is written. This speeds up development because it mostly eliminates the slowness of refreshing your browser to see if what you changed worked, and it mostly eliminates the uncertainty of not knowing if your changes have broken some use case.
