<script setup>
import { RouterLink, RouterView } from 'vue-router'
import MainPage from '@/components/MainPage.vue';

</script>

<template>
  <header>
    <div class="wrapper">
      <MainPage />
      <nav>
        <RouterLink to="/">Some </RouterLink>
        <span>|</span>
        <RouterLink to="/other">Other </RouterLink>
        <span>|</span>
        <RouterLink to="/students">Students </RouterLink>
        
      </nav>
    </div>
  </header>
  <RouterView />

</template>

<style scoped>

</style>
