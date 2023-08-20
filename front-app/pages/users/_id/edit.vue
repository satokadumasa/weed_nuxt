<template>
  <v-app>
    <h1>User Edit</h1>
    <div style="width: 100%">
      <div style="width: 100%">
        <h3>Nickname</h3></h3>
        <input
          v-model="form.nickname"
          style="border: solid 1px; font-size: 13px; width: 1005;"
          placeholder="タイトル"
          required
        />
      </div>
      <div style="width: 100%">
        <h3>Profile</h3></h3>
        <textarea
          v-model="form.self_introduction"
          name="input-7-1"
          placeholder="説明"
          style="border: solid 1px; font-size: 13px; width: 100%; height: 300px;"
          required
        />
      </div>
    </div>
    <div style="position: fixed;bottom: 40px;display: flex;">
      <v-btn
        color="error"
        class="mb-1 mr-1"
        @click="home"
      >
        Home
      </v-btn>
      <v-btn
        color="primary"
        class="mb-1 mr-1"
        @click="updateUser"
        :disabled="user.id != $auth.user.id"
      >
        投稿
      </v-btn>
    </div>
  </v-app>
</template>

<script>
export default {
  name: 'userEdit',
  data: () => {
    return {
      form: {
        id: $nuxt.$route.params.id,
        nickname: "",
        self_introduction: "",
      }
    }
  },
  asyncData({ store, app, query }) {
    console.log("asyncData() id:" + $nuxt.$route.params.id);
    return Promise.all([
      store.dispatch("users/asyncUser",{
        id: !_.isEmpty($nuxt.$route.params.id) ? $nuxt.$route.params.id : 1
      }),
    ]).then((response) => {
      return {
        user: _.cloneDeep(store.getters["users/user"]),
      };
    });
  },
  created() {
    this.form.nickname = this.user.nickname;
    this.form.self_introduction = this.user.self_introduction;
  },
  methods: {
    updateUser() {
      console.log("updateUser() user_id:" + $nuxt.$route.params.id);
      // this.form.id = $nuxt.$route.params.id;
      console.log("updateUser() this.form:" + JSON.stringify(this.form));
      this.$store.dispatch(
          "users/asyncUserUpdate", 
          this.form
      ).then((response) => {
          alert(this.form.nickname + "さん、ユーザ情報を更新しました。");
          this.$router.push('/users/');
      })
    },
    home() {
      console.log("home()");
      this.$router.push('/');
    },
  }
}
</script>
