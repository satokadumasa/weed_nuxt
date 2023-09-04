<template>
  <v-app>
    <v-navigation-drawer
      v-model="drawer"
      :mini-variant="miniVariant"
      :clipped="clipped"
      fixed
      app
    >
      <v-list>
        <v-list-item
          v-for="(item, i) in items"
          :key="i"
          :to="item.to"
          router
          exact
        >
          <v-list-item-action>
            <v-icon>{{ item.icon }}</v-icon>
          </v-list-item-action>
          <v-list-item-content>
            <v-list-item-title>{{ item.title }}</v-list-item-title>
          </v-list-item-content>
        </v-list-item>
      </v-list>
    </v-navigation-drawer>
    <v-app-bar
      :clipped-left="clipped"
      fixed
      app
    >
    <br>
    <br>
    <v-app-bar-nav-icon @click.stop="drawer = !drawer" />
    <v-toolbar-title>{{ title }}</v-toolbar-title>
    <v-spacer />
      <v-btn
        icon
        @click.stop="rightDrawer = !rightDrawer"
      >
        <v-icon>mdi-menu</v-icon>
      </v-btn>
      </v-app-bar>
      <v-main>
        <v-container>
          <Nuxt />
        </v-container>
      </v-main>
      <v-footer
        :absolute="fixed"
        app
      >
      <span>&copy; {{ new Date().getFullYear() }}</span>
    </v-footer>
  </v-app>
</template>

<script>
import ActionCable from 'actioncable';

export default {
  name: 'DefaultLayout',
  data () {
    return {
      messageText: "",
      messageChannel: {},
      messageList: [],
      clipped: false,
      drawer: false,
      fixed: false,
      items: [
        {
          icon: 'mdi-apps',
          title: 'Home',
          to: '/'
        },
        {
          icon: 'mdi-view-dashboard',
          title: 'Boards',
          to: '/boards/'
        },
        {
          icon: 'mdi-book-open-page-variant',
          title: 'Notes',
          to: '/notes/'
        },
        {
          icon: 'mdi-cast',
          title: 'Rooms',
          to: '/rooms/'
        },
        {
          icon: 'mdi-television-classic',
          title: 'Vchats',
          to: '/vchats/'
        },
        {
          icon: 'mdi-chart-bubble',
          title: 'About',
          to: '/about'
        },
        {
          icon: 'mdi-account',
          title: 'Profile',
          to: '/profile'
        },
      ],
      miniVariant: false,
      right: true,
      rightDrawer: false,
      title: process.env.SITE_NAME,
      cable: null,
    }
  },
  created() {
    const websocketUrl = `${process.env.WS_BASE_URL}/cable`;
    this.cable = ActionCable.createConsumer(websocketUrl);

    this.chatChannel = this.cable.subscriptions.create( "SysMessageChannel",{
      received: (data) => {
        this.messageList.push(data);
      },
    });
    this.setListener();
  },
  methods: {
    setListener() {
      // emitで発火させたイベント名にする
      this.$nuxt.$on('updateHeader', this.sendMessage)
    },
    sendMessage(message) {
      this.chatChannel.perform('speak', {
        message: message,
        name: this.$auth.user.nickname,
      });
    },
  }
}
</script>
