<template>
  <nav class="navbar navbar-expand-lg navbar-light bg-white sticky-top shadow-sm">
    <div class="container">
      <a class="navbar-brand" href="#">
        <img src="https://www.kelmen10sports.us/cdn/shop/files/kelmen10_sports_logo_180x.png" alt="Logo" height="50">
      </a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ms-auto">
          <li class="nav-item">
            <a class="nav-link" href="#">Home</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#featured">Featured</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#products">Products</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#categories">Categories</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#newsletter">Newsletter</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#cart">
              <i class="bi bi-cart3"></i>
              <span class="badge bg-primary">{{ cartCount }}</span>
            </a>
          </li>
        </ul>
      </div>
    </div>
  </nav>
</template>

<script setup>
import { ref } from 'vue';
const cartCount = ref(0);
</script>
