import MainView from "@/views/MainView.vue";
import { createRouter, createWebHistory } from "vue-router";
import UpdateView from "@/views/UpdateView.vue";

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: "/",
      name: "main",
      component: MainView,
    },
    {
      path: "/update/:name",
      name: "update",
      component: UpdateView,
    },
  ],
});

export default router;
