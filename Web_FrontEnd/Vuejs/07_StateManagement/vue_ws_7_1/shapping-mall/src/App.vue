<script setup>
import { RouterLink, RouterView } from "vue-router";
</script>

<template>
  <header>
    <div class="wrapper">
      <nav class="navbar bg-body-tertiary">
        <RouterLink to="/"
          ><button class="btn btn-outline-success me-2" type="button">
            Home
          </button></RouterLink
        >
        <RouterLink to="/products"
          ><button class="btn btn-outline-success me-2" type="button">
            상품 목록
          </button></RouterLink
        >
        <RouterLink to="/favorite"
          ><button class="btn btn-outline-success me-2" type="button">
            장바구니
          </button></RouterLink
        >
      </nav>
    </div>
  </header>

  <RouterView />
</template>

<style scoped>
.wrapper {
  display: flex;
  justify-content: center;
}
nav {
  background-color: black;
}
</style>
