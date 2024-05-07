<template>
  <div class="quiz-list">
      <QuizCreate @create-quiz="updateQuiz"/>
        <QuizDetail v-for="quiz in sortedQuizs" :quiz="quiz"/>
    </div>
  </template>
  
  <script setup>
  import QuizDetail from '@/components/QuizDetail.vue'
  import QuizCreate from '@/components/QuizCreate.vue'
  import { ref, computed } from "vue";
  let id = 0;
  const quizs = ref([
    {
      pk: ++id,
      question:
        "Python웹 프레임워크 중 하나로, 마이크로 웹 프레임워크로 빠른 개발을 지원하는 것은?",
      answer: "flask",
    },
    {
      pk: ++id,
      question: "HTML에서 텍스트 입력란을 만드는데 사용되는 요소는?",
      answer: "input",
    },
    {
      pk: ++id,
      question: "웹 어플리케이션에서 클라이언트의 데이터를 서버로 전송할 때 주로 사용하는 HTTP 메서드는?",
      answer: "post"
    },
    {
        pk: ++id,
        question: "Python의 가상 환경을 만들어 프로젝트 별로 라이브러리 의존성을 격리시키는 명령어는?",
        answer: "virtualenv"
    },
    {
        pk: ++id,
        question: "웹 어플리케이션을 개발할 때, 사용자의 브라우저에 보여지는 부분을 렌더링하는 언어는 무엇인가요?",
        answer: "html"
    }
  ]);
  const updateQuiz = function(question, answer){
    const quiz = {pk: quizs.value.length+1, question:question, answer:answer}
    if(quiz.question !== "" && quiz.answer !== ""){
      quizs.value.push(quiz)

    }else{
      alert("내용을 입력해주세요.")
    }
  }
  
  const sortedQuizs = computed(() => {
  return quizs.value.sort((a, b) => b.pk - a.pk);
});
  </script>
  
<style scoped>
    .quiz-list{
        display: flex;
        flex-direction: column;
        padding: 10px;
        gap: 10px;
    }
</style>
  