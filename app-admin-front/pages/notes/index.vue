<template>
  <v-app>
    <h1>Note List</h1>
    <v-pagination
      v-model="page"
      :length="max_page"
      :total-visible="10"
      @input="pagination()"
    ></v-pagination>
    <table class="list" style="margin-left: 20px;">
      <tbody>
        <tr class="altrow" v-for="note in notes" v-bind:key="notes.id">
          <td>
            <v-btn
              color="error"
              class="mb-1 mr-1"
              @click="boardDel(board.id)"
            >
              Del
            </v-btn>
          </td>
          <td>
            <a 
              :href="`/notes/${note.id}`"
            >
              {{ note.title }}
            </a>
          </td>
        </tr>
      </tbody>
    </table>
    <v-pagination
      v-model="page"
      :length="max_page"
      :total-visible="10"
      @input="pagination()"
    ></v-pagination>
    
    <div style="position: fixed;bottom: 40px;display: flex;">
      <v-btn
        color="primary"
        class="mb-1 mr-1"
        @click="createNote"
      >
        New
      </v-btn>
      <v-btn
        color="primary"
        class="mb-1 mr-1"
        @click="home"
      >
      Home
      </v-btn>
    </div>
  </v-app>
</template>

<script>
import _ from "lodash";
export default {
  name: 'notes',
  asyncData({ store, app, query }) {
    return Promise.all([
      store.dispatch("notes/asyncNotes",{
        page: query.page,
        per: query.per,
      }),
    ]).then((response) => {
      return {
        notes: _.cloneDeep(store.getters["notes/notes"]),
        max_page: _.cloneDeep(store.getters["notes/max_page"]),
      };
    });
  },
  data() {
    return {
      notes: {},
      page: !_.isEmpty(this.$nuxt.$route.query.page)
        ? parseInt(this.$nuxt.$route.query.page)
        : 1,
      per: !_.isEmpty(this.$nuxt.$route.query.per)
        ? parseInt(this.$nuxt.$route.query.per)
        : 10,

      searchform: {
        id: !_.isEmpty(this.$nuxt.$route.query.id)
          ? this.$nuxt.$route.query.id
          : "",
        page: !_.isEmpty(this.$nuxt.$route.query.page)
          ? this.$nuxt.$route.query.page
          : "",
        per: !_.isEmpty(this.$nuxt.$route.query.per)
          ? this.$nuxt.$route.query.per
          : "",
      }
    };
  },
  methods: {
    filledValues(values) {
      let data = _.cloneDeep(values);
      return _.pickBy(
        _.transform(data, function (result, value, key) {
          result[key] = _.trim(value);
        }),
        (v) => !_.isEmpty(v)
      );
    },
    async pagination() {
      console.log("pagination()");
      if (_.isEmpty(this.page)) {
        this.searchform.page = this.page;
      }
      if (_.isEmpty(this.per)) {
        this.searchform.per = this.per;
      }
      console.log("pagination() this.searchform:" + JSON.stringify(this.searchform));
      
      const query = this.filledValues(this.searchform);
      const VM = this;
      this.$store
        .dispatch("notes/asyncNotes", this.searchform)
        .then((resposne) => {
          this.$router.push({ query: query });
          this.notes = _.cloneDeep(
            VM.$store.getters["notes/notes"]
          );
        });
    },
    home() {
      this.$router.push('/');
    },
    createNote() {
      this.$router.push('/notes/create');
    },
  },
}
</script>
