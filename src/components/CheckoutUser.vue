<template>
  <div>
    <!-- Other content -->
    <div class="size-input">
      <label for="sizes">Select Sizes:</label>
      <div>
        <input type="checkbox" id="sizeM" value="M" v-model="selectedSizes"> M
        <input type="checkbox" id="sizeL" value="L" v-model="selectedSizes"> L
        <input type="checkbox" id="sizeXL" value="XL" v-model="selectedSizes"> XL
      </div>
    </div>
    <button @click="submitSizes">Submit Sizes</button>
  </div>
</template>

<script>
import { mapActions, mapState } from 'vuex';

export default {
  data() {
    return {
      selectedSizes: []
    };
  },
  computed: {
    ...mapState(['sizes'])
  },
  methods: {
    ...mapActions(['setSizes']),
    submitSizes() {
      this.setSizes(this.selectedSizes);
      // Perform any additional actions like navigating to a different page
    }
  }
};
</script>

<style>
.size-input {
  margin: 20px 0;
}
</style>
