import { ref, computed } from 'vue'
import { defineStore } from 'pinia'

export const useProductStore = defineStore('product', () => {
const productList = ref([
  {
    name: "상품1",
    imagePath: "src/assets/img/product1.png",
    price: 10000,
    isFavorite: false,
  },
  {
    name: "상품2",
    imagePath: "src/assets/img/product2.png",
    price: 20000,
    isFavorite: false,
  },
  {
    name: "상품3",
    imagePath: "src/assets/img/product3.png",
    price: 30000,
    isFavorite: false,
  },
  {
    name: "상품4",
    imagePath: "src/assets/img/product4.png",
    price: 40000,
    isFavorite: false,
  },
]);
const changeColor = function(name){
  const idx = productList.value.findIndex(pro=>pro.name===name);
  productList.value[idx].isFavorite = !productList.value[idx].isFavorite
  console.log(favoriteCnt.value);
}
const favoriteCnt = computed(()=>{
  return productList.value.filter(pro=>pro.isFavorite).length
})
  return { productList,changeColor,favoriteCnt }
})
