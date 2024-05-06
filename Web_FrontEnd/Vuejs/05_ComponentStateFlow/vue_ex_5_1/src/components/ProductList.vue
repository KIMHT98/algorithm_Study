<template>
  <div>
    <li v-for="product in productList">
      {{ product.name }} - {{ product.price }}원
    </li>
  </div>
</template>

<script setup>
defineProps({
  productList: Array,
});
</script>

<style lang="scss" scoped></style>
