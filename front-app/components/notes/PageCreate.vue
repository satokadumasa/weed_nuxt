<template>
  <div>
    <v-btn class="mb-3 mr-6" @click="page_create = true">
      Page
    </v-btn>
    <v-dialog v-model="page_create" max-width="880">
      <v-card tile>
        <v-card-title>Page</v-card-title>
        <v-card-text style="width: 100%">
          <table style="width: 100%;">
            <tr class="w-100">
              <th class="w-25">
                タイトル
              </th>
              <td class="w-75">
                <input
                  v-model="form.title"
                  style="border: solid 1px; font-size: 13px; width: 100%;"
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
          <div style="text-align: right;">
            <button
              @click="close"
            >
              Close
            </button>
            <button
              @click="pageCreate"
            >
              投稿
            </button>
          </div>
        </v-card-text>
      </v-card>
    </v-dialog>
  </div>
</template>

<script>
import _ from "lodash";
export default {
  props: {
    note_id: 0,
    // page_comments: {},
  },
  data() {
    return {
      page_create: false,
      form: {
        note_id: "",
        title: "",
        detail: "",
        overview: "",
        note_id: this.note_id,
      },
    };
  },
  created() {
    console.log("created() note_id:" + this.note_id);
  },
  methods: {
    close() {
      console.log("pageList()");
      this.page_create = false;
    },
    pageCreate() {
      console.log("pageCreate() this.form:" + JSON.stringify(this.form));
      this.$store.dispatch(
          "notes/asyncPageCreate", 
          this.form
      ).then((response) => {
          // alert("コメント：" + this.form.title + "を投稿しました。");
          this.$store.dispatch(
              "notes/asyncPages", 
              {note_id: this.form.note_id}
          ).then((response) => {
            let pages = response;
            // this.$emit('setPages', pages);
            this.$router.push('/notes/' + this.form.note_id);
            this.page_create = false;
          });
      })
    },
  },
};
</script>

<style scoped lang="scss">
.receipt-plan-table {
  dt {
    width: 20%;
  }
  dd {
    width: 80%;
  }
}

.input-amount {
  display: flex;
  span {
    display: flex;
    align-items: center;
    margin-left: 4px;
  }
}
</style>