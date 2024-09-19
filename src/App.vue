<script >
import { RouterView } from 'vue-router';
import DefaultLayout from './layouts/default.vue';

export default {
  name: "App",
  components: {
    DefaultLayout,
  },
};
</script>

<template>
  <DefaultLayout>
    <RouterView />
  </DefaultLayout>
</template>
