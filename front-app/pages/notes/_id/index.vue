<template>
  <div class="pa-2">
    <div>
      <v-row class="mb-2 px-6">
        <h1>
          {{ note.title }}
        </h1>
        <div>
          [
            <a
              :href="`/users/${note.user.id}`"
            >{{ note.user.nickname }}</a>
          ]
          ({{ $moment(note.created_at).format('YYYY年MM月DD日 HH:m') }})
        </div>
        <div 
          style="width: 100%;overflow-wrap: break-word;display: inline-block;hite-space: pre-wrap;"
        >
          <h3>■説明</h3>
          {{ note.overview }}
        </div>
        <div 
          style="width: 100%;overflow-wrap: break-word;display: inline-block;hite-space: pre-wrap;"
        >
          <h3>■本文</h3>
          {{ note.detail }}
        </div>
        <v-btn
          :disabled="!this.$auth.loggedIn"
          @click="bookmark(note.id)"
        >
          <img src="/img/bookmark-svgrepo-com.svg" style="width: 20px; height: 20px;">
        </v-btn>
      </v-row>
    </div>
    <div>
      <hr></hr>
      <div v-for="(page, key) in pages" :key="key">
        <a 
          :href="`/pages/${page.id}`"
        >
          {{ page.title }}
        </a>
        [
            <a
              :href="`/users/${page.user.id}`"
            >{{ page.user.nickname }}</a>
        ]
        <br>
        {{ $moment(page.created_at).format('YYYY年MM月DD日 HH:m') }}<br>
        <hr></hr>
      </div>
    </div>
    <br>
    <div style="position: fixed;bottom: 40px;display: flex;">
      <v-btn
        color="error"
        class="mb-1 mr-1"
        @click="noteDel"
        :disabled="note.user.id != $auth.user.id"
      >
        Del
      </v-btn>
      <v-btn
        color="primary"
        class="mb-1 mr-1"
        @click="noteUpdate"
        :disabled="note.user.id != $auth.user.id"
      >
        Edit
      </v-btn>
      <v-btn
        color="primary"
        class="mb-1 mr-1"
        @click="noteList"
      >
        Back
      </v-btn>
      <PageCreate
        :note_id="note.id"
        :pages="pages"
        @pageCreate="pageCreate($event, note_id)"
      />
    </div>

  </div>
</template>

<script>
import _ from "lodash";
import { mapGetters } from "vuex";
import PageCreate from "~/components/notes/PageCreate";

export default {
  name: 'noteShow',
  components: {
    PageCreate,
  },
  asyncData({ store, app, query }) {
    console.log("asyncData() id:" + $nuxt.$route.params.id);
    return Promise.all([
      store.dispatch("notes/asyncNote",{
        id: !_.isEmpty($nuxt.$route.params.id) ? $nuxt.$route.params.id : 1
      }),
    ]).then((response) => {
      return {
        note: _.cloneDeep(store.getters["notes/note"]),
        pages: _.cloneDeep(store.getters["notes/pages"]),
      };
    });
  },
  data: () => ({
    note: {},
    // pages: {}
  }),
  created() {
    console.log("created() note:" + JSON.stringify(this.note));
  },
  computed: {
    ...mapGetters({
      pages: "notes/pages",
    }),
  },

  methods: {
    noteList() {
      this.$router.push('/notes/');
    },
    pageCreate(pages) {
      this.pages = pages;
    },
    noteDel() {
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

    noteUpdate() {
      console.log("noteUpdate() note_id:" + $nuxt.$route.params.id);
      this.$router.push('/notes/' + $nuxt.$route.params.id + '/edit');
    },
    setPages(pages) {
      this.pages = pages;
    },
    bookmark() {
      this.$store.dispatch(
          "notes/asyncNoteBookmarkCreate", 
          {
            note_id: $nuxt.$route.params.id,
            user_id: this.$auth.user.id
          }
      ).then((response) => {
        alert(`「${this.note.title}」をブックマークしました。`);
      }).catch(e => {
        alert(`「${this.note.title}」はブックマーク済みです。`);
      });
    },
  },
}
</script>
