<template>
  <v-navigation-drawer expand-on-hover rail>
    <v-divider></v-divider>

    <v-list density="compact" nav>
      <v-list-item prepend-icon="mdi-folder" title="Home" :to="'/'"></v-list-item>
      <!-- <v-list-item prepend-icon="mdi-account-multiple" title="About" :to="'/about'"></v-list-item> -->
      <v-list-item prepend-icon="mdi-folder" title="Dosen" :to="'/About'"></v-list-item>
      <v-list-item
        prepend-icon="mdi-folder"
        title="Mahasiswa"
        :to="'/mahasiswa/MahasiswaForm'"
      ></v-list-item>
      <v-list-item prepend-icon="mdi-folder" title="Ruangan" :to="'/Ruangan'"></v-list-item>
    </v-list>
  </v-navigation-drawer>
</template>
