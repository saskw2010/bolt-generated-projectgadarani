import 'bootstrap/dist/js/bootstrap.bundle.min.js';

let cartCount: number = 0;
const cartBadge = document.querySelector('.badge') as HTMLElement;

document.querySelectorAll('.product-card button').forEach(button => {
  button.addEventListener('click', () => {
    cartCount++;
    cartBadge.textContent = String(cartCount);

    const cartIcon = document.querySelector('.bi-cart3') as HTMLElement;
    cartIcon.style.transform = 'scale(1.2)';
    setTimeout(() => {
      cartIcon.style.transform = 'scale(1)';
    }, 200);
  });
});

// Initialize Bootstrap carousel
document.addEventListener('DOMContentLoaded', () => {
  const carouselElement = document.querySelector('#heroSlider') as HTMLElement;
  if (carouselElement) {
    new bootstrap.Carousel(carouselElement, {
      interval: 5000,
      ride: true
    });
  }
});
