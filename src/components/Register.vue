<template>
  <div class="d-flex justify-content-center align-items-center vh-100">
    <div class="card p-4" style="width: 300px;">
      <h1 class="text-center">Register</h1>
      <form @submit.prevent="register">
        <div class="mb-3">
          <input type="text" v-model="firstName" class="form-control" placeholder="First Name" required />
        </div>
        <div class="mb-3">
          <input type="text" v-model="lastName" class="form-control" placeholder="Last Name" required />
        </div>
        <div class="mb-3">
          <input type="text" v-model="username" class="form-control" placeholder="Username" required />
        </div>
        <div class="mb-3">
          <input type="password" v-model="password" class="form-control" placeholder="Password" required />
        </div>
        <button type="submit" class="btn btn-primary w-100">Register</button>
        <button type="button" class="btn btn-link mt-3 w-100" @click="goToLogin">Login</button>
      </form>
    </div>
  </div>
</template>

<script>
import { ref } from 'vue';
import { useRouter } from 'vue-router';
import { useStore } from 'vuex';

export default {
  setup() {
    const store = useStore();
    const router = useRouter();
    const firstName = ref('');
    const lastName = ref('');
    const username = ref('');
    const password = ref('');

    const register = () => {
      const user = {
        firstName: firstName.value,
        lastName: lastName.value,
        username: username.value,
        password: password.value,
      };
      store.dispatch('register', user);
      router.push('/');
    };

    const goToLogin = () => {
      router.push('/');
    };

    return {
      firstName,
      lastName,
      username,
      password,
      register,
      goToLogin,
    };
  },
};
</script>
