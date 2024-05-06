import { createRouter, createWebHistory } from 'vue-router'
import HomeView from '../views/HomeView.vue'
import QuizView from '../views/QuizView.vue'
import AnswerView from '../views/AnswerView.vue'

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
    },
    {
      path: '/answer/:pk/:answer',
      name: 'quiz-answer',
      component: AnswerView
    }
  
  ]
})

export default router
