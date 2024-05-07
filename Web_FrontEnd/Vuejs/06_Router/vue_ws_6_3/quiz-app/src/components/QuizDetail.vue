<template>
    <div class="quiz">
       <h6>{{quiz.pk}}번 문제. {{quiz.question}}</h6>
       <p>정답 입력</p> 
       <input :id="quiz.pk" type="text"/>
    </div>
</template>

<script setup>
    defineProps({
        quiz: Object
    })
</script>

<style scoped>
.quiz{
    width: 650px;
    border: 1px solid black;
    padding: 10px;
}
input{
    width: 620px;
}
</style>