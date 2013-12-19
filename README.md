AkCoffeeSlideshow
=================

A lightweight, object-oriented, fluid width slideshow built with CoffeeScript and SCSS


### Dependencies

jQuery (Tested with 1.7.1)


### Usage

##### CoffeeScript

Already using CoffeeScript in your project? Example:

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
    
Let's break that down...

    new AkCoffeeSlideShow <selector|element|jQuery object>, <options>
    
###### Options

`slides:` An array of slides (objects) to display. Pass in any sort of HTML you want. I'll be adding support for image urls shortly.

`animate:` What type of transition should the slideshow use? Currently supported options:
* `null` No animation
* `"fade"` Fade between slides
    
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

This project uses [Test'em](https://github.com/airportyh/testem) and [Jasmine](https://github.com/pivotal/jasmine). Each class should have its own spec file in the tests directory.

Simply run "testem" in the root of the project to run the tests. Test'em runs in the background, watching for changes, and runs the tests every time a source file is changed. All the tests run in a few milliseconds.

##### Employing TDD

This project employes test-driven development (TDD). This means I write the tests first, and then do the bare minimum to make them pass. The tests define how the program should behave before it is written. This speeds up development because it mostly eliminates the slowness of refreshing your browser to see if what you changed worked, and it mostly eliminates the uncertainty of not knowing if your changes have broken some use case.

#### Styles

Any style updates must be written in SCSS. Make sure all the default styles can be easily overridden.

#### Scripting

All the JS is written using CoffeeScript.
