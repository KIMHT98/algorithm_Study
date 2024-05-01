<template>
<div class="album">
<div class="card" style="width: 10rem;" v-for="_ in 2">
  <h6 class="card-header">
    앨범 제목
  </h6>
  <div>
        <ul class="list-group list-group-flush album">
            <li class="list-group-item">노래 목록 1</li>
            <li class="list-group-item">노래 목록 2</li>
            <li class="list-group-item">노래 목록 3</li>
        </ul>
    </div>
</div>
</div>
</template>
<script setup></script>
<style scoped>
    .album{
        display: flex;
        justify-content: center;
        gap: 10px;
    }
</style>