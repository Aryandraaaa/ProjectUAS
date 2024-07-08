<!-- src/components/Logout.vue -->
<template>
    <div>
      <h1>Logout</h1>
      <button @click="logout">Logout</button>
    </div>
  </template>
  
  <script>
  import { useStore } from 'vuex';
  import { useRouter } from 'vue-router';
  
  export default {
    setup() {
      const store = useStore();
      const router = useRouter();
  
      const logout = () => {
        store.dispatch('logout');
        router.push('/');
      };
  
      return {
        logout,
      };
    },
  };
  </script>
  