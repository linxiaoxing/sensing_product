import type { AppRouteRecordRaw, AppRouteModule } from '/@/router/types';
import { PageEnum } from '/@/enums/pageEnum';
// import { t } from '@/hooks/web/useI18n';

// 根路由
export const RootRoute: AppRouteRecordRaw = {
    path: '/',
    name: 'Root',
    redirect: PageEnum.BASE_HOME,
    meta: {
        title: 'Root'
    }
};

export const LoginRoute: AppRouteRecordRaw = {
    path: '/login',
    name: 'Login',
    component: () => import('/@/views/sys/login/Login.vue'),
    meta: {
      //title: t('routes.basic.login'),
      title: 'routes.basic.login',
    },
};

// Basic routing without permission
// 未经许可的基本路由
// 許可のない基本ルーティング
export const basicRoutes = [
    LoginRoute,
    RootRoute
];  