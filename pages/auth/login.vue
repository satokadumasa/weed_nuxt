<template>
  <v-container>
    <v-card class="ma-2 mx-auto" style="width:500px; aligh:center">
      <v-card-title>
        <div class="text-center">ログイン</div>
      </v-card-title>
      <hr />

      <v-card-text>
        <form>
          <div class="crm_error">{{ responseError }}</div>
          <v-text-field
            v-model="email"
            v-validate="'required'"
            label="ユーザー名"
            data-vv-name="username"
            data-vv-as="ユーザー名"
            @keydown.enter="EnterKey"
          />

          <v-text-field
            v-model="password"
            v-validate="'required'"
            label="パスワード"
            type="password"
            data-vv-name="password"
            data-vv-as="パスワード"
            @keydown.enter="EnterKey"
          />

          <div class="text-center">
            <v-btn color="success" @click="login">ログイン</v-btn>
          </div>
          <!-- <v-btn @click="clear">クリア</v-btn> -->
        </form>
      </v-card-text>
    </v-card>
    <v-snackbar v-model="snackbar.snackbar" :color="snackbar.color">
      <div style="color:white">{{ snackbar.text }}</div>
      <v-btn color="primary" @click="snackbar.snackbar = false">閉じる</v-btn>
    </v-snackbar>
  </v-container>
</template>
<script>
import _ from "lodash";

export default {
  data() {
    return {
      snackbar: {
        snackbar: false,
        text: "正しく入力して下さい",
        color: "error"
      },
      username: "",
      password: "",
      return_data: {},
      responseError: ""
    };
  },
  methods: {
    EnterKey(event) {
      this.login();
    },
    login() {
      this.responseError = "";
      this.$auth
        .loginWith("local", {
          data: {
            email: this.email,
            password: this.password,
          }
        })
        .then(response => {
          console.log("loginSuccess");
          console.log(response);
          // this.$router.go(-1);
          this.$router.push("/");
        })
        .catch(err => {
          if (
            !_.isEmpty(err) &&
            (err.response.status == 422 || err.response.status == 401)
          ) {
            window.localStorage.removeItem("extention");
            sessionStorage.setItem("key", "value");

            this.responseError = "please check you data"; //err.response.data.error;
          }
        });      
    }
  }
}

</script>
