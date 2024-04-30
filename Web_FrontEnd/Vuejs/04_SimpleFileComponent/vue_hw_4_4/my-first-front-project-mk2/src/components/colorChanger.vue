<template>
  <div>
    <input type="text" v-model="inputText" />
    <p :class="inputText">
      입력창에 올바른 색상 명을 입력하면 글자색이 바껴요.
    </p>
  </div>
</template>
<script setup>
import { ref } from "vue";
const inputText = ref("");
</script>
<style>
.red {
  color: red;
}
.blue {
  color: blue;
}
.green {
  color: green;
}
</style>
