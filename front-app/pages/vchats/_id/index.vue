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
  // components: {
  //   JitsiMeetExternalAPI,
  // },
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
        width: 700, // ビデオチャット表示部分の幅
        height: 700, // ビデオチャット表示部分の高さ
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
  created() {
    // const websocketUrl = `${process.env.WS_BASE_URL}/cable`;
    // this.cable = ActionCable.createConsumer(websocketUrl);
    // console.log("created() user:" + JSON.stringify(this.$auth.user));
    // this.chatChannel = this.cable.subscriptions.create(
    //   {channel: "ChatChannel", vchat: this.vchat.id, user_id: this.$auth.user.id},
    //   {received: (response) => {
    //       console.log("response:" + JSON.stringify(response));
    //       this.$store.commit("addMessage", response);
    //     }
    //   }
    // );
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
    // sendMessage() {
    //   console.log("sendMessage()");
    //   if(!_.isEmpty(this.form.message)) {
    //     this.chatChannel.perform('speak', {
    //       username: this.$auth.user.nickname,
    //       user_id: this.$auth.user.id,
    //       message:this.form.message,
    //     });
    //     this.form.message = "";
    //   }
    // },
  },
}
</script>
