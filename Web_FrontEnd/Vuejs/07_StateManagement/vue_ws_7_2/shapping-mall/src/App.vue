<script setup>
import { RouterLink, RouterView } from "vue-router";
</script>

<template>
  <header>
    <div class="wrapper">
      <nav>
        <RouterLink to="/"> <b>Home</b> </RouterLink>
        <span>&nbsp;&nbsp;</span>
        <RouterLink to="/products"> <b>상품 목록</b> </RouterLink>
        <span>&nbsp;&nbsp;</span>
        <RouterLink to="/favorite"> <b>장바구니</b> </RouterLink>
      </nav>
    </div>
  </header>

  <RouterView />
</template>

<style scoped>
.wrapper {
  display: flex;
  justify-content: center;
  background-color: black;
  height: 50px;
}
a {
  text-decoration: none;
  color: white;
  line-height: 50px;
}
</style>
