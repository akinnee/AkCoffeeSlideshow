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
		@currentSlide = slideIndex
		@$slidesContainer.find("> .slide").removeClass("active")
		@$activeSlide = @$slidesContainer.find("> .slide[data-slide='#{slideIndex}']").addClass("active")
			
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