<template>
    <div class="container mt-5">
      <v-row align="center">
        <v-col>
          <text-center>
            <h1>Manage Users</h1>
          </text-center>
        </v-col>
      </v-row>
      <button class="btn btn-primary" @click="addNewUser">Add User</button>
  
      <!-- Add User Form -->
      <div v-if="addingUser">
        <h3>Add New User</h3>
        <form @submit.prevent="saveNewUser">
          <div class="mb-3">
            <input type="text" v-model="newFirstName" class="form-control" placeholder="First Name" required />
          </div>
          <div class="mb-3">
            <input type="text" v-model="newLastName" class="form-control" placeholder="Last Name" required />
          </div>
          <div class="mb-3">
            <input type="text" v-model="newUsername" class="form-control" placeholder="Username" required />
          </div>
          <div class="mb-3">
            <input type="password" v-model="newPassword" class="form-control" placeholder="Password" required />
          </div>
          <button type="submit" class="btn btn-primary">Save</button>
          <button type="button" class="btn btn-secondary" @click="cancelAdd">Cancel</button>
        </form>
      </div>
  
      <h3 class="mt-4">Users List</h3>
      <table class="table">
        <thead>
          <tr>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Username</th>
            <th>Action</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="user in users" :key="user.username">
            <td>{{ user.firstName }}</td>
            <td>{{ user.lastName }}</td>
            <td>{{ user.username }}</td>
            <td>
              <button class="btn btn-sm btn-info" @click="editUser(user)">Edit</button>
              <button class="btn btn-sm btn-danger" @click="confirmDelete(user)">Delete</button>
            </td>
          </tr>
        </tbody>
      </table>
  
      <!-- Edit User Form -->
      <div v-if="editingUser">
        <h3>Edit User</h3>
        <form @submit.prevent="saveUser">
          <div class="mb-3">
            <input type="text" v-model="editFirstName" class="form-control" placeholder="First Name" required />
          </div>
          <div class="mb-3">
            <input type="text" v-model="editLastName" class="form-control" placeholder="Last Name" required />
          </div>
          <button type="submit" class="btn btn-primary">Save</button>
          <button type="button" class="btn btn-secondary" @click="cancelEdit">Cancel</button>
        </form>
      </div>
    </div>
  </template>
  
  <script>
  import { ref } from 'vue';
  import { useStore } from 'vuex';
  import { useRouter } from 'vue-router';
  
  export default {
    setup() {
      const store = useStore();
      const router = useRouter();
      const users = store.getters.users;
  
      // State for adding new user
      const addingUser = ref(false);
      const newFirstName = ref('');
      const newLastName = ref('');
      const newUsername = ref('');
      const newPassword = ref('');
  
      // State for editing user
      const editingUser = ref(null);
      const editFirstName = ref('');
      const editLastName = ref('');
  
      // Function to toggle add new user form
      const addNewUser = () => {
        addingUser.value = true;
      };
  
      // Function to save new user
      const saveNewUser = () => {
        const newUser = {
          firstName: newFirstName.value,
          lastName: newLastName.value,
          username: newUsername.value,
          password: newPassword.value,
        };
        store.dispatch('register', newUser); // Change to register action if needed
        cancelAdd();
      };
  
      // Function to cancel adding new user
      const cancelAdd = () => {
        addingUser.value = false;
        newFirstName.value = '';
        newLastName.value = '';
        newUsername.value = '';
        newPassword.value = '';
      };
  
      // Function to set edit mode for a user
      const editUser = (user) => {
        editingUser.value = user;
        editFirstName.value = user.firstName;
        editLastName.value = user.lastName;
      };
  
      // Function to save edited user
      const saveUser = () => {
        const updatedUser = {
          ...editingUser.value,
          firstName: editFirstName.value,
          lastName: editLastName.value,
        };
        store.dispatch('updateUser', updatedUser);
        cancelEdit();
      };
  
      // Function to cancel edit mode
      const cancelEdit = () => {
        editingUser.value = null;
        editFirstName.value = '';
        editLastName.value = '';
      };
  
      // Function to confirm delete user
      const confirmDelete = (user) => {
        if (confirm(`Are you sure you want to delete ${user.username}?`)) {
          deleteUser(user);
        }
      };
  
      // Function to delete user
      const deleteUser = (user) => {
        store.dispatch('deleteUser', user);
        // Optionally redirect to login after deleting user
        router.push('/');
      };
  
      return {
        users,
        addingUser,
        newFirstName,
        newLastName,
        newUsername,
        newPassword,
        editingUser,
        editFirstName,
        editLastName,
        addNewUser,
        saveNewUser,
        cancelAdd,
        editUser,
        saveUser,
        cancelEdit,
        confirmDelete,
      };
    },
  };
  </script>
  