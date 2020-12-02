/*
 * Updates the carousel to shift to the previous or next slide.
 * @param {Object} event - Event from the event listener.
 * @param {integer=} direction - If negative, go backwards a slide, otherwise
 * go forwards a slide.
 */
function updateCarousel(event, direction) {
  let carouselDeck = document.querySelector('.carousel-deck');
  let activeSlide = carouselDeck.querySelector('.carousel-slide[active]');
  let activeIndicator = document.querySelector('.carousel-indicator[active]');
  let nextSlide;
  let nextIndicator;

  if ((event.keyCode != '39' && event.keyCode != '37') && event.target.getAttribute('data-index')) {
    nextSlide = carouselDeck.querySelector('.carousel-slide[data-index=\"' + event.target.getAttribute('data-index') + '\"]');
    console.log(nextSlide);
  } else {
    if (direction < 0) {
      nextSlide = activeSlide.previousElementSibling ||
                  carouselDeck.lastElementChild;
    } else {
      nextSlide = activeSlide.nextElementSibling ||
                  carouselDeck.firstElementChild;
    }
  }
  nextIndicator = document.querySelector('.carousel-indicator[data-index=\"' + nextSlide.getAttribute('data-index') + '\"]');

  activeSlide.toggleAttribute('active');
  activeIndicator.toggleAttribute('active');
  nextSlide.toggleAttribute('active');
  nextIndicator.toggleAttribute('active');
  carouselDeck.style['transform'] =
    'translateX(' + (-35 * nextSlide.getAttribute('data-index') + 'em)');
}

window.onload = function() {
  document.querySelector('.previous-button')
          .addEventListener('click', function() {
    updateCarousel(event, -1);
  });
  document.querySelector('.next-button')
          .addEventListener('click', function() {
    updateCarousel(event, 1);
  });
  let carouselIndicators = document.querySelectorAll('.carousel-indicator');
  for (let i = 0; i < carouselIndicators.length; i++) {
    carouselIndicators[i].addEventListener('click', function(event) {
      updateCarousel(event);
    });
  }
  let carouselLinks = document.querySelectorAll('.carousel-slide');
  for (let i = 0; i < carouselLinks.length; i++) {
    carouselLinks[i].addEventListener('keydown', function(event) {
      if (event.keyCode == '39') {
        updateCarousel(event, 1);
      } else if (event.keyCode == '37') {
        updateCarousel(event, -1);
      }
    });
  }
}