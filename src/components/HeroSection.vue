<template>
  <div id="heroSlider" class="carousel slide" data-bs-ride="carousel">
    <div class="carousel-inner">
      <div class="carousel-item active">
        <img src="https://www.kelmen10sports.us/cdn/shop/files/Untitled_design_1_1950x.png" class="d-block w-100" alt="Sports Equipment">
        <div class="carousel-caption">
          <h1>Premium Sports Equipment</h1>
          <p>Quality gear for athletes</p>
          <a href="#products" class="btn btn-primary btn-lg">Shop Now</a>
        </div>
      </div>
      <div class="carousel-item">
        <img src="https://www.kelmen10sports.us/cdn/shop/files/IMG_7370_1950x.heic" class="d-block w-100" alt="Training Equipment">
        <div class="carousel-caption">
          <h1>Training Gear</h1>
          <p>Get ready for your next workout</p>
          <a href="#products" class="btn btn-primary btn-lg">Shop Now</a>
        </div>
      </div>
    </div>
    <button class="carousel-control-prev" type="button" data-bs-target="#heroSlider" data-bs-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="visually-hidden">Previous</span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#heroSlider" data-bs-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="visually-hidden">Next</span>
    </button>
  </div>
</template>
<script setup>
import { onMounted } from 'vue';
import * as bootstrap from 'bootstrap';

onMounted(() => {
  const carouselElement = document.querySelector('#heroSlider');
  if (carouselElement) {
    new bootstrap.Carousel(carouselElement, {
      interval: 5000,
      ride: true
    });
  }
});
</script>
