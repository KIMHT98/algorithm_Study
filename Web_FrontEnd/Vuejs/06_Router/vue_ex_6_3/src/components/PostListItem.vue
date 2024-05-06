<template>
  <div>
    <li v-for="post in posts">
      <RouterLink :to="{ name: 'post-detail', params: { id: post.id } }"
        >제목 : {{ post.title }}</RouterLink
      >
      <!-- {{ post.title }} -->
    </li>
  </div>
  <!-- <RouterView />/ -->
</template>

<script setup>
defineProps({
  posts: Array,
});
</script>

<style lang="scss" scoped></style>
