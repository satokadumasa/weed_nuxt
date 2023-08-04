<template>
  <v-app>
    <table class="list">
      <h1>Board List</h1>
      <tbody>
        <tr class="altrow" v-for="board in boards" v-bind:key="boards.id">
          <td>
            <a 
              :href="`/boards/${board.id}`"
            >
              {{ board.title }}
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
        @click="createBoard"
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
  name: 'InspirePage',
  asyncData({ store, app, query }) {
    return Promise.all([
      store.dispatch("boards/asyncBoards",{
        page: query.page,
        per: query.per,
      }),
    ]).then((response) => {
      return {
        boards: _.cloneDeep(store.getters["boards/boards"]),
        max_page: _.cloneDeep(store.getters["boards/max_page"]),
      };
    });
  },
  data() {
    return {
      boards: {},
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
        .dispatch("boards/asyncBoards", this.searchform)
        .then((resposne) => {
          this.$router.push({ query: query });
          this.boards = _.cloneDeep(
            VM.$store.getters["boards/boards"]
          );
        });
    },
    home() {
      this.$router.push('/');
    },
    createBoard() {
      this.$router.push('/boards/create');
    },
  },
}
</script>
