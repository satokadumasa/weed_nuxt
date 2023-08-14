<template>
  <v-app>
    <h1>Board Edit</h1>
    <table class="w-100">
      <tr class="w-100">
        <th class="w-25">
          タイトル
        </th>
        <td class="w-75">
          <input
            v-model="form.title"
            style="border: solid 1px; font-size: 13px; width: 1005;"
            placeholder="タイトル"
            required
          />
        </td>
      </tr>
      <tr>
        <th style="">
          本文
        </th>
        <td>
          <textarea
            v-model="form.detail"
            name="input-7-1"
            placeholder="本文"
            style="border: solid 1px; font-size: 13px; width: 100%; height: 200px;"
            required
          />
        </td>
      </tr>
    </table>
    <div style="position: fixed;bottom: 40px;display: flex;">
      <v-btn
        color="error"
        class="mb-1 mr-1"
        @click="boardList"
      >
        Board
      </v-btn>
      <v-btn
        color="primary"
        class="mb-1 mr-1"
        @click="updateBoard"
        :disabled="board.user.id != $auth.user.id"
      >
        投稿
      </v-btn>
    </div>
  </v-app>
</template>

<script>
export default {
  name: 'boardcreate',
  data() {
    return {
      form: {
        id: 0,
        title: "",
        detail: "",
      }
    }
  },
  asyncData({ store, app, query }) {
    console.log("asyncData() id:" + $nuxt.$route.params.id);
    return Promise.all([
      store.dispatch("boards/asyncBoard",{
        id: !_.isEmpty($nuxt.$route.params.id) ? $nuxt.$route.params.id : 1
      }),
    ]).then((response) => {
      return {
        board: _.cloneDeep(store.getters["boards/board"]),
        board_comments: _.cloneDeep(store.getters["boards/board_comments"]),
      };
    });
  },
  created() {
    this.form = this.board;
  },
  methods: {
    updateBoard() {
      console.log("uodateBoard() user_id:" + $nuxt.$route.params.id);
      this.form.id = $nuxt.$route.params.id;
      console.log("pagination() this.form:" + JSON.stringify(this.form));
      this.$store.dispatch(
          "boards/asyncBoardUpdate", 
          this.form
      ).then((response) => {
          alert("ボード：" + this.form.title + "を更新しました。");
          this.$router.push('/boards/');
      })
    },
    boardList() {
      console.log("boardList()");
      this.$router.push('/boards/');
    },
  }
}
</script>
