<template>
  <div class="quiz">
    <h6>{{ quiz.pk }}번 문제. {{ quiz.question }}</h6>
    <p>정답 입력</p>
    <input
      :id="quiz.pk"
      type="text"
      v-model="InputAnswer"
      @keyup.enter="submitAnswer"
    />
  </div>
</template>

<script setup>
import { defineProps, ref } from "vue";
import { useRouter } from "vue-router";
const router = useRouter();
const props = defineProps({
  quiz: Object,
});
const InputAnswer = ref("");
const submitAnswer = () => {
  // const InputAnswer = document.getElementById(props.quiz.pk);
  if (InputAnswer) {
    console.log(InputAnswer.value);
    // const userAnswer = InputAnswer.value.trim();
    // if (userAnswer !== "") {
    if (
      window.confirm(
        `${InputAnswer.value} 을/를 답안으로 제출합니다. 확실합니까?`
      )
    ) {
      router.push({
        name: "quiz-answer",
        params: {
          pk: props.quiz.pk,
          answer: props.quiz.answer,
        },
        query: {
          userAnswer: InputAnswer.value,
        },
      });
    } else {
      InputAnswer.value = "";
    }
    // }
  }
};
</script>

<style scoped>
.quiz {
  width: 650px;
  border: 1px solid black;
  padding: 10px;
}
input {
  width: 620px;
}
</style>
