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
        <hr></hr>
        <ul>
          <li :class="{ clickBtn: tab === 1 }" @click="tab = 1">フォロー中</li>
          <li :class="{ clickBtn: tab === 2 }" @click="tab = 2">フォロワー</li></li>
        </ul>
        <div class="content">
          <div v-show="tab === 1" class="content-item">
            <p>フォロー中</p></p>
            <table>
              <tbody>
                <tr v-for="following in followings" v-bind:key="following.id">
                  <td>
                    <a
                      :href="`/users/${following.id}`"
                      style="text-decoration:none"
                    >
                      {{ following.nickname }}
                    </a>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
          <div v-show="tab === 2" class="content-item">
            <p>フォローワー</p>
            <table>
              <tbody>
                <tr v-for="follower in followers" v-bind:key="follower.id">
                  <td>
                    <a
                      :href="`/users/${follower.id}`"
                      style="text-decoration:none"
                    >
                      {{ follower.nickname }}
                    </a>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </v-row>
    </div>
    <br>
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
  data: () => {
    return {
      tab: 1,
    }
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
        followers: _.cloneDeep(store.getters["users/followers"]),
        followings: _.cloneDeep(store.getters["users/followings"]),
      };
    });
  },
  methods: {
    // user() {
    //   this.$store.dispatch(
    //       "users/asyncUser", 
    //       {
    //         id: $nuxt.$route.params.id,
    //       }
    //   ).then((response) => {
    //     this.user = response;
    //   });
    // },
    userView(user_id) {
      this.$router.push(`/users/${user_id}`);
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
<style scoped>
ul {
  width: 100%;
  list-style: none;
  display: flex;
  text-align: center;
}
li {
  background-color: gray;
  color: white;
  width: 100%;
  heightmin: 50px;
  border: 1px solid white;
  padding: 10px;
}
.content {
  margin-left: 10px;
  width: 100%;
  height-min: 200px;
  background-color: rgb(255, 255, 255);
}
.clickBtn {
  width: 100%;
  background-color: rgb(0, 168, 168);
}
</style>