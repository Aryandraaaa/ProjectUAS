<template>
    <div>
        <div class="container mt-4">
            <v-row align="center">
                <v-col>
                    <text-center>
                        <h1 v-if="user">Hi {{ user.firstName }}!</h1>
                    </text-center>
                    <text-center>
                        <h2>Welcome to MarketPlace House Of ASPAD</h2>
                    </text-center>
                    <text-center>
                        <img src="/src/assets/market.png" alt="Logo" style="height:500px;" />
                    </text-center>
                </v-col>
            </v-row>
        </div>
    </div>
</template>
  
  <script>
  import { useStore } from 'vuex';
  
  export default {
    name: 'Home',
    setup() {
      const store = useStore();
      return {
        user: store.state.user
      };
    },
  };
  </script>
  