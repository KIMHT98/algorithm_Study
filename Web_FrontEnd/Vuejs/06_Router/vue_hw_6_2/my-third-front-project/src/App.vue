<script setup>
  import MainPage from '@/components/MainPage.vue'
  import { RouterLink, RouterView } from "vue-router";
</script>

<template>
  <div>
    <MainPage/>
    <RouterLink :to="{name: 'some'}">Some</RouterLink>
    <span>|</span>
    <RouterLink :to="{name: 'other'}">Other</RouterLink>
  </div>
  <RouterView/>
</template>


<style scoped>

</style>
