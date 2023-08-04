<template>
  <v-app>
    <h1>Sign Up</h1></h1>
    <table class="w-100">
      <tr class="w-100">
        <th class="w-25">
          ニックネーム
        </th>
        <td class="w-75">
          <input
            v-model="form.nickname"
            style="border: solid 1px; font-size: 13px; width: 100%;"
            placeholder="ニックネーム"
            required
          />
        </td>
      </tr>
      <tr>
        <th style="">
          メールアドレス
        </th>
        <td>
          <input
            v-model="form.email"
            style="border: solid 1px; font-size: 13px; width: 100%;"
            placeholder="メールアドレス"
            required
          />
        </td>
      </tr>
      <tr>
        <th style="">
          パスワード
        </th>
        <td>
          <input
            v-model="form.password"
            style="border: solid 1px; font-size: 13px; width: 100%;"
            placeholder="パスワード"
            required
          />
        </td>
      </tr>
      <tr>
        <th style="">
          パスワード（確認）
        </th>
        <td>
          <input
            v-model="form.password_confirmation"
            style="border: solid 1px; font-size: 13px; width: 100%;"
            placeholder="パスワード（確認）"
            required
          />
        </td>
      </tr>
      </table>
    <div style="position: fixed;bottom: 40px;display: flex;">
      <v-btn
        color="primary"
        class="mb-1 mr-1"
        @click="creatUser"
      >
        投稿
      </v-btn>
    </div>
  </v-app>
</template>

<script>
export default {
  name: 'signup',
  auth: false,
  data() {
    return {
      form: {
        uid: "",
        nickname: "",
        email: "",
        password: "",
        password_confirmation: "",
      }
    }
  },
  methods: {
    creatUser() {
      console.log("pagination() this.form:" + JSON.stringify(this.form));
      this.form.uid = this.form.email;
      this.$store.dispatch(
          "users/asyncUserCreate", 
          this.form
      ).then((response) => {
          alert("ノート：" + this.form.title + "を作成しました。");
          this.$router.push('/login');
      })
    },
    noteList() {
      console.log("noteList()");
      this.$router.push('/notes/');
    },
  }
}
</script>
