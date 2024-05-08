<template>
  <div>
    <h4>{{ product.name }}</h4>
    <img :src="product.imagePath" />
    <b>&#8361;{{ product.price }}</b>
    <h3
      :class="{ red: product.isFavorite }"
      @click="store.changeColor(product.name)"
    >
      &hearts;
    </h3>
  </div>
</template>

<script setup>
import { ref } from "vue";
import { useProductStore } from "@/stores/product";
const store = useProductStore();
defineProps({
  product: Object,
});
</script>

<style scoped>
div {
  display: flex;
  flex-direction: column;
  align-items: center;
  border: 1px solid black;
}
img {
  width: 300px;
  height: 200px;
}
.red {
  color: red;
}
</style>
