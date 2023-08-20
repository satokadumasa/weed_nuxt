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
                  {{ following.nickname }}
                </td>
                <td>
                  <v-btn
                    @click="remove(following)"
                  >
                    <img src="/img/bookmark-svgrepo-com.svg" style="width: 20px; height: 20px;">
                  </v-btn>
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
                  {{ follower.nickname }}
                </td>
                <td>
                  <v-btn
                    @click="remove2(follower)"
                  >
                    <img src="/img/bookmark-svgrepo-com.svg" style="width: 20px; height: 20px;">
                  </v-btn>
                </td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>


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

export default {
  name: 'profile',
  data: () => {
    return {
      tab: 1,
    }
  },
  asyncData({ store, app, query }) {
    console.log("user_id:" + store.$auth.user.id);
    return Promise.all([
      store.dispatch("users/asyncUser",{
        id: store.$auth.user.id
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
    remove(user) {
      this.$store.dispatch(
          "users/asyncFollowDestroy", 
          {
            followed_id: user.id,
            follower_id: this.$auth.user.id
          }
      ).then((response) => {
        alert(`「${user.nickname}」をリムーブしました。`);
        this.$store.dispatch(
            "users/asyncUser", 
            {
              id: this.$auth.user.id
            }
        ).then((response) => {
          console.log("response:" + JSON.stringify(response));
          this.user  = response.user;
          this.followers  = response.followers;
          this.followings  = response.followings;
        });


      });
    },
    remove2(user) {
      this.$store.dispatch(
          "users/asyncFollowDestroy", 
          {
            followed_id: this.$auth.user.id,
            follower_id: user.id
          }
      ).then((response) => {
        alert(`「${user.nickname}」をリムーブしました。`);
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
  background-color: rgb(168, 168, 168);
}
</style>