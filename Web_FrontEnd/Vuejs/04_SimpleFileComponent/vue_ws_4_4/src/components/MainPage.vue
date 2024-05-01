<script setup>
    import SingerDetail from '@/components/singers/SingerDetail.vue';
</script>
<template>
    <div class="container">
        <h1>가수 정보 페이지에 오신 것을 환영합니다</h1>
        <p>여러분이 좋아하는 가수와 아티스트에 대한 정보를 탐색하세요.</p>
        <img src="@/assets/microphone.jpg">
        <br>
        <SingerDetail/>
        
    </div>
</template>
<style scoped>
    *{
        box-sizing: border-box;
    }
    .container{
        text-align: center;
    }
    img{
        width: 200px;

    }
   
</style>