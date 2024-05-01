
<template>
    
    <div class="card">
        <h2>가수 이름</h2>

        <img src="@/assets/singer.jpg"/>
        <br>
        <br>
        <p>가수 소개글</p>
        <SingerAlbum />
    </div>
</template>
<script setup>
    import SingerAlbum from '@/components/singers/SingerAlbum.vue';
</script>
<style scoped>
    .card{
        display: inline-block;
        text-align: center;
        border: 1px solid black;
        width: 40%;
        margin:20px;
        padding: 20px;
    }
    img{
        width: 200px;
        border-radius: 50%
    }
</style>
