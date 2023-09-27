<template>
  <div>
    <v-btn 
      color="primary"
      class="mb-1 mr-1" 
      @click="card_comment = true"
    >
      Comment
    </v-btn>
    <v-dialog v-model="card_comment" max-width="880">
      <v-card tile>
        <v-card-title>Board Comment</v-card-title>
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

          <div>
            <v-btn
              color="primary"
              class="mb-1 mr-1"
              @click="boardList"
            >
              Board
            </v-btn>
            <v-btn
              color="primary"
              class="mb-1 mr-1"
              @click="creteBoardComment"
            >
              投稿
            </v-btn>
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
    board_id: 0,
    // board_comments: {},
  },
  data() {
    return {
      card_comment: false,
      is_recept_date_picker: false,
      form: {
        title: "",
        detail: "",
        board_id: this.board_id,
      },
    };
  },
  created() {
    console.log("created() board_id:" + this.board_id);

  },
  methods: {
    boardList() {
      console.log("boardList()");
      this.$router.push('/boards/');
    },
    creteBoardComment() {
      console.log("pagination() this.form:" + JSON.stringify(this.form));
      this.$store.dispatch(
          "boards/asyncBoardCommentCreate", 
          this.form
      ).then((response) => {
          alert("コメント：" + this.form.title + "を投稿しました。");
          this.$store.dispatch(
              "boards/asyncBoardComments", 
              {board_id: this.form.board_id}
          ).then((response) => {
            let board_comments = _.cloneDeep(this.$store.getters["boards/board_comments"]);
            this.$emit('boardComments', board_comments);
            this.card_comment = false;
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