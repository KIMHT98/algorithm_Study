<template>
    <div>
        <h1>학생 상세 정보 페이지입니다.</h1>
        <p>이름 : {{name}}</p>
    </div>
</template>

<script setup>
import { ref,watch } from "vue";
import { useRoute } from "vue-router";

const route = useRoute();
const name = ref(route.params.name);
watch(()=>route.params.name, (newName)=>{
    name.value = newName
})

</script>

<style scoped>

</style>