<template>
    
    <div>
        <v-row align="center">
        <text-center>
                        <h1 v-if="user">Hi {{ user.firstName }}!</h1>
                    </text-center>
                    <text-center>
                        <h2>Welcome to MarketPlace House Of ASPAD</h2>
                    </text-center>
                </v-row>
        <div class="row">
      <div class="col-md-6">
        
        <div class="d-flex h-100">
            
            <div class="justify-content-center align-self-center">
                <h2><strong>Pakaian Murah</strong><br>Hanya Di sini</h2>
                <p>ayo beli sekarang!</p>
                <RouterLink class="nav-link active" to="/navbar/admin">
      <button class="btn-lg btn success">
        <b-icon-arrow-bar-right></b-icon-arrow-bar-right> Click Me!
      </button>
    </RouterLink>
            </div>
        </div>
      </div>
      <div class="col-md-6">
        <img src="/src/assets/market.png" alt="Logo" class="small-image" style="max-height: 400px;">

      </div>
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
  