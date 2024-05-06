<template>
  <div>
    <h1>쇼핑 애플리케이션</h1>
    <ProductList :products="products" @add-to-cart="addToCart" />
    <p>총 가격: {{ totalPrice }}원</p>
    <Cart :cart="cart" @remove="remove" />
  </div>
</template>

<script setup>
import { ref } from "vue";
import ProductList from "@/components/ProductList.vue";
import Cart from "@/components/Cart.vue";

let id = 0;

const products = ref([
  { id: id++, name: "사과", price: 1000 },
  { id: id++, name: "바나나", price: 1500 },
  { id: id++, name: "딸기", price: 2000 },
  { id: id++, name: "포도", price: 3000 },
  { id: id++, name: "복숭아", price: 2000 },
  { id: id++, name: "수박", price: 5000 },
]);
const cart = ref([]);

let cartId = 0;
//장바구니 넣기
const addToCart = function (product) {
  cart.value.push({
    cartId: cartId++,
    product: product,
  });
  console.log(cart.value.product);
  totalPrice.value += product.price;
};
//장바구니 삭제
const remove = function (item) {
  cart.value = cart.value.filter((c) => c.cartId !== item.cartId);
  totalPrice.value -= item.product.price;
};

const totalPrice = ref(0);
</script>
