<template>
  <div class="pa-2">
    <div>
      <v-row class="mb-2 px-6">
        <div>
          <h3>ニックネーム</h3></h3>
          {{ user.nickname }}
        </div>
        <div 
          style="width: 100%;overflow-wrap: break-word;display: inline-block;hite-space: pre-wrap;"
        >
          <h3>自己紹介</h3>
          {{ user.self_introduction }}
        </div>
        <v-btn
          :disabled="!this.$auth.loggedIn || user.id == $auth.user.id"
          @click="follow(user.id)"
        >
          <img src="/img/bookmark-svgrepo-com.svg" style="width: 20px; height: 20px;">
        </v-btn>
      </v-row>
    </div>
    <br>
    <div style="position: fixed;bottom: 40px;display: flex;">
      <v-btn
        color="primary"
        class="mb-1 mr-1"
        @click="userUpdate"
        :disabled="user.id != $auth.user.id"
      >
        Edit
      </v-btn>
    </div>

  </div>
</template>
<script>
import _ from "lodash";
import { mapGetters } from "vuex";
import PageCreate from "~/components/notes/PageCreate";

export default {
  name: 'userShow',
  components: {
    PageCreate,
  },
  asyncData({ store, app, query }) {
    console.log("asyncData() id:" + $nuxt.$route.params.id);
    return Promise.all([
      store.dispatch("users/asyncUser",{
        id: !_.isEmpty($nuxt.$route.params.id) ? $nuxt.$route.params.id : 1
      }),
    ]).then((response) => {
      return {
        user: _.cloneDeep(store.getters["users/user"]),
      };
    });
  },
  methods: {
    user() {
      this.$store.dispatch(
          "users/asyncUser", 
          {
            id: $nuxt.$route.params.id,
          }
      ).then((response) => {
        this.user = response;
      });
    },
    userUpdate() {

    },
    follow() {
      this.$store.dispatch(
          "users/asyncFollowCreate", 
          {
            followed_id: $nuxt.$route.params.id,
            follower_id: this.$auth.user.id
          }
      ).then((response) => {
        alert(`「${this.user.nickname}」をフォローしました。`);
      }).catch(e => {
        alert(`「${this.user.nickname}」はフォロー済みです。`);
      });
    },
  },
}
</script>
