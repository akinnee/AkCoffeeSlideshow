$ ->
	describe "AkCoffeeSlideshow", ->

		it "creates elements with class of .slide for all the slides", ->
			slideshow = new AkCoffeeSlideshow($("<div id='testSlideshow'>"), {
				slides: [
					{ html: "slide contents" },
					{ html: "slide contents" },
					{ html: "slide contents" }
				]
			})
			expect(slideshow.$container.find(".slide").length).toBe(3)

		it "starts at slide 0", ->
			slideshow = new AkCoffeeSlideshow($("<div id='testSlideshow'>"), {
				slides: [
					{ html: "first slide" },
					{ html: "slide contents" },
					{ html: "slide contents" }
				]
			})
			# make sure the index is correct
			currentSlide = slideshow.currentSlide
			expect(currentSlide).toBe(0)

			# make sure the active slide has the correct content
			activeSlideContents = slideshow.$activeSlide.html()
			expect(activeSlideContents).toBe("first slide")

		it "knows the index of the last slide", ->
			slideshow = new AkCoffeeSlideshow($("<div id='testSlideshow'>"), {
				slides: [
					{ html: "slide contents" },
					{ html: "slide contents" },
					{ html: "slide contents" }
				]
			})
			lastSlide = slideshow.lastSlide()
			expect(lastSlide).toBe(2)

		it "can navigate to a specific index", ->
			slideshow = new AkCoffeeSlideshow($("<div id='testSlideshow'>"), {
				slides: [
					{ html: "slide contents" },
					{ html: "slide contents" },
					{ html: "target slide" },
					{ html: "slide contents" }
				]
			})
			# make sure the index updates properly
			slideshow.navTo(2)
			currentSlide = slideshow.currentSlide
			expect(currentSlide).toBe(2)

			# make sure the active slide has the correct content
			activeSlideContents = slideshow.$activeSlide.html()
			expect(activeSlideContents).toBe("target slide")

			# make sure the active slide has the class of .active
			expect(slideshow.$activeSlide.hasClass("active")).toBeTruthy()
			# and make sure only one slide has the active class
			expect(slideshow.$slidesContainer.find("> .slide.active").length).toBe(1)

		it "can navigate backward", ->
			slideshow = new AkCoffeeSlideshow($("<div id='testSlideshow'>"), {
				slides: [
					{ html: "slide contents" },
					{ html: "slide contents" },
					{ html: "last slide" }
				]
			})
			# make sure the index updates properly
			slideshow.navPrev()
			currentSlide = slideshow.currentSlide
			expect(currentSlide).toBe(slideshow.lastSlide())

			# make sure the active slide has the correct content
			activeSlideContents = slideshow.$activeSlide.html()
			expect(activeSlideContents).toBe("last slide")

		it "can navigate forward", ->
			slideshow = new AkCoffeeSlideshow($("<div id='testSlideshow'>"), {
				slides: [
					{ html: "slide contents" },
					{ html: "second slide" },
					{ html: "slide contents" }
				]
			})
			# make sure the index updates properly
			slideshow.navNext()
			currentSlide = slideshow.currentSlide
			expect(currentSlide).toBe(1)

			# make sure the active slide has the correct content
			activeSlideContents = slideshow.$activeSlide.html()
			expect(activeSlideContents).toBe("second slide")

		it "navigates backward when the .prevButton is clicked", ->
			$element = $("<div id='testSlideshow'>")
			slideshow = new AkCoffeeSlideshow($element, {
				slides: [
					{ html: "slide contents" },
					{ html: "slide contents" }
				]
			})

			# make sure clicking .prevButton calls navPrev()
			spyOn slideshow, "navPrev"
			$element.find(".prevButton").click()
			expect(slideshow.navPrev).toHaveBeenCalled()

		it "navigates forward when the .nextButton is clicked", ->
			$element = $("<div id='testSlideshow'>")
			slideshow = new AkCoffeeSlideshow($element, {
				slides: [
					{ html: "slide contents" },
					{ html: "slide contents" }
				]
			})

			# make sure clicking .nextButton calls navNext()
			spyOn slideshow, "navNext"
			$element.find(".nextButton").click()
			expect(slideshow.navNext).toHaveBeenCalled()