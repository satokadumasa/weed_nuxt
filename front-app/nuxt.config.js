import colors from 'vuetify/es5/util/colors'
import dotenv from "dotenv";

require('dotenv').config();
const {
  API_URL,
  API_BASE_URL,
  LISTEN_PORT,
  SITE_NAME,
  WS_BASE_URL,
  WS_PORT,
} = process.env;

export default {
  server: {
    port: process.env.LISTEN_PORT
  },
  env: {
    API_URL,
    API_BASE_URL,
    LISTEN_PORT,
    SITE_NAME,
    WS_BASE_URL,
    WS_PORT,
  },
  // Disable server-side rendering: https://go.nuxtjs.dev/ssr-mode
  ssr: false,

  // Global page headers: https://go.nuxtjs.dev/config-head
  head: {
    titleTemplate: '%s',
    title: process.env.SITE_NAME,
    htmlAttrs: {
      lang: 'en'
    },
    meta: [
      { charset: 'utf-8' },
      { name: 'viewport', content: 'width=device-width, initial-scale=1' },
      { hid: 'description', name: 'description', content: '' },
      { name: 'format-detection', content: 'telephone=no' }
    ],
    link: [
      { rel: 'icon', type: 'image/x-icon', href: '/favicon.ico' }
    ]
  },

  // Global CSS: https://go.nuxtjs.dev/config-css
  css: [
  ],

  // Plugins to run before rendering page: https://go.nuxtjs.dev/config-plugins
  plugins: [
    '~/plugins/axios.js',
  ],

  // Auto import components: https://go.nuxtjs.dev/config-components
  components: true,

  // Modules for dev and build (recommended): https://go.nuxtjs.dev/config-modules
  buildModules: [
    // https://go.nuxtjs.dev/vuetify
    '@nuxtjs/vuetify',
  ],

  // Modules: https://go.nuxtjs.dev/config-modules
  modules: [
    // https://go.nuxtjs.dev/axios
    "@nuxtjs/moment",
    '@nuxtjs/axios',
    '@nuxtjs/auth',
  ],

  // Axios module configuration: https://go.nuxtjs.dev/config-axios
  // axios: {
  //   // Workaround to avoid enforcing hard-coded localhost:3000: https://github.com/nuxt-community/axios-module/issues/308
  //   baseURL: '/',
  // },
  axios: {
    baseURL: process.env.API_URL,
    proxyHeaders: false,
    credentials: false,
    proxy: false
  },
  router: {
    base: "/",
    middleware: ["auth"]
  },

  // Vuetify module configuration: https://go.nuxtjs.dev/config-vuetify
  vuetify: {
    customVariables: ['~/assets/variables.scss'],
    theme: {
      dark: false,
      themes: {
        dark: {
          primary: colors.blue.darken2,
          accent: colors.grey.darken3,
          secondary: colors.amber.darken3,
          info: colors.teal.lighten1,
          warning: colors.amber.base,
          error: colors.deepOrange.accent4,
          success: colors.green.accent3
        }
      }
    }
  },
  // auth: {
  //   strategies: {
  //     local: {
  //       endpoints: {
  //         login: { url: '/auth/sign_in', method: 'post', propertyName: 'access-token' },
  //         user: { url: '/users/me' },
  //         logout: false,
  //       },
  //     },
  //   },
  // },
  auth: {
    redirect: {
      login: '/login', //middleware:authを設定したURLにアクセスがあった場合の、リダイレクト先。
      logout: '/', //ログアウト後のリダイレクト先
      callback: false,
      home: '/' ///ログイン後のリダイレクト先。
     },
    strategies: {
      local: {
        endpoints: {
          //ログイン処理に関する設定
          login: { url: '/auth/sign_in', method: 'post',propertyName: 'access_token'}, 
          //ログアウト処理に関する設定
          logout: { url: '/auth/sign_out', method: 'delete' },
          //ログイン時にユーザー情報を保存するか。
          // user: false 
          user: {
            url: "/users/me",
            propertyName: "data",
            method: "get"
          },
        },
      }
     },
   },
  redirect: {
    login: '/login',
    logout: '/login',
    home: '/',
  },

  // Build Configuration: https://go.nuxtjs.dev/config-build
  build: {
  }
}
