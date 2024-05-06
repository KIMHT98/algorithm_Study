<script setup></script>

<template>
  <header>
    <div>
      <h1>명함 관리 페이지</h1>
    </div>
  </header>
  <br />
  <br />
  <main>
    <article>
      <p>명합을 관리하는 페이지입니다. 여기에 명함 목록이 표시됩니다.</p>
      <p></p>
    </article>
  </main>
  <footer>
    <h4>&copy;2023 My Business Cards</h4>
  </footer>
</template>

<style scoped>
* {
  box-sizing: border-box;
  margin: 0;
  padding: 0;
}
header {
  display: flex;
  justify-content: center;
  color: white;
}
header div {
  text-align: center;
  height: 150px;
  background-color: rgb(65, 135, 226);
  width: 300px;
  line-height: 150px;
}
main {
  text-align: center;
}
footer {
  text-align: center;
  background-color: beige;
  height: 50px;
  line-height: 80px;
  position: fixed;
  bottom: 0;
  width: 100%;
}
</style>
