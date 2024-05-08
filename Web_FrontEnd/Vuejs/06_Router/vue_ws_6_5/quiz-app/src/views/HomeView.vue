<template>
    <div class="home">
        <h4>퀴즈 앱 사용 방법</h4>
        <div class="content">
            <h3>1. 퀴즈 목록 확인하기</h3>
            <p>퀴즈 목록 페이지에서 다양한 퀴즈를 확인하세요.</p>
            <img src="../assets/quizList.png">
        </div>
        <div class="content">
            <h3>2. 퀴즈 생성하기</h3>
            <p>퀴즈는 직접 생성 할 수도 있어요.</p>
            <img src="../assets/quizCreate.png">
        </div>
        <div class="content">
            <h3>3. 정답 페이지</h3>
            <p>작성한 답안이 정답인지 확인하세요.</p>
            <img src="../assets/quizAnswer.png">
        </div>
    </div>
</template>

<script setup>

</script>

<style scoped>
img {
    width: 500px;
}
.home{
    display: flex;
    flex-direction: column;
    gap: 10px;
    padding: 10px;
}
.content{
    border: 1px solid black;
    width: 550px;
    display: flex;
    flex-direction: column;
    justify-content: center;
    padding: 10px;

}
</style>