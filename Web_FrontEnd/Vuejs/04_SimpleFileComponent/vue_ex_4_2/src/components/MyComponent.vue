<template>
  <div>
    <header>
      <h1>My Gallery</h1>
    </header>

    <main>
      <div class="container">
        <div
          class="card col-md-4"
          style="width: 18rem"
          v-for="i in numberOfItems"
          :key="i"
        >
          <img src="@/assets/sample.png" class="card-img-top" alt="..." />
          <div class="card-body">
            <h5 class="card-title">Card title</h5>
            <p class="card-text">
              Some quick example text to build on the card title and make up the
              bulk of the card's content.
            </p>
            <a href="#" class="btn btn-primary">Go somewhere</a>
          </div>
        </div>
      </div>
    </main>
  </div>
</template>

<script setup>
const numberOfItems = 4;
</script>

<style scoped>
* {
  box-sizing: border-box;
}
h1 {
  background-color: aquamarine;
  height: 80px;
  text-align: center;
  line-height: 80px;
  margin: 0;
}
main {
  display: flex;
  /* flex-wrap: wrap; */
  justify-content: center;
  padding: 10px;
  gap: 10px;
}
.container {
  display: flex;
  /* justify-content: center; */
  flex-wrap: wrap;
  gap: 10px;
}
@media (max-width: 575.98px) {
  .card {
    flex: 100%; /* 모바일 화면에서는 전체 너비(1열)로 설정 */
    max-width: 100%;
  }
}

@media (min-width: 576px) and (max-width: 767.98px) {
  .card {
    flex: 50%; /* 태블릿 화면에서는 2열로 설정 */
    max-width: calc(50% - 20px);
  }
}

@media (min-width: 768px) {
  .card {
    flex: 33.33%; /* 데스크탑 화면에서는 3열로 설정 */
    max-width: calc(33.33% - 20px);
  }
}
</style>
