import { createApp } from 'vue'
import App from './App.vue'
import { router, setupRouter } from '@/router';

async function bootstrap() {
    const app = createApp(App)
    // Configure routing
    // 配置路由
    setupRouter(app);
    app.mount('#app')
}

bootstrap()