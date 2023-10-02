<template>
  <div class="pa-2">
    <div>
      <v-row class="mb-2 px-6">
        <h1>
          {{ page.title }}
        </h1>
        <br>
        <div>
          [{{ page.user.nickname }}]({{ $moment(page.created_at).format('YYYY年MM月DD日 HH:m') }})
        </div>
        <div 
          style="width: 100%;overflow-wrap: break-word;display: inline-block;hite-space: pre-wrap;"
        >
          <h3>■前置き</h3>
          {{ page.overview }}
        </div>
        <div 
          style="width: 100%;overflow-wrap: break-word;display: inline-block;hite-space: pre-wrap;"
        >
          <h3>■本文</h3>
          {{ page.detail }}
        </div>
      </v-row>
    </div>
    <br>
    <div style="position: fixed;bottom: 40px;display: flex;">
      <v-btn
        color="error"
        class="mb-1 mr-1"
        @click="pageDel"
        :disabled="page.user.id!=$auth.user.id"
      >
        Del
      </v-btn>
      <v-btn
        color="primary"
        class="mb-1 mr-1"
        @click="pageUpdate"
        :disabled="page.user.id!=$auth.user.id"
      >
        Edit
      </v-btn>
      <v-btn
        color="primary"
        class="mb-1 mr-1"
        @click="note"
      >
        Back
      </v-btn>
    </div>

  </div>
</template>

<script>
import _ from "lodash";
import { mapGetters } from "vuex";

export default {
  name: 'NoteId',
  components: {
  },
  asyncData({ store, app, query }) {
    console.log("asyncData() id:" + $nuxt.$route.params.id);
    return Promise.all([
      store.dispatch("notes/asyncPage",{
        id: !_.isEmpty($nuxt.$route.params.id) ? $nuxt.$route.params.id : 1
      }),
    ]).then((response) => {
      return {
        // note: _.cloneDeep(store.getters["notes/note"]),
        page: _.cloneDeep(store.getters["notes/page"]),
      };
    });
  },
  data: () => ({
    page: {},
  }),
  created() {
    console.log("created() page:" + JSON.stringify(this.page));
  },
  computed: {
    ...mapGetters({
    }),
  },

  methods: {
    note() {
      // this.$router.push('/notes/' + this.page.note_id);
      console.log("note() this.page.note_id:" + this.page.note_id);
      document.location = '/notes/' + this.page.note_id;
    },
    pageDel() {
      console.log("pagination() this.form:" + JSON.stringify(this.form));
      this.$store.dispatch(
          "notes/asyncNoteDelete", 
          {id: $nuxt.$route.params.id}
      ).then((response) => {
        this.$router.push('/notes/');
      })

    },
    textReplace(text) {
      var repText = "";
      if (text) {
        repText = text.replace(/\r?\n/g, "<br>");
      }
      return repText;
    },

    pageUpdate() {
      console.log("pageUpdate() note_id:" + $nuxt.$route.params.id);
      this.$router.push('/notes/edit/' + $nuxt.$route.params.id);
    }
  },
}
</script>
