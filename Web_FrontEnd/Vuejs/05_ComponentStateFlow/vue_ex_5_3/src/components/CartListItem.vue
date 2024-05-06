<template>
  <div>
    <li>
      {{ item.product.name }} - {{ item.product.price }}원
      <button @click="remove(item)">삭제</button>
    </li>
  </div>
</template>

<script setup>
defineProps({
  item: Object,
});
const emit = defineEmits(["remove"]);
const remove = function (item) {
  emit("remove", item);
};
</script>
