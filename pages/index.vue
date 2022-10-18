<template>
  <v-row justify="center" align="center">
    <v-col cols="12" sm="8" md="6">
      <v-card class="logo py-4 d-flex justify-center">
        <NuxtLogo />
        <VuetifyLogo />
      </v-card>
      <v-card>
        <div>{{message}}</div>
        <RouterLink to="/inspire">トップページへ</RouterLink>
      </v-card>
    </v-col>
  </v-row>
</template>

<script>
export default {
  data: function() {
    return {
      message: 'Hello NextPage!'
    }
  }
}
</script>
