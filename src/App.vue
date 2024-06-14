<script setup lang="ts">
import { RouterLink, RouterView } from 'vue-router'
import HelloWorld from './components/Test.vue'
import MahasiswaForm from '@/components/MahasiswaForm.vue'
import LeftNav from '@/components/navbar/LeftNav.vue'
</script>

<template>
  <!-- <HelloWorld />
  <MhsForm></MhsForm> -->

  <!-- <RouterView></RouterView> -->

  <v-layout class="rounded rounded-md">
    <v-app-bar title="Application bar"></v-app-bar>

    <LeftNav></LeftNav>

    <v-main class="d-flex align-center justify-center" style="min-height: 300px">
      <RouterView></RouterView>
    </v-main>
  </v-layout>
</template>
