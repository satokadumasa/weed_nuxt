import colors from 'vuetify/es5/util/colors'

import dotenv from "dotenv";
require('dotenv').config();

const {
  API_URL
} = process.env;

export default {
  server: {
    port: process.env.LISTEN_PORT
  },
  env: {
    API_URL
  },
  // Disable server-side rendering: https://go.nuxtjs.dev/ssr-mode
  ssr: false,

  // Global page headers: https://go.nuxtjs.dev/config-head
  head: {
    titleTemplate: '%s - weed_nuxt',
    title: 'weed_nuxt',
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
      "~/plugins/axios.js"
  ],
  auth: {
    strategies: {
        local: {
            endpoints: {
                login: {
                    url: "auth/sign_in",
                    method: "post",
                    propertyName: "access_token"
                },
                user: {
                    url: "users/mee",
                    propertyName: "data",
                    method: "get"
                },
                logout: {
                    url: "auth/sign_out",
                    method: "post"
                }
            }
        }
    },
    redirect: {
        login: "/auth/login",
        //home: "/"
        redirect: false,
        localStorage: false
    }
  },

  // Auto import components: https://go.nuxtjs.dev/config-components
  components: true,

  // Modules for dev and build (recommended): https://go.nuxtjs.dev/config-modules
  buildModules: [
    // https://go.nuxtjs.dev/eslint
    '@nuxtjs/eslint-module',
    // https://go.nuxtjs.dev/vuetify
    '@nuxtjs/vuetify'
  ],

  // Modules: https://go.nuxtjs.dev/config-modules
  modules: [
    // https://go.nuxtjs.dev/axios
    '@nuxtjs/axios',
    "@nuxtjs/auth",
    "@nuxtjs/dotenv"
  ],
  proxy: {
    '/api': {
      target: process.env.API_URL
      // pathRewrite: {
      //   '^/api' : '/api/v1'
      // }
    }
  },
  // Axios module configuration: https://go.nuxtjs.dev/config-axios
  axios: {
    baseURL: process.env.API_URL,
    proxyHeaders: false,
    credentials: false,
    proxy: false
  },

  // Vuetify module configuration: https://go.nuxtjs.dev/config-vuetify
  vuetify: {
    customVariables: ['~/assets/variables.scss'],
    theme: {
      dark: true,
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

  // Build Configuration: https://go.nuxtjs.dev/config-build
  build: {
  }
}
