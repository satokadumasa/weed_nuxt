module.exports = {
  apps: [
    {
      name: 'september-rain',
      cwd: '/var/www/html/weed_nuxt/front-app',
      exec_mode: 'cluster',
      instances: 1,
      script: './node_modules/.bin/nuxt',
      args: 'start -n ./tmp/nuxt_app.sock',
    }
  ]
}

