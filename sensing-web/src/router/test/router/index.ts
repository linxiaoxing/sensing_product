import {createRouter, createWebHistory} from 'vue-router';
import TopView from "./pages/TopView.vue"

const routes = [
    {path: '/', name: 'top', component: TopView},
]

const router = createRouter({
    history: createWebHistory(), // HTML5 History モード
    routes,
})

export default router;