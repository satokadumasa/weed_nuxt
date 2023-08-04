export default function({ $axios }) {
    $axios.onRequest(config => {
      console.log("axios localStorage:" + JSON.stringify(window.localStorage));
      config.headers.client = window.localStorage.getItem("client")
      config.headers["access-token"] = window.localStorage.getItem("access-token")
      config.headers.uid = window.localStorage.getItem("uid")
      config.headers["token-type"] = window.localStorage.getItem("token-type")
    })
  
    $axios.onResponse(response => {
      console.log("axios CH002");
      if (response.headers.client) {
        console.log("axios CH003");
        localStorage.setItem("access-token", response.headers["access-token"])
        localStorage.setItem("client", response.headers.client)
        localStorage.setItem("uid", response.headers.uid)
        localStorage.setItem("token-type", response.headers["token-type"])
      }
    })
  }