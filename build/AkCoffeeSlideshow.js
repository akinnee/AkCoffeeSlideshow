// Generated by CoffeeScript 1.6.3
(function() {
  window.AkCoffeeSlideshow = (function() {
    AkCoffeeSlideshow.currentSlide;

    function AkCoffeeSlideshow(selector, options) {
      var $nextButton, $prevButton,
        _this = this;
      if (selector == null) {
        selector = "";
      }
      if (options == null) {
        options = {};
      }
      this.$container = $(selector);
      this.slides = options.slides;
      this.$container.addClass("akCoffeeSlideshow");
      this.$content = $("<div class='contents'>").appendTo(this.$container);
      $prevButton = $("<div class='prevButton'>").appendTo(this.$container);
      $nextButton = $("<div class='nextButton'>").appendTo(this.$container);
      $prevButton.click(function() {
        return _this.navPrev();
      });
      $nextButton.click(function() {
        return _this.navNext();
      });
      this.navTo(0);
    }

    AkCoffeeSlideshow.prototype.lastSlide = function() {
      return this.slides.length - 1;
    };

    AkCoffeeSlideshow.prototype.navTo = function(slideIndex) {
      this.currentSlide = slideIndex;
      if (this.slides[slideIndex].html) {
        this.$content.html(this.slides[slideIndex].html);
      }
      return this.$activeSlide = this.$content;
    };

    AkCoffeeSlideshow.prototype.navPrev = function() {
      if (this.currentSlide === 0) {
        return this.navTo(this.lastSlide());
      } else {
        return this.navTo(this.currentSlide - 1);
      }
    };

    AkCoffeeSlideshow.prototype.navNext = function() {
      if (this.currentSlide === this.lastSlide()) {
        return this.navTo(0);
      } else {
        return this.navTo(this.currentSlide + 1);
      }
    };

    return AkCoffeeSlideshow;

  })();

}).call(this);
