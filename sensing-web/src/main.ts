import { createApp } from 'vue'
import App from './App.vue'
import 'uno.css'

import { router, setupRouter } from '/@/router'
import { setupRouterGuard } from '/@/router/guard'
import { setupI18n } from '/@/locales/setupI18n'

async function bootstrap() {
  const app = createApp(App)

  // setup i18n
  await setupI18n(app)

  // setup router
  setupRouter(app)

  // setup router guard
  setupRouterGuard(router)

  // mount
  app.mount('#app')
}

bootstrap()