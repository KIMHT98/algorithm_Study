<template>
    <div>
      <h4>이름 : {{ businessCard.name }}</h4>
      <p>직함 : {{ businessCard.title }}</p>
      <button @click="deleteCardFunc(businessCard)">명함 삭제</button>
    </div>
  </template>
  
  <script setup>
  defineProps({
    businessCard: Object,
  });
  
  const emit = defineEmits("deleteCardEvent");
  const deleteCardFunc = function (businessCard) {
    emit("deleteCardEvent", businessCard);
  };
  </script>
  <style scoped>
  div {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    width: 400px;
    height: 200px;
    border: 1px solid black;
  }
  </style>
  