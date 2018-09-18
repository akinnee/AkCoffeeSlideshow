AkCoffeeSlideshow
=================

A lightweight, object-oriented, fluid width slideshow built with CoffeeScript and SCSS

Check out the [Demo](https://akinnee.github.io/AkCoffeeSlideshow/demo/)


### Dependencies

jQuery (Tested with 1.7.1)


### Usage

This example uses JavaScript syntax because more people are familiar with it. Obviously, if you're using CoffeeScript, you can use CoffeeScript syntax.

    var slideshow = new AkCoffeeSlideshow("#slideshow", {
      slides: [
        {
          html: "<div>First slide</div>"
        },
        {
          image: "http://placekitten.com/400/300",
          imageWidth: 400,
          imageHeight: 300
        }
      ],
      animate: "slideHorizontal"
    });
    
Let's break that down...

    var slideshow = new AkCoffeeSlideShow(<selector|DOM element|jQuery object>, <options>);
    
The **first** paramater accepts a selector (anything jQuery accepts), a DOM element, or a jQuery object. The **second** parameter is an object with additional options.
    
    
###### Options

`slides:` An array of slides (objects) to display.
* Inside each object, you can pass either an `html`, containing HTML to display inside the slide, or an `image` key, containing a URL to an image.
* If you pass the `image` key, it is recommended you also pass `imageWidth` and `imageHeight`, but not required.

`animate:` What type of transition should the slideshow use? Currently supported options:
* `null` No animation.
* `"fade"` Fade between slides.
* `"slideHorizontal"` Horizontally slide between slides.
* `"slideVertical"` Vertically slide between slides. If the `orientation` option is not set, this will set it to `"vertical"`.

`autoplay:` Automatically advance to the next slide every x milliseconds. Turns off after the user manually navigates.
* `null` The default. Slideshow will not automatically advance.
* `5000` Slideshow will auto advance every 5000ms. Accepts any integer.

`orientation:`
* `null` or `"horizontal"` The default mode. Next and previous buttons will appear to the right and left of the slides.
* `"vertical"` Next and previous buttons will appear to the bottom and top of the slides.

    
##### Stylesheet

If you're using SASS/SCSS, great! The styles for this slideshow are written in SCSS. If you aren't using SASS/SCSS, you can just use the generated CSS.


### Contributing

#### Testing

##### The test suite

This project uses [Test'em](https://github.com/airportyh/testem) and [Jasmine](https://github.com/pivotal/jasmine). Each class should have its own spec file in the tests directory.

Simply run "testem" in the root of the project to run the tests. Test'em runs in the background, watching for changes, and runs the tests every time a source file is changed. All the tests run in a few milliseconds.

##### Test Driven Development

This project uses test-driven development (TDD). This means I write the tests first, and then do the bare minimum to make them pass. The tests define how the program should behave before it is written. This speeds up development because it mostly eliminates the slowness of refreshing your browser to see if what you changed worked, and it mostly eliminates the uncertainty of not knowing if your changes have broken some use case.

#### Styles

Any style updates must be written in SCSS. Make sure all the default styles can be easily overridden.

#### Scripting

All the JS is written using CoffeeScript.
