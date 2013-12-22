class window.AkCoffeeSlideshow
	@currentSlide
	
	constructor: (selector = "", @options = {}) ->
		@$container = $ selector # jQuery also allows this to be a jQuery object
		@slides = @options.slides
		@autoplay = @options.autoplay

		# build the html for the slideshow
		@$container.addClass("akCoffeeSlideshow")
		@$slidesContainerWrapper = $("<div class='slidesWrapper'>").appendTo(@$container) # wraps the slides container to prevent overflow
		@$slidesContainer = $("<div class='slides'>").appendTo(@$slidesContainerWrapper) # parent element of the slides
		$prevButton = $("<div class='prevButton'>").appendTo(@$container)
		$nextButton = $("<div class='nextButton'>").appendTo(@$container)
		# make each slide
		@makeSlide slide, i for slide, i in @options.slides

		# bind events
		$prevButton.click =>
			@autoplay = false # stop autoplay when user manually navigates
			@navPrev()
			
		$nextButton.click =>
			@autoplay = false
			@navNext()
		
		# handle animation setup
		if @options.animate
			switch @options.animate
				when "slideHorizontal" then @setupSlideHorizontalAnimation()
				when "slideVertical" then @setupSlideVerticalAnimation()
				when "fade" then @setupFadeAnimation()

		# orientation options
		@setOrientation()

		# display the first slide
		@navTo 0

		@autoplayer()

	setOrientation: ->
		if @options.orientation
			if @options.orientation == "vertical"
				@$container.addClass("option-vertical")

	setupSlideHorizontalAnimation: ->
		@$container.addClass("option-slideHorizontal")

		arrangeSlidesHorizontally = =>
			@slideWidth = @$slidesContainerWrapper.width()
			@$slidesContainer.find("> .slide").width(@slideWidth)
			@$slidesContainer.width(@slides.length * @slideWidth)

		# arrange slides horizontally now and anytime the window resizes
		arrangeSlidesHorizontally()
		$(window).on "resize", arrangeSlidesHorizontally

	setupSlideVerticalAnimation: ->
		if !@options.orientation
			@options.orientation = "vertical"
			@setOrientation()

		@$container.addClass("option-slideVertical")

		arrangeSlidesVertically = =>
			@slideHeight = @$slidesContainerWrapper.height()
			@$slidesContainer.find("> .slide").height(@slideHeight)
			@$slidesContainer.height(@slides.length * @slideHeight)

		# arrange slides horizontally now and anytime the window resizes
		arrangeSlidesVertically()
		$(window).on "resize", arrangeSlidesVertically

	setupFadeAnimation: ->
		# nothing to set up

	makeSlide: (slide, i) ->
		if slide.image
			slide.html = $("<img src='#{slide.image}'>")
			if slide.imageWidth
				slide.html.attr("width", slide.imageWidth)
			if slide.imageHeight
				slide.html.attr("height", slide.imageHeight)

		if slide.html
			@$slidesContainer.append($("<div class='slide' data-slide='#{i}'>").html(slide.html))
		
	lastSlide: ->
		@slides.length - 1
		
	navTo: (slideIndex) ->
		# update current slide index
		@currentSlide = slideIndex

		$currentSlideEl = @$slidesContainer.find("> .slide.active")
		$nextSlideEl = @$slidesContainer.find("> .slide[data-slide='#{slideIndex}']")

		if @options.animate
			if @options.animate == "fade"
				$currentSlideEl.fadeOut(400)
				$nextSlideEl.fadeIn(400)
			else if @options.animate == "slideHorizontal"
				@$slidesContainer.animate({
					"margin-left": @slideWidth * -1 * slideIndex
				}, 400)
			else if @options.animate == "slideVertical"
				@$slidesContainer.animate({
					"margin-top": @slideHeight * -1 * slideIndex
				}, 400)
		else
			$currentSlideEl.hide()
			$nextSlideEl.show()

		# change which slide has active class
		$currentSlideEl.removeClass("active")
		$nextSlideEl.addClass("active")

		# update active slide element
		@$activeSlide = $nextSlideEl
			
	navPrev: ->
		if @currentSlide == 0
			@navTo @lastSlide()
		else
			@navTo @currentSlide - 1
		
	navNext: ->
		if @currentSlide == @lastSlide()
			@navTo 0
		else
			@navTo @currentSlide + 1

	autoplayer: ->
		setTimeout =>
			if @autoplay
				@navNext()
				@autoplayer()
		, @autoplay