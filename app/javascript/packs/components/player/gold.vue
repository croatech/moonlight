<template>
  <div class="gold">
    <img src="../../assets/gold.png" alt="gold">
    {{ player.gold }}
  </div>
</template>

<script>
  import { eventBus } from '../../application'

  export default {
    props: ['player'],
    created: function() {
      eventBus.$on('gold-changed', (value) => {
        this.player.gold -= value
      })
    }
  }
</script>
