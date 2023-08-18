<template>
  <div class="w-full">

    ■更新情報<br>
    ●Boards<br>
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
    ●Notes<br>
    <div
      v-for="note in notes" v-bind:key="notes.id"
      style="display: flex;flex-wrap: wrap;flex: 1 1 auto;"
    >
      <div style="flex-basis: 0;flex-grow: 1;max-width: 100%;width: 100%;padding: 2px;">
        <a 
          :href="`/notes/${note.id}`"
        >
          {{ note.title }}
        </a>
      </div>
    </div>
    <div>
      <div
        v-for="(item, message) in messageList"
        :key="index"
      >
        {{ message }}<br>
      </div>
    </div>

    <div style="position: fixed;bottom: 40px;display: flex;">
      <v-btn v-if="!this.$auth.loggedIn" variant="primary" to="/signup">SignUp</v-btn>
      <v-btn v-if="!this.$auth.loggedIn" variant="info" @click="toLogin">Login</v-btn>
      <v-btn v-if="this.$auth.loggedIn" variant="danger" @click="logout">Logout</v-btn>
    </div>
</div>
</template>

<script>
import ActionCable from 'actioncable';
import {mapState} from 'vuex';

export default({
  data: function () {
    return {
      message: "",
      messageList: [],
      cable: null,
      chatChannel: null,
      // user_id: this.$auth.user.id,
    }
  },
  asyncData({ store, app, query }) {
    return Promise.all([
      store.dispatch("home/asynHome",{}),
      // store.dispatch("boards/asyncBoards",{page: 1, per:5}),
      // store.dispatch("notes/asyncNotes",{page: 1, per:5}),
    ]).then((response) => {
      return {
        boards: _.cloneDeep(store.getters["home/boards"]),
        notes: _.cloneDeep(store.getters["home/notes"]),
      };
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
  },
})
</script>

<style></style>
