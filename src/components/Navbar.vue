<template>
  <div>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
      <div class="container-fluid">
        <RouterLink class="navbar-brand" to="/navbar">Home</RouterLink>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
            <li class="nav-item">
              <RouterLink class="nav-link active" to="/navbar/admin">Admin</RouterLink>
            </li>
            <li class="nav-item">
              <RouterLink class="nav-link active" to="/navbar/manageusers">ManageUsers</RouterLink>
            </li>
            <li class="nav-item">
              <RouterLink class="nav-link active" to="/navbar/checkoutuser">CheckoutUser</RouterLink>
            </li>
            <li class="nav-item">
              <RouterLink class="nav-link" to="/navbar/payment">Payment</RouterLink>
            </li>
            <li class="nav-item">
              <RouterLink class="nav-link" to="/" @click.prevent="logout">Logout</RouterLink>
            </li>
          </ul>
        </div>
      </div>
    </nav>
    <div class="container mt-4">
      <RouterView />
    </div>
  </div>
</template>

<script>
import { useRouter } from 'vue-router';
import { useStore } from 'vuex';

export default {
  name: 'Navbar',
  setup() {
    const store = useStore();
    const router = useRouter();

    const logout = () => {
      store.dispatch('logout');
      router.push('/');
    };

    return {
      logout,
      user: store.state.user
    };
  },
};
</script>
