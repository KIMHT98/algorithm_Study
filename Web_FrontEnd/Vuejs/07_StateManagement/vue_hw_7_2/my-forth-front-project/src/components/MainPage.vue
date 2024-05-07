<template>
  <h1>Pinia 연습하기</h1>
  <div>
    <ParentPage v-for="family in store.familyInfo" :family="family" />
  </div>
</template>

<script setup>
import ParentPage from "@/components/ParentPage.vue";
import { useCounterStore } from "@/stores/counter";
const store = useCounterStore();
</script>

<style scoped></style>
