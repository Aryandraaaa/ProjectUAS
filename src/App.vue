<script setup>
import { RouterLink, RouterView } from 'vue-router'
import { computed } from 'vue';
import { useStore } from 'vuex';

const store = useStore();
const isAuthenticated = computed(() => store.getters.isAuthenticated);
</script>

<template>
  <header v-if="isAuthenticated">
    <div class="wrapper">
      <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container-fluid">
          <RouterLink class="navbar-brand" href="/">Home</RouterLink>
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
              <li class="nav-item">
                <RouterLink class="nav-link active" to="/navbar/admin">Admin</RouterLink>
              </li>
              <li class="nav-item">
                <RouterLink class="nav-link active" to="/navbar/manageuser">ManageUser</RouterLink>
              </li>
              <li class="nav-item">
                <RouterLink class="nav-link active" to="/navbar/checkoutuser">CheckoutUser</RouterLink>
              </li>
              <li class="nav-item">
                <RouterLink class="nav-link active" to="/navbar/user">User</RouterLink>
              </li>
              <li class="nav-item">
                <RouterLink class="nav-link" to="/navbar/payment">Payment</RouterLink>
              </li>
              <li class="nav-item">
                <RouterLink class="nav-link" to="/logout" @click.prevent="logout">Logout</RouterLink>
              </li>
            </ul>
          </div>
        </div>
      </nav>
    </div>
  </header>
  <RouterView />
  <Footer />
</template>

<script>
import { useStore } from 'vuex';
import Footer from "@/components/Footer.vue";

export default {
  components: {
    Footer
    
  },
  setup() {
    const store = useStore();
    const logout = () => {
      store.dispatch('logout');
      router.push('/');
    };

    return {
      logout
    };
  }
};
</script>
