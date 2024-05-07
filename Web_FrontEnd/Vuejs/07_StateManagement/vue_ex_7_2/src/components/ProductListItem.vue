<template>
  <div>
    <li>{{ product.id }} - {{ product.title }} - {{ product.body }}</li>
    <button @click="store.deleteProduct(product.id)">삭제</button>
  </div>
</template>

<script setup>
import { useProductStore } from "@/stores/product";
const store = useProductStore();

defineProps({
  product: Object,
});
</script>

<style lang="scss" scoped></style>
