
export interface GlobConfig {
    // Site title
    title: string;
    // Service interface url
    apiUrl: string;
    // Upload url
    uploadUrl?: string;
    //  Service interface url prefix
    urlPrefix?: string;
    // Project abbreviation
    shortName: string;
}

export interface GlobEnvConfig {
    // Site title
    VITE_GLOB_APP_TITLE: string;
    // Service interface url
    VITE_GLOB_API_URL: string;
    // Service interface url prefix
    VITE_GLOB_API_URL_PREFIX?: string;
    // Project abbreviation
    VITE_GLOB_APP_SHORT_NAME: string;
    // Upload url
    VITE_GLOB_UPLOAD_URL?: string;
}

export interface LocaleSetting {
    showPicker: boolean;
    // Current language
    locale: LocaleType;
    // default language
    fallback: LocaleType;
    // available Locales
    availableLocales: LocaleType[];
  }
  
export type LocaleType = 'zh_CN' | 'en' | 'ru' | 'ja' | 'ko';

declare interface ViteEnv {
    VITE_PORT: number;
    VITE_USE_MOCK: boolean;
    VITE_USE_PWA: boolean;
    VITE_PUBLIC_PATH: string;
    VITE_PROXY: [string, string][];
    VITE_GLOB_APP_TITLE: string;
    VITE_GLOB_APP_SHORT_NAME: string;
    VITE_USE_CDN: boolean;
    VITE_DROP_CONSOLE: boolean;
    VITE_BUILD_COMPRESS: 'gzip' | 'brotli' | 'none';
    VITE_BUILD_COMPRESS_DELETE_ORIGIN_FILE: boolean;
    VITE_LEGACY: boolean;
    VITE_USE_IMAGEMIN: boolean;
    VITE_GENERATE_UI: string;
  }