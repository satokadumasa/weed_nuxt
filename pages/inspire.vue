<template>
  <v-row>
    <v-col class="text-center">
      <div>{{message}}</div>
      <RouterLink to="/">トップページへ</RouterLink>
    </v-col>
  </v-row>
</template>

<script>
export default {
  name: 'InspirePage'
}
</script>
