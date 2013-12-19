class window.AkCoffeeSlideshow
	@currentSlide
	
	constructor: (selector = "", @options = {}) ->
		@$container = $ selector # jQuery also allows this to be a jQuery object
		@slides = @options.slides

		# build the html for the slideshow
		@$container.addClass("akCoffeeSlideshow")
		@$slidesContainer = $("<div class='slides'>").appendTo(@$container)
		$prevButton = $("<div class='prevButton'>").appendTo(@$container)
		$nextButton = $("<div class='nextButton'>").appendTo(@$container)
		# make each slide
		@makeSlide slide, i for slide, i in @options.slides
		
		# bind events
		$prevButton.click =>
			@navPrev()
			
		$nextButton.click =>
			@navNext()
		
		# display the first slide
		@navTo 0


		# handle animation setup
		if @options.animate
			switch @options.animate
				when "slideHorizontal" then @setupSlideHorizontalAnimation()
				when "slideVertical" then @setupSlideVerticalAnimation()
				when "fade" then @setupFadeAnimation()

	setupSlideHorizontalAnimation: ->

	setupSlideVerticalAnimation: ->

	setupFadeAnimation: ->

	makeSlide: (slide, i) ->
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