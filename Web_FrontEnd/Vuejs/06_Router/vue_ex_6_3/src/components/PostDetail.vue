<template>
  <div>
    <h2>번호: {{ id }}</h2>
    <h2>제목: {{ post.title }}</h2>
    <h2>내용: {{ post.content }}</h2>
  </div>
</template>

<script setup>
import { ref, watch } from "vue";
import { useRoute } from "vue-router";

const route = useRoute();
const id = ref(route.params.id);
let ids = 0;
const posts = ref([
  { id: ++ids, title: "Post1", content: "내용" },
  { id: ++ids, title: "Post2", content: "내용" },
  { id: ++ids, title: "Post3", content: "내용" },
]);
const post = ref({ id: null, title: '', content: '' });

watch(() => route.params.id, (newId) => {
  const selectedPost = posts.value.find(post => post.id === parseInt(newId));
  if (selectedPost) {
    post.value = selectedPost;
  }
});
</script>

<style scoped></style>
