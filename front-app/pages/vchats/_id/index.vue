<template>
  <div class="pa-2">
    <div>
      <v-row class="mb-2 px-6">
        <h1>
          {{ vchat.name }}
        </h1>
        <div 
          style="width: 100%;overflow-wrap: break-word;display: inline-block;hite-space: pre-wrap;white-space: pre-wrap;"
        >{{ vchat.overview }}
        </div>
      </v-row>
    </div>
    <div id="meet">
    </div>
    </script>
  </div>
</template>

<script>
import _ from "lodash";
import { mapGetters } from "vuex";
import BoardComment from "~/components/boards/BoardComment";
import ActionCable from 'actioncable';
import JitsiMeetExternalAPI from '~/mixins//external_api.js';

export default {
  name: 'vchats',
  asyncData({ store, app, query }) {
    console.log("asyncData() id:" + $nuxt.$route.params.id);
    return Promise.all([
      store.dispatch("vchats/asyncvchat",{
        id: !_.isEmpty($nuxt.$route.params.id) ? $nuxt.$route.params.id : 1
      }),
    ]).then((response) => {
      return {
        vchat: _.cloneDeep(store.getters["vchats/vchat"]),
      };
    });
  },
  mounted() {
      const domain = 'jitsi.september-rain.com'; // Jitsi用に使用しているドメイン名
      const options = {
        roomName: this.vchat.name, // チャットルーム名
        width: document.documentElement.clientWidth - 50, // ビデオチャット表示部分の幅
        height: document.documentElement.clientHeight - 250, // ビデオチャット表示部分の高さ
        parentNode: document.querySelector('#meet') // ビデオチャットを表示する要素のID
      };
      const api = new JitsiMeetExternalAPI(domain, options);
  		api.executeCommand('displayName', this.$auth.user.nickname); // ニックネーム（表示名）を指定する
  },
  data() {
    console.log("data()");
    return {
      cable: null,
      chatChannel: null,
      setListener: null,
      body: "",
      form: {
        sender: "",
        username: "",
        user_id: "",
        message: "",
      }
    };
  },
  computed: {
    ...mapGetters({
      messageList: "messageList",
    }),
  },
  methods: {
    home() {
      this.$routes.push('/');
    },
  },
}
</script>
