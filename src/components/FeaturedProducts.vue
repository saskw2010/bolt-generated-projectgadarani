<template>
  <section id="featured" class="py-5">
    <div class="container">
      <h2 class="text-center mb-4">Featured Products</h2>
      <div class="row g-4">
        <div class="col-md-3">
          <div class="card product-card">
            <img src="https://www.kelmen10sports.us/cdn/shop/files/IMG_7366_540x.heic" class="card-img-top" alt="Product">
            <div class="card-body">
              <h5 class="card-title">Training Equipment</h5>
              <p class="card-text">$129.99</p>
              <button class="btn btn-primary w-100" @click="addToCart">Add to Cart</button>
            </div>
          </div>
        </div>
        <div class="col-md-3">
          <div class="card product-card">
            <img src="https://www.kelmen10sports.us/cdn/shop/files/IMG_7367_540x.heic" class="card-img-top" alt="Product">
            <div class="card-body">
              <h5 class="card-title">Sports Gear</h5>
              <p class="card-text">$89.99</p>
              <button class="btn btn-primary w-100" @click="addToCart">Add to Cart</button>
            </div>
          </div>
        </div>
        <div class="col-md-3">
          <div class="card product-card">
            <img src="https://www.kelmen10sports.us/cdn/shop/files/IMG_7368_540x.heic" class="card-img-top" alt="Product">
            <div class="card-body">
              <h5 class="card-title">Training Kit</h5>
              <p class="card-text">$149.99</p>
              <button class="btn btn-primary w-100" @click="addToCart">Add to Cart</button>
            </div>
          </div>
        </div>
        <div class="col-md-3">
          <div class="card product-card">
            <img src="https://www.kelmen10sports.us/cdn/shop/files/IMG_7369_540x.heic" class="card-img-top" alt="Product">
            <div class="card-body">
              <h5 class="card-title">Sports Package</h5>
              <p class="card-text">$199.99</p>
              <button class="btn btn-primary w-100" @click="addToCart">Add to Cart</button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>
<script setup>
import { ref, inject } from 'vue';
const cartCount = inject('cartCount');

const addToCart = () => {
  cartCount.value++;
  const cartIcon = document.querySelector('.bi-cart3');
  cartIcon.style.transform = 'scale(1.2)';
  setTimeout(() => {
    cartIcon.style.transform = 'scale(1)';
  }, 200);
};
</script>
