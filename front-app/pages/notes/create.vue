<template>
  <v-app>
    <h1>Note Crate</h1>
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
          説明
        </th>
        <td>
          <textarea
            v-model="form.overview"
            name="input-7-1"
            placeholder="説明"
            style="border: solid 1px; font-size: 13px; width: 100%; height: 200px;"
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
        @click="noteList"
      >
        Notes
      </v-btn>
      <v-btn
        color="primary"
        class="mb-1 mr-1"
        @click="createNote"
      >
        投稿
      </v-btn>
    </div>
  </v-app>
</template>

<script>
export default {
  name: 'notecreate',
  data() {
    return {
      form: {
        title: "",
        overview: "",
        detail: "",
      }
    }
  },
  methods: {
    createNote() {
      console.log("pagination() this.form:" + JSON.stringify(this.form));
      this.$store.dispatch(
          "notes/asyncNoteCreate", 
          this.form
      ).then((response) => {
          alert("ノート：" + this.form.title + "を作成しました。");
          this.$router.push('/notes/');
      })
    },
    noteList() {
      console.log("noteList()");
      this.$router.push('/notes/');
    },
  }
}
</script>
