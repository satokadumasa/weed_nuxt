<template>
  <v-app>
    <h1>Board Crate</h1>
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
        color="primary"
        class="mb-1 mr-1"
        @click="boardList"
      >
        Boards
      </v-btn>
      <v-btn
        color="primary"
        class="mb-1 mr-1"
        @click="createBoard"
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
        title: "",
        detail: "",
      }
    }
  },
  methods: {
    createBoard() {
      console.log("pagination() this.form:" + JSON.stringify(this.form));
      this.$store.dispatch(
          "boards/asyncBoardCreate", 
          this.form
      ).then((response) => {
          alert("ボード：" + this.form.title + "を作成しました。");
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
