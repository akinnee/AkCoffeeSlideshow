class AkCoffeeSlideshow
	@currentSlide
	
	constructor: (selector = "", options = {}) ->
		@$container = $ selector
		@slides = options.slides

		# build the html for the slideshow
		@$container.addClass("akCoffeeSlideshow")
		@$content = $("<div class='contents'>").appendTo(@$container)
		$prevButton = $("<div class='prevButton'>").appendTo(@$container)
		$nextButton = $("<div class='nextButton'>").appendTo(@$container)
		
		# bind events
		$prevButton.click =>
			@navPrev()
			
		$nextButton.click =>
			@navNext()
		
		# display the first slide
		@navTo 0;
		
	lastSlide: ->
		@slides.length - 1
		
	navTo: (slideIndex) ->
		@currentSlide = slideIndex
		
		if @slides[slideIndex].html
			@$content.html(@slides[slideIndex].html)
			
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