<template>
  <v-app>
    <h1>Room List</h1>
    <v-pagination
      v-model="page"
      :length="max_page"
      :total-visible="10"
      @input="pagination()"
    ></v-pagination>
    <table class="list" style="margin-left: 20px;">
      <tbody>
        <tr class="altrow" v-for="room in rooms" v-bind:key="room.id">
          <td>
            <a 
              :href="`/rooms/${room.id}`"
            >
              {{ room.name }}
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
        @click="createRoom"
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
      store.dispatch("chat/asyncRooms",{
        page: query.page,
        per: query.per,
      }),
    ]).then((response) => {
      return {
        rooms: _.cloneDeep(store.getters["chat/rooms"]),
        max_page: _.cloneDeep(store.getters["chat/max_page"]),
      };
    });
  },
  data() {
    return {
      rooms: {},
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
        .dispatch("chat/asyncRooms", this.searchform)
        .then((resposne) => {
          this.$router.push({ query: query });
          this.boards = _.cloneDeep(
            VM.$store.getters["chat/rooms"]
          );
        });
    },
    home() {
      this.$router.push('/');
    },
    createRoom() {
      this.$router.push('/rooms/create');
    },
  },
}
</script>
