<template>
  <div class="container mt-4">
    <div class="row">
      <div class="col-md-6">
        <div class="size-input form-group">
          <label for="sizes">Select Size:</label>
          <div>
            <div class="form-check">
              <input type="radio" id="sizeM" value="M" v-model="selectedSize" class="form-check-input">
              <label class="form-check-label" for="sizeM">M</label>
            </div>
            <div class="form-check">
              <input type="radio" id="sizeL" value="L" v-model="selectedSize" class="form-check-input">
              <label class="form-check-label" for="sizeL">L</label>
            </div>
            <div class="form-check">
              <input type="radio" id="sizeXL" value="XL" v-model="selectedSize" class="form-check-input">
              <label class="form-check-label" for="sizeXL">XL</label>
            </div>
          </div>
        </div>
      </div>
      <div class="col-md-6">
        <div class="quantity-input form-group" v-if="selectedSize">
          <label for="quantity">Quantity:</label>
          <input type="number" id="quantity" v-model.number="selectedQuantity" min="1" class="form-control">
        </div>
      </div>
    </div>
    <RouterLink class="nav-link" to="/navbar/payment">
      <button @click="submitOrder" :disabled="!selectedSize || selectedQuantity < 1" class="btn btn-primary btn-block">
        Submit Order
      </button>
    </RouterLink>
  </div>
</template>

<script>
export default {
  data() {
    return {
      selectedSize: '', // Initialize as an empty string
      selectedQuantity: 1, // Default quantity
    };
  },
  methods: {
    submitOrder() {
      // Handle order submission logic here
      // You can access selected size and quantity using this.selectedSize and this.selectedQuantity
      // ...
    },
  },
};
</script>
