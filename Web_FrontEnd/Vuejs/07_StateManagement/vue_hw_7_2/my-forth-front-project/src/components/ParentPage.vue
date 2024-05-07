<template>
  <div class="parent">
    <h3>부모 컴포넌트</h3>
    <p>{{ family.father }}</p>
    <p>{{ family.mother }}</p>
    <ChildPage v-for="child in family.children" :child="child" />
  </div>
</template>

<script setup>
import ChildPage from "./ChildPage.vue";

defineProps({
  family: Object,
});
</script>

<style scoped>
* {
  box-sizing: border-box;
  margin: 0;
}
.parent {
  display: flex;
  flex-direction: column;
  border: 1px solid gray;
  width: 650px;
  text-align: center;
  align-items: center;
  padding: 10px;
  gap: 10px;
  margin-top: 15px;
}
</style>
