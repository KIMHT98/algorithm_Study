<template>
  <div>
    <h2>메인 페이지</h2>
    <MainPage v-for="balance in store.balances" :balance="balance" />
  </div>
</template>

<script setup>
import MainPage from "@/components/MainPage.vue";
import { useBalanceStore } from "@/stores/balance";
const store = useBalanceStore();
</script>

<style scoped></style>
