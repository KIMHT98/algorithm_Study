<template>
  <div>
    <h1>상세 프로필</h1>
    <h3>반갑습니다. {{ username }}입니다.</h3>
  </div>
</template>

<script setup>
import { ref } from "vue";
import { useRoute } from "vue-router";

const route = useRoute();
const username = ref(route.params.username);
</script>

<style lang="scss" scoped></style>
