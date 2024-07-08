import { createStore } from 'vuex';

export default createStore({
  state: {
    users: [],
    isAuthenticated: false,
    user: null,
    sizes: []
  },
  mutations: {
    REGISTER_USER(state, user) {
      state.users.push(user);
    },
    SET_AUTH(state, status) {
      state.isAuthenticated = status;
    },
    SET_USER(state, user) {
      state.user = user;
    },
    UPDATE_USER(state, updatedUser) {
      const index = state.users.findIndex(user => user.username === updatedUser.username);
      if (index !== -1) {
        state.users[index].firstName = updatedUser.firstName;
        state.users[index].lastName = updatedUser.lastName;
      }
    },
    DELETE_USER(state, username) {
      state.users = state.users.filter(user => user.username !== username);
    },
    SET_SIZES(state, sizes) { // Add mutation to set sizes
      state.sizes = sizes;
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
        commit('SET_USER', user);
        return true;
      } else {
        return false;
      }
    },
    logout({ commit }) {
      commit('SET_AUTH', false);
      commit('SET_USER', null);
    },
    updateUser({ commit }, updatedUser) {
      commit('UPDATE_USER', updatedUser);
    },
    deleteUser({ commit }, user) {
      commit('DELETE_USER', user.username);
    },
    setSizes({ commit }, sizes) { // Add action to set sizes
      commit('SET_SIZES', sizes);
    }
  },
  getters: {
    isAuthenticated: state => state.isAuthenticated,
    user: state => state.user,
    users: state => state.users,
    sizes: state => state.sizes // Add getter for sizes
  }
});
