import type { App, Component } from 'vue';
import { isObject } from '/@/utils/is';

type EventShim = {
    new (...args: any[]): {
      $props: {
        onClick?: (...args: any[]) => void;
      };
    };
};

export type WithInstall<T> = T & {
    install(app: App): void;
} & EventShim;

export type CustomComponent = Component & { displayName?: string };

export const withInstall = <T extends CustomComponent>(component: T, alias?: string) => {
    (component as Record<string, unknown>).install = (app: App) => {
      const compName = component.name || component.displayName;
      if (!compName) return;
      app.component(compName, component);
      if (alias) {
        app.config.globalProperties[alias] = component;
      }
    };
    return component as WithInstall<T>;
};

export function deepMerge<T = any>(src: any = {}, target: any = {}): T {
  let key: string;
  for (key in target) {
    src[key] = isObject(src[key]) ? deepMerge(src[key], target[key]) : (src[key] = target[key]);
  }
  return src;

}