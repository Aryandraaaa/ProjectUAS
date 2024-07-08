<template>
  <div class="d-flex justify-content-center align-items-center vh-100">
    <div class="card p-4" style="width: 300px;">
      <h1 class="text-center">Login</h1>
      <form @submit.prevent="login">
        <div class="mb-3">
          <input type="text" v-model="username" class="form-control" placeholder="Username" required />
        </div>
        <div class="mb-3">
          <input type="password" v-model="password" class="form-control" placeholder="Password" required />
        </div>
        <div class="d-flex justify-content-between">
          <button type="submit" class="btn btn-primary">Login</button>
          <button type="button" class="btn btn-link" @click="goToRegister">Register</button>
        </div>
      </form>
    </div>
  </div>
</template>

<script>
import { useRouter } from 'vue-router';
import { useStore } from 'vuex';
import { ref } from 'vue';

export default {
  setup() {
    const store = useStore();
    const router = useRouter();
    const username = ref('');
    const password = ref('');

    const login = async () => {
      const credentials = {
        username: username.value,
        password: password.value,
      };
      try {
        const success = await store.dispatch('login', credentials);
        if (success) {
          router.push('/navbar');
        } else {
          alert('Silahkan Register Dahulu');
        }
      } catch (error) {
        console.error('Login error:', error);
        alert('An error occurred during login.');
      }
    };

    const goToRegister = () => {
      router.push('/register');
    };

    return {
      username,
      password,
      login,
      goToRegister,
    };
  },
};
</script>
