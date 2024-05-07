<template>
  <div>
    <p>이름: {{ props.balance.name }}</p>
    <p>잔고: {{ props.balance.balance }}</p>
    <!-- <RouterLink :to="{ name: 'update', params: { name: balance.name } }"> -->
    <button @click="updateBalance">updateBalance</button>
    <!-- </RouterLink> -->
    <hr />
  </div>
</template>

<script setup>
import { defineProps } from "vue";
import { useRoute, useRouter } from "vue-router";
const route = useRoute();
const router = useRouter();
const props = defineProps({
  balance: Object,
});
const updateBalance = () => {
  router.push({
    name: "update",
    params: { name: props.balance.name },
  });
};
</script>

<style scoped></style>
