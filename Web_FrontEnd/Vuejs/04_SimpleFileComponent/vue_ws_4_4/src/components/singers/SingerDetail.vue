<script setup></script>
<template>
    <h1>가수 목록</h1>
    <div class="card">
        <h2>가수 이름</h2>

        <img src="@/assets/singer.jpg"/>
        <p>가수 소개글</p>
    </div>
</template>
<style scoped>
    h1{
        color: orange;
    }
    .card{
        display: inline-block;
        text-align: center;
        border: 1px solid black;
        width: 40%;
        margin:20px
    }
    img{
        width: 200px;
        border-radius: 50%
    }
</style>
