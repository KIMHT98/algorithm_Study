<script setup>
import { RouterLink, RouterView } from 'vue-router'

</script>

<template>
  <header>

    <div>
      <h1>Quiz 퀴즈</h1>
      <p>여기는 퀴즈의 나라! 놀라운 퀴즈들이 기다리고 있어요. 지금 바로 도전해보세요!</p>
      <nav>
        <RouterLink to="/method">Home</RouterLink>
        <span>&nbsp;|&nbsp;</span>
        <RouterLink to="/quizs">Quiz</RouterLink>
      </nav>
    </div>
  </header>

  <RouterView />
</template>

<style scoped>
header{
  padding: 10px;
}
</style>
