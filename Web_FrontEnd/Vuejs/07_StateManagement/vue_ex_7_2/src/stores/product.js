import { ref, computed } from "vue";
import { defineStore } from "pinia";

export const useProductStore = defineStore("product", () => {
  const products = ref([
    { id: 1, title: "Product 1", body: "quia et suscipit suscipit recusandae" },
    { id: 2, title: "Product 2", body: "quo iure voluptatem occaecati omnis" },
    { id: 3, title: "Product 3", body: "repudiandae veniam quaerat sunt" },
  ]);
  const productCount = computed(() => {
    return products.value.length;
  });
  const deleteProduct = function (pId) {
    products.value = products.value.filter((product) => product.id != pId);
  };
  return { products, deleteProduct, productCount };
});
