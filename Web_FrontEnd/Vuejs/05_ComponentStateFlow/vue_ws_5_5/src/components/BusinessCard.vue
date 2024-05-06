<template>
  <createCardForm
 
  @create-card-event="createCardFunc" />
  <h3>보유 명함 목록</h3>
    <p>
      {{
        businessCards.length
          ? "현재 보유중인 명함 수 :" + businessCards.length
          : "명함이 없습니다. 명함 추가해주세요."
      }}
    </p>
    <div class="card">
      <businessCardDetail
        :business-card="card"
        v-for="card in businessCards"
        @delete-card-event="deleteCardFunc"
      />
    </div>
  </template>
  
  <script setup>
  import { ref } from "vue";
  import businessCardDetail from "@/components/businessCardDetail.vue";
  import createCardForm from "@/components/createCardForm.vue";
  const businessCards = ref([
    { name: "일론 머스크", title: "테슬라 테크노킹" },
    { name: "래리 엘리슨", title: "오라클 창업주" },
    { name: "빌 게이츠", title: "마이크로소프트 공동창업주" },
    { name: "래리 페이지", title: "구글 공동창업주" },
    { name: "세르게이 브린", title: "구글 공동창업주" },
  ]);
  const deleteCardFunc = function (card) {
    businessCards.value = businessCards.value.filter((c) => c.name !== card.name);
  };
  const createCardFunc = function(name, content){
    const newCard = {name: name, title: content}
    console.log(newCard)
    businessCards.value.push(newCard);

  }
  </script>
  <style scoped>
  .card {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    gap: 20px;
    width: 70%;
  }
  </style>
  