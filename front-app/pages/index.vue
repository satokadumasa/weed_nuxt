<template>
  <div class="w-full">
    ■Boards
    <div
      v-for="board in boards" v-bind:key="boards.id"
      style="display: flex;flex-wrap: wrap;flex: 1 1 auto;"
    >
      <div style="flex-basis: 0;flex-grow: 1;max-width: 100%;width: 100%;padding: 2px;">
        <a 
          :href="`/boards/${board.id}`"
        >
          {{ board.title }}
        </a>
      </div>
    </div>
    <div
      style="display: flex;flex-wrap: wrap;flex: 1 1 auto;"
    >
      <input
        v-model="message"
        style="border: solid 1px; font-size: 13px; width: 100％;"
        placeholder="メッセージ"
        required
      />
      <v-btn
        color="primary"
        class="mb-1 mr-1"
        @click="send"
      >
        送信
      </v-btn>
    </div>

    <div>
      <div
        v-for="message in messageList"
      >
        {{ message }}<br>
      </div>
    </div>

    <div style="position: fixed;bottom: 40px;display: flex;">
      <v-btn v-if="!this.$auth.loggedIn" variant="primary" to="/signup">サインアップ</v-btn>
      <v-btn v-if="!this.$auth.loggedIn" variant="info" @click="toLogin">ログイン</v-btn>
      <v-btn v-if="this.$auth.loggedIn" variant="success" to="/update">アカウント情報</v-btn>
      <v-btn v-if="this.$auth.loggedIn" variant="danger" @click="logout">ログアウト</v-btn>
    </div>
</div>
</template>

<script>
import ActionCable from 'actioncable';
export default({
  data: function () {
    return {
      message: "",
      messageList: [],
      cable: null,
      chatChannel: null,
    }
  },
  asyncData({ store, app, query }) {
    return Promise.all([
      store.dispatch("boards/asyncBoards",{page: 1, per:5}),
    ]).then((response) => {
      return {
        boards: _.cloneDeep(store.getters["boards/boards"]),
      };
    });
  },
  created() {
    const websocketUrl = `${process.env.WS_BASE_URL}/cable`;
    this.cable = ActionCable.createConsumer(websocketUrl);

    this.chatChannel = this.cable.subscriptions.create( "ChatChannel",{
      received: (data) => {
        console.log("created() data:" + JSON.stringify(data));
        this.messageList.push(data);
      },
    });
  },
  methods: {
    async logout() {
      await this.$auth.logout()
      .then( 
        ()=>{
          localStorage.removeItem("access-token")
          localStorage.removeItem("client")
          localStorage.removeItem("uid")
          localStorage.removeItem("token-type")
        }
      )
    },
    toLogin() {
      this.$router.push("/login");
    },
    send() {
      console.log("this.message:" + JSON.stringify(this.message));
      this.chatChannel.perform('speak', {
        message: this.message,
        name: this.$auth.user.nickname,
      });
      this.message = "";
    },
  },
})
</script>

<style></style>
