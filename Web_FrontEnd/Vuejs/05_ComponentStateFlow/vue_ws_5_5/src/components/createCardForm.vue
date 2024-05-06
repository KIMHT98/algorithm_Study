<template>
  <div>
    <form @submit.prevent="createCardFunc(inputName, inputContent)">
      <label for="name">이름 </label>
      <input type="text" v-model="inputName" />
      <label for="content"> 직함 </label>
      <input type="text" v-model="inputContent"/>
      <button>명함 추가</button>
    </form>
  </div>
</template>

<script setup>
import {ref} from 'vue';
const emit = defineEmits("createCardEvent");
const createCardFunc = function (name, content) {
  emit("createCardEvent",name, content);
  inputName.value = "";
  inputContent.value = "";
};
let inputName = ref("");
let inputContent = ref("");
</script>

<style scoped></style>
