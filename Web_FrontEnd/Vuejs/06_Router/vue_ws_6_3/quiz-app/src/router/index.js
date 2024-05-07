import { createRouter, createWebHistory } from 'vue-router'
import HomeView from '../views/HomeView.vue'
import QuizView from '../views/QuizView.vue'

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/method',
      name: 'home',
      component: HomeView
    },
    {
      path: '/quizs',
      name: 'quiz-list',
      component: QuizView
    }
  
  ]
})

export default router
