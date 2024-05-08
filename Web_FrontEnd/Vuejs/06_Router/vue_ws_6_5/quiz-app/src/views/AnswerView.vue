<template>
    <div class="answer-check">
        <p>{{ pk }}번 문제</p>
        <h4>정답 확인</h4>
        <div class="user-answer">
            <h3 :style="result.style">{{ result.content }}</h3>
            <p :style="result.style">나의 제출 답안: {{ userAnswer }}</p>
            <p>정답: {{ answer }}</p>
        </div>
    </div>
</template>

<script setup>
import { ref, computed } from "vue";
import { useRoute } from "vue-router";

const route = useRoute();
const pk = ref(route.params.pk);
const answer = ref(route.params.answer);
const userAnswer = ref(route.query.userAnswer);
const result = computed(()=>{
    if(userAnswer.value===answer.value){
        return {content: "정답입니다.", style:"color: blue"}
    }else{
        return {content: "오답입니다.", style:"color: red"}
    }
});
</script>

<style scoped>
.answer-check{
    display: flex;
    flex-direction: column;
    align-items: center;
    width: 650px;
    border: 1px solid black;
    padding: 10px;
    margin-left: 10px;
}
.user-answer{
    width: 550px;
    text-align: left;
    border: 1px solid black;
    padding: 10px;
}
</style>