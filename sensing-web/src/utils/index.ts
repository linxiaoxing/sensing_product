import type { App, Plugin, Component } from 'vue'

export const noop = () => {}

/**
 * / _ - 符号转换成驼峰
 */
export function toHump(name: string) {
  return name.replace(/[\-\/\_](\w)/g, function (_all, letter) {
    return letter.toUpperCase()
  })
}

export const withInstall = <T>(component: T, alias?: string) => {
  const comp = component as any
  comp.install = (app: App) => {
    app.component(comp.name || comp.displayName, component as Component)
    if (alias) {
      app.config.globalProperties[alias] = component
    }
  }
  return component as T & Plugin
}
