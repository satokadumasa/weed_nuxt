<template>
  <v-app>
    <h1>vchat List</h1>
    <v-pagination
      v-model="page"
      :length="max_page"
      :total-visible="10"
      @input="pagination()"
    ></v-pagination>
    <table class="list" style="margin-left: 20px;">
      <tbody>
        <tr class="altrow" v-for="vchat in vchats" v-bind:key="vchat.id">
          <td>
            <a 
              :href="`/vchats/${vchat.id}`"
            >
              {{ vchat.name }}
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
        @click="createvchat"
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
      store.dispatch("vchats/asyncVchats",{
        page: query.page,
        per: query.per,
      }),
    ]).then((response) => {
      console.log("asyncData() response:" + JSON.stringify(response));
      return {
        vchats: _.cloneDeep(store.getters["vchats/vchats"]),
        max_page: _.cloneDeep(store.getters["vchats/max_page"]),
      };
    });
  },
  data() {
    return {
      // vchats: {},
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
  created() {
    console.log("created() vchats:" + JSON.stringify(this.vchats));
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
      
      const query = this.filledValues(this.searchform);
      const VM = this;
      this.$store
        .dispatch("vchats/asyncvchats", this.searchform)
        .then((resposne) => {
          console.log("pagination() resposne:" + JSON.stringify(resposne));
          this.$router.push({ query: query });
          this.boards = _.cloneDeep(
            VM.$store.getters["vchats/vchats"]
          );
        });
    },
    home() {
      this.$router.push('/');
    },
    createvchat() {
      this.$router.push('/vchats/create');
    },
  },
}
</script>
