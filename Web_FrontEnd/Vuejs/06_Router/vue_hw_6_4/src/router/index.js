import { createRouter, createWebHistory } from "vue-router";
import SomeView from "../views/SomeView.vue";
import StudentsView from "../views/StudentsView.vue";

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: "/",
      name: "some",
      component: SomeView,
    },
    {
      path: "/other",
      name: "other",
      // route level code-splitting
      // this generates a separate chunk (About.[hash].js) for this route
      // which is lazy-loaded when the route is visited.
      component: () => import("../views/OtherView.vue"),
    },
    {
      path: "/students",
      name: "students",
      component: StudentsView,
    },
    {
      path: "/students/:name",
      name: "students-detail",
      component: () => import("../views/StudentDetailView.vue"),
    },
  ],
});

export default router;
