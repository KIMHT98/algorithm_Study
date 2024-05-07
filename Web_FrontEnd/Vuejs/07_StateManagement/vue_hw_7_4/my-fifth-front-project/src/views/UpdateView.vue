<template>
  <div>
    <h2>데이터 수정 페이지</h2>
    <p>이름: {{ name }}</p>
    <p>잔고: {{ balance }}</p>
    <button @click="balance += 1000">+</button>
  </div>
</template>

<script setup>
import { ref } from "vue";
import { useRoute } from "vue-router";
import { useBalanceStore } from "@/stores/balance";
const store = useBalanceStore();
const route = useRoute();
const name = ref(route.params.name);

const balance = ref(store.selected(name.value).balance);
</script>

<style scoped></style>
