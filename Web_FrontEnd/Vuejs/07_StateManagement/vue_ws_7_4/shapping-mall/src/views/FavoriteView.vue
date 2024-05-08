<template>
  <h1>장바구니</h1>
  <div class="product-list">
    <ProductDetail
      v-for="product in store.favoriteList"
      :key="product.name"
      :product="product"
    />
  </div>
</template>
<script setup>
import ProductDetail from "@/components/ProductDetail.vue";
import { ref } from "vue";
import { useProductStore } from "@/stores/product";
const store = useProductStore();
</script>
<style scoped>
div {
  margin-top: 50px;
  padding: 30px;
}
.product-list {
  /* width: 80%; */
  display: flex;
  flex-wrap: wrap;
  gap: 20px;
}
h1 {
  margin-top: 50px;
  margin-left: 20px;
}
</style>
