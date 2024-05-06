<template>
  <ul>
    <h1>장바구니</h1>
    <CartListItem
      v-for="item in cart"
      :key="item.id"
      :item="item"
      @remove="remove"
    />
  </ul>
</template>

<script setup>
import CartListItem from "@/components/CartListItem.vue";
defineProps({
  cart: Array,
});
const emit = defineEmits(["remove"]);
const remove = function (item) {
  emit("remove", item);
};
</script>
