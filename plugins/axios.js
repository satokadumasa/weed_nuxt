import _ from "lodash";

export default function({ store, $axios, redirect, app }) {
  if (process.env.DEBUG) {
    $axios.interceptors.request.use(request => {
      console.log("Starting Request: ", {
        method: request.method,
        baseurL: request.baseURL,
        URL: request.url,
        params: request.params
      });
      return request;
    });

    $axios.interceptors.response.use(response => {
      // console.log('Response: ', {'link': response.data.links.first })
      // response.data})
      $axios.setHeader("Access-Control-Allow-Origin", "*");
      return response;
    });
  }

  $axios.interceptors.request.use(config => {
    if (
      !config.url.includes("maps.googleapis.com") &&
      !config.url.includes("amazonaws.com")
    ) {
      const timeZone = Intl.DateTimeFormat().resolvedOptions().timeZone;
      config.headers["Accept-Language"] = "ja";
      if (!_.isEmpty(timeZone)) {
        config.headers["Time-Zone"] = timeZone;
      }
      config.headers.CONTENT_TYPE = "application/json";
      config.headers.Accept = "application/json";
    } else {
      delete config.headers.common.Authorization;
    }
    return config;
  });

  $axios.onResponse(config => {
    $axios.setHeader("Access-Control-Allow-Origin", "*");
    return config;
  });

  $axios.onError(e => {
    const code = parseInt(e.response && e.response.status);
    // if (code === 403) {
    //   app.$auth.logout()
    //   redirect(`/${store.getters.locale}/login`);
    // } else
    if (code === 404 || code === 500 || code === 403) {
      if (process.server) {
        redirect(`/${store.getters.locale}/404`);
      }
    }
  });
}
