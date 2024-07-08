import { createRouter, createWebHistory } from 'vue-router';
import store from '../store';
import Login from '../components/Login.vue';
import Register from '../components/Register.vue';
import Navbar from '../components/Navbar.vue';
import Admin from '../components/Admin.vue';
import Home from '../components/Home.vue';
import ManageUsers from '../components/ManageUsers.vue';
import CheckoutUser from '../components/CheckoutUser.vue';

const routes = [
  { path: '/', component: Login },
  { path: '/register', component: Register },
  {
    path: '/navbar',
    component: Navbar,
    meta: { requiresAuth: true },
    children: [
      { path: '', component: Home },
      { path: 'admin', component: Admin },
      { path: 'manageusers', component: ManageUsers },
      { path: 'checkoutuser', component: CheckoutUser },
    ]
  }
];

const router = createRouter({
  history: createWebHistory(),
  routes,
});

router.beforeEach((to, from, next) => {
  if (to.matched.some(record => record.meta.requiresAuth)) {
    if (!store.getters.isAuthenticated) {
      next({ path: '/' });
    } else {
      next();
    }
  } else {
    next();
  }
});

export default router;
