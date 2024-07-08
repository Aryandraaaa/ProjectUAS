// src/store/index.js
import { createStore } from 'vuex';

export default createStore({
  state: {
    users: [],
    isAuthenticated: false,
  },
  mutations: {
    REGISTER_USER(state, user) {
      state.users.push(user);
    },
    SET_AUTH(state, status) {
      state.isAuthenticated = status;
    }
  },
  actions: {
    register({ commit }, user) {
      commit('REGISTER_USER', user);
    },
    login({ commit, state }, credentials) {
      const user = state.users.find(
        user => user.username === credentials.username && user.password === credentials.password
      );
      if (user) {
        commit('SET_AUTH', true);
        return true;
      } else {
        return false;
      }
    },
    logout({ commit }) {
      commit('SET_AUTH', false);
    }
  },
  getters: {
    isAuthenticated: state => state.isAuthenticated,
  }
});
