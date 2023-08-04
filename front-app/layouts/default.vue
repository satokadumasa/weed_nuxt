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
      clipped: false,
      drawer: false,
      fixed: false,
      items: [
        {
          // icon: 'mdi-apps',
          title: 'Home',
          to: '/'
        },
        {
          // icon: 'mdi-chart-bubble',
          title: 'Boards',
          to: '/boards/'
        },
        {
          // icon: 'mdi-chart-bubble',
          title: 'Notes',
          to: '/notes/'
        },
        {
          // icon: 'mdi-chart-bubble',
          title: 'Inspire',
          to: '/inspire'
        },
      ],
      miniVariant: false,
      right: true,
      rightDrawer: false,
      title: process.env.SITE_NAME
    }
  },
  created() {
    console.log("Before connect(1)");
    const websocketUrl = `${process.env.WS_BASE_URL}/cable`;
    console.log("Before websocketUrl:" + websocketUrl);
    const cable = ActionCable.createConsumer(websocketUrl);

    console.log("Before connect(2)");
    this.messageChannel = cable.subscriptions.create( "ChatChannel",{
      received: (data) => {
        console.log("Before connected data:" + JSON.stringify(data));
        this.$store.commit("addMessage", data);
      },
    })
  },
}
</script>
