// Import Bootstrap JS
import * as bootstrap from 'bootstrap';

// Cart functionality
let cartCount = 0;
const cartBadge = document.querySelector('.badge');

document.querySelectorAll('.product-card button').forEach(button => {
  button.addEventListener('click', () => {
    cartCount++;
    cartBadge.textContent = cartCount;
    
    // Add animation to cart icon
    const cartIcon = document.querySelector('.bi-cart3');
    cartIcon.style.transform = 'scale(1.2)';
    setTimeout(() => {
      cartIcon.style.transform = 'scale(1)';
    }, 200);
  });
});

// Initialize Bootstrap carousel
document.addEventListener('DOMContentLoaded', () => {
  const carouselElement = document.querySelector('#heroSlider');
  if (carouselElement) {
    new bootstrap.Carousel(carouselElement, {
      interval: 5000,
      ride: true
    });
  }
});
