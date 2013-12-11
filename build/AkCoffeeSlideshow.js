// Generated by CoffeeScript 1.6.3
(function() {
  window.AkCoffeeSlideshow = (function() {
    AkCoffeeSlideshow.currentSlide;

    function AkCoffeeSlideshow(selector, options) {
      var $nextButton, $prevButton, i, slide, _i, _len, _ref,
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
      this.$slidesContainer = $("<div class='slides'>").appendTo(this.$container);
      $prevButton = $("<div class='prevButton'>").appendTo(this.$container);
      $nextButton = $("<div class='nextButton'>").appendTo(this.$container);
      _ref = options.slides;
      for (i = _i = 0, _len = _ref.length; _i < _len; i = ++_i) {
        slide = _ref[i];
        this.makeSlide(slide, i);
      }
      $prevButton.click(function() {
        return _this.navPrev();
      });
      $nextButton.click(function() {
        return _this.navNext();
      });
      this.navTo(0);
    }

    AkCoffeeSlideshow.prototype.makeSlide = function(slide, i) {
      if (slide.html) {
        return this.$slidesContainer.append($("<div class='slide' data-slide='" + i + "'>").html(slide.html));
      }
    };

    AkCoffeeSlideshow.prototype.lastSlide = function() {
      return this.slides.length - 1;
    };

    AkCoffeeSlideshow.prototype.navTo = function(slideIndex) {
      this.currentSlide = slideIndex;
      this.$slidesContainer.find("> .slide").removeClass("active");
      return this.$activeSlide = this.$slidesContainer.find("> .slide[data-slide='" + slideIndex + "']").addClass("active");
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
