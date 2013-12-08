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

If you aren't using CoffeeScript in your project, that's ok. You can simply use the compiled JavaScript version of this slideshow.

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
