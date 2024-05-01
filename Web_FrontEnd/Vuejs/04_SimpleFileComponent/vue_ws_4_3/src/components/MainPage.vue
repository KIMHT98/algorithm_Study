<script setup>
    import SingerDetail from '@/components/singers/SingerDetail.vue';
</script>
<template>
    <div class="container">
        <h1>가수 정보 페이지에 오신 것을 환영합니다</h1>
        <p>여러분이 좋아하는 가수와 아티스트에 대한 정보를 탐색하세요.</p>
        <img src="@/assets/microphone.jpg">
        <br>
        <h2>가수 목록</h2>
        <SingerDetail/>
    </div>
</template>
<style scoped>
    *{
        box-sizing: border-box;
    }
    .container{
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
    }
    img{
        width: 200px;

    }
</style>