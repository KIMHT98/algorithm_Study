<template>
  <div class="children-page">
    <h3>자식 페이지입니다.</h3>
    <p>이름 : {{ child.name }}</p>
    <p>나이 : {{ child.age }}</p>
  </div>
</template>

<script setup>
defineProps({
  child: Object,
});
</script>

<style scoped>
.children-page {
  border: 1px solid black;
  padding: 10px 20px;
  margin-top: 10px;
}
</style>
