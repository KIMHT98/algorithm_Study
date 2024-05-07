<template>
  <div>
    <h1>학생 상세 정보 목록 입니다.</h1>
    <p v-for="student in students" :key="student.id">
      <RouterLink
        :to="{ name: 'students-detail', params: { name: student.name } }"
        >{{ student.name }} 학생 정보 보기</RouterLink
      >
    </p>
  </div>
  <RouterView/>
</template>

<script setup>
import { RouterLink, RouterView } from "vue-router";
import { ref } from "vue";

let id = 0;
const students = ref([
  {
    id: id++,
    name: "김하나",
  },
  {
    id: id++,
    name: "김두리",
  },
  {
    id: id++,
    name: "김서이",
  },
]);
</script>

<style lang="scss" scoped></style>
