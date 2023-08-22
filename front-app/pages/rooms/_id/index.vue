<template>
  <div class="pa-2">
    <div>
      <v-row class="mb-2 px-6">
        <h1>
          {{ room.name }}
        </h1>
        <div 
          style="width: 100%;overflow-wrap: break-word;display: inline-block;hite-space: pre-wrap;white-space: pre-wrap;"
        >{{ room.overview }}
        </div>
      </v-row>
      <input
        v-model="form.message"
        style="border: solid 1px; font-size: 13px; width: 1005;"
        placeholder="タイトル"
        required
      />
      <v-btn
        :disabled="!this.$auth.loggedIn"
        @click="sendMessage()"
      >
        <img src="/img/bookmark-svgrepo-com.svg" style="width: 20px; height: 20px;">
      </v-btn>
    </div>
    <div>
      <hr></hr>
      <div v-for="(message, key) in messageList" :key="key">
        {{ message.sender }}
        <br>
        <div 
          style="width: 100%;overflow-wrap: break-word;display: inline-block;white-space: pre-wrap;"
        >{{ message.message }}
        </div>
        <hr></hr>
      </div>
      <hr></hr>
    </div>
    <br>
    <div style="position: fixed;bottom: 40px;display: flex;">
      <v-btn
        color="primary"
        class="mb-1 mr-1"
        @click="home"
      >
        Home
      </v-btn>
    </div>

  </div>
</template>

<script>
import _ from "lodash";
import { mapGetters } from "vuex";
import BoardComment from "~/components/boards/BoardComment";
import ActionCable from 'actioncable';

export default {
  name: 'chatRoom',
  asyncData({ store, app, query }) {
    console.log("asyncData() id:" + $nuxt.$route.params.id);
    return Promise.all([
      store.dispatch("chat/asyncRoom",{
        id: !_.isEmpty($nuxt.$route.params.id) ? $nuxt.$route.params.id : 1
      }),
    ]).then((response) => {
      return {
        room: _.cloneDeep(store.getters["chat/room"]),
      };
    });
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
        message: "",
      }
    };
  },
  created() {
    const websocketUrl = `${process.env.WS_BASE_URL}/cable`;
    this.cable = ActionCable.createConsumer(websocketUrl);

    this.chatChannel = this.cable.subscriptions.create(
      {channel: "ChatChannel", room: this.room.id},
      {received: (response) => {
          console.log("response:" + JSON.stringify(response));
          this.$store.commit("addMessage", response);
        }
      }
    );
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
    sendMessage() {
      console.log("sendMessage()");
      this.chatChannel.perform('speak', {
        message:this.form.message,
        sender: this.$auth.user.nickname,
      });
    },
  },
}
</script>
