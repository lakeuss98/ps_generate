import { createRouter, createWebHistory } from 'vue-router'
import createTable from '@/views/createTable.vue'
import createAttribut from '@/views/createAttribut.vue'


const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/createTable',
      name: 'createTable',
      component: createTable,
    },
    {
      path: '/createAttribut',
      name: 'createAttribut',
      // route level code-splitting
      // this generates a separate chunk (About.[hash].js) for this route
      // which is lazy-loaded when the route is visited.
      component:createAttribut,
    }
  ]
})

export default router;
