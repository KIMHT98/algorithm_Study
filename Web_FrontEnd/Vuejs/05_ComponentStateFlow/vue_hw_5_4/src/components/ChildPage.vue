<template>
  <div>
    <h3>자식 페이지입니다.</h3>
    <p>이름 : {{ child.name }}</p>
    <p>나이 : {{ child.age }}</p>
    <p>용돈 : {{ child.balance }}</p>
    <button @click="updateBalance(child)">용돈 주세요.</button>
  </div>
</template>

<script setup>
defineProps({
  child: Object,
});
const emit = defineEmits(["giveMeAllowance"]);
const updateBalance = function (child) {
  emit("giveMeAllowance", child);
};
</script>

<style scoped></style>
