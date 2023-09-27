<template>
  <div class="pa-2">
    <div>
      <v-row class="mb-2 px-6">
        <h1>
          {{ board.title }}
        </h1>
        <div>
          [
            <a
              :href="`/users/${board.user.id}`"
              >{{ board.user.nickname }}</a
            >
          ]
          ({{ $moment(board.created_at).format('YYYY年MM月DD日 HH:m') }})
        </div>
        <div 
          style="width: 100%;overflow-wrap: break-word;display: inline-block;hite-space: pre-wrap;white-space: pre-wrap;"
        >{{ board.detail }}
        </div>
      </v-row>
    </div>
    <div>
      <hr></hr>
      <div v-for="(board_comment, key) in board_comments" :key="key">
        {{ board_comment.title }}
        [
          <a
            :href="`/users/${board_comment.user.id}`"
            >{{ board_comment.user.nickname }}</a
          >
        ]
        <br>
        {{ $moment(board_comment.created_at).format('YYYY年MM月DD日 HH:m') }}<br>
        <div 
          style="width: 100%;overflow-wrap: break-word;display: inline-block;white-space: pre-wrap;"
        >{{ board_comment.detail }}
        </div>
        <hr></hr>
      </div>
    </div>
    <br>
    <div style="position: fixed;bottom: 40px;display: flex;">
      <v-btn
        color="error"
        class="mb-1 mr-1"
        @click="boardDel"
        :disabled="board.user.id != $auth.user.id"
      >
        Del
      </v-btn>
      <v-btn
        color="primary"
        class="mb-1 mr-1"
        @click="boardUpdate"
        :disabled="board.user.id != $auth.user.id"
      >
        Edit
      </v-btn>
      <v-btn
        color="primary"
        class="mb-1 mr-1"
        @click="boardList"
      >
        Back
      </v-btn>
      <BoardComment
        :board_id="board.id"
        :board_comments="board_comments"
        @boardComments="boardComments($event, board_comments)"
      />
    </div>

  </div>
</template>

<script>
import _ from "lodash";
import { mapGetters } from "vuex";
import BoardComment from "~/components/boards/BoardComment";

export default {
  name: 'BoardId',
  components: {
    BoardComment,
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
        // board_comments: _.cloneDeep(store.getters["boards/board_comments"]),
      };
    });
  },
  data: () => ({
    board: {},
    // board_comments: {}
  }),
  created() {
    console.log("created() auth.user:" + JSON.stringify(this.$auth.user));
  },
  computed: {
    ...mapGetters({
      board_comments: "boards/board_comments",
    }),
  },
  methods: {
    boardList() {
      this.$router.push('/boards/');
    },
    boardComments(board_comments) {
      this.board_comments = board_comments;
    },
    boardDel() {
      console.log("pagination() this.form:" + JSON.stringify(this.form));
      this.$store.dispatch(
          "boards/asyncBoardDelete", 
          {id: $nuxt.$route.params.id}
      ).then((response) => {
        this.$router.push('/boards/');
      })

    },
    textReplace(text) {
      var repText = "";
      if (text) {
        repText = text.replace(/\r?\n/g, "<br>");
      }
      return repText;
    },

    boardUpdate() {
      console.log("boardUpdate() board_id:" + $nuxt.$route.params.id);
      this.$router.push('/boards/' + $nuxt.$route.params.id + '/edit');
    },
    bookmark() {
      this.$store.dispatch(
          "boards/asyncBoardBookmarkCreate", 
          {
            board_id: $nuxt.$route.params.id,
            user_id: this.$auth.user.id
          }
      ).then((response) => {
        alert(`「${this.board.title}」をブックマークしました。`);
      }).catch(e => {
        alert(`「${this.board.title}」はブックマーク済みです。`);
      });
    },
  },
}
</script>
