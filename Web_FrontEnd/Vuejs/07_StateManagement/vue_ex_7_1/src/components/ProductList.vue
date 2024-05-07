<template>
  <div>
    <h1>Product List</h1>
    <ul>
      <li v-for="p in product.products">
        {{ p.id }} - {{ p.title }} - {{ p.body }}
      </li>
    </ul>
  </div>
</template>

<script setup>
import { useProductStore } from "@/stores/product";
const product = useProductStore();
</script>

<style scoped></style>
