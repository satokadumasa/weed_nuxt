<template>
  <v-app>
    <h1>Room Crate</h1>
    <table class="w-100">
      <tr class="w-100">
        <th class="w-25">
          ROOM名
        </th>
        <td class="w-75">
          <input
            v-model="form.name"
            style="border: solid 1px; font-size: 13px; width: 1005;"
            placeholder="タイトル"
            required
          />
        </td>
      </tr>
      <tr>
        <th style="">
          概要
        </th>
        <td>
          <textarea
            v-model="form.overview"
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
        @click="roomList"
      >
        Boards
      </v-btn>
      <v-btn
        color="primary"
        class="mb-1 mr-1"
        @click="createRoom"
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
    createRoom() {
      console.log("pagination() this.form:" + JSON.stringify(this.form));
      this.$store.dispatch(
          "chat/asyncRoomCreate", 
          this.form
      ).then((response) => {
          alert("ROOM：" + this.form.name + "を作成しました。");
          this.$router.push('/rooms/');
      })
    },
    roomList() {
      console.log("boardList()");
      this.$router.push('/rooms/');
    },
  }
}
</script>
