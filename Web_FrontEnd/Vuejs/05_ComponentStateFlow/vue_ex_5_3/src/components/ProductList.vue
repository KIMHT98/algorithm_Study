<template>
  <ul>
    <ProductListItem
      v-for="product in products"
      :key="product.id"
      :product="product"
      @add-to-cart="addToCart"
    />
  </ul>
</template>

<script setup>
import ProductListItem from "@/components/ProductListItem.vue";
const emit = defineEmits(["addToCart"]);

const addToCart = function (product) {
  emit("addToCart", product);
};

defineProps({
  products: Array,
});
</script>
