<script>
export default {
  data: () => ({
    active: false
  }),

  methods: {
    onClickOutside() {
      this.active = false
    }
  }
}
</script>
<template>
  <v-card
    :color="active ? 'primary' : undefined"
    :dark="active"
    class="mx-auto"
    height="256"
    width="512"
    v-click-outside="onClickOutside"
    @click="active = true"
  >
    <div class="text-h6 text-md-h4 fill-height d-flex align-center justify-center">
      {{ active ? 'Aplikasi ini dibuat oleh' : 'More info' }}
    </div>
  </v-card>
</template>
