<template>
  <div class="create-quiz">
    <h4>퀴즈 생성</h4>
    <form @submit.prevent="updateQuiz">
      <label>문제</label>
      <textarea v-model="question"></textarea>
      <label>답안</label>
      <input v-model="answer" type="text" />
      <br />
      <button type="submit">퀴즈 생성</button>
    </form>
  </div>
</template>

<script setup>
import { ref, watch } from "vue";
const question = ref("");
const answer = ref("");
const emit = defineEmits(["createQuiz", "inputChange"]);
const updateQuiz = function () {
  emit("createQuiz", question.value, answer.value);
  question.value = "";
  answer.value = "";
};
watch([question, answer], ([newQuestion, newAnswer]) => {
  const isWriting = newQuestion !== "" || newAnswer !== "";
  emit("inputChange", { isWriting });
  //   console.log(isWriting);
});
</script>

<style scoped>
.create-quiz {
  display: flex;
  flex-direction: column;

  width: 650px;
  border: 1px solid black;
  padding: 10px;
}
textarea {
  width: 620px;
}
input {
  width: 620px;
}
button {
  width: 620px;
  text-align: center;
}
</style>
