<template>
  <div>
    <h1>{{ username }}이 작성한 게시글</h1>
    <ol>
      <PostListItem :posts="posts" />
    </ol>
    <hr />
  </div>
  <RouterView />
</template>

<script setup>
import PostListItem from "@/components/PostListItem.vue";
import { ref } from "vue";
import { useRoute } from "vue-router";

const route = useRoute();
let id = 0;
const posts = ref([
  { id: ++id, title: "Post1", content: "내용" },
  { id: ++id, title: "Post2", content: "내용" },
  { id: ++id, title: "Post3", content: "내용" },
]);
const username = ref(route.params.username);
</script>

<style scoped></style>
