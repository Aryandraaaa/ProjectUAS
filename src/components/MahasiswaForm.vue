<template>
  <v-container>
    <v-row>
      <v-text-field label="NPM" variant="outlined" v-model="mhs.npm"></v-text-field>
    </v-row>
    <v-row>
      <v-text-field label="Nama" variant="outlined" v-model="mhs.nama"></v-text-field>
    </v-row>
    <v-row>
      <v-text-field label="IPK" variant="outlined" v-model="mhs.ipk"></v-text-field>
    </v-row>
    <v-row>
      <v-btn color="blue" @click="submitMahasiswa">SUBMIT</v-btn>
    </v-row>
  </v-container>
</template>
<script lang="ts">
import { Mahasiswa } from '@/model/Mahasiswa'
export default {
  data() {
    return {
      mhs: new Mahasiswa('', '', 0)
    }
  },
  methods: {
    submitMahasiswa() {
      if (this.mhs.ipk > 4) {
        alert('Data IPK tidak sesuai')
      } else {
        alert('Data Mahasiswa ' + this.mhs.nama + ' berhasil disimpan')
        this.mhs = new Mahasiswa('', '', 0)
      }
    }
  }
}
</script>
