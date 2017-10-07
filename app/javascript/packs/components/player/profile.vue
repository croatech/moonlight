<template>
  <div>
    <equipment :player="player"></equipment>
    <inventory :player="player"></inventory>
  </div>
</template>

<script>
  import Equipment from './equipment.vue'
  import Inventory from './inventory.vue'

  export default {
    props: ['player'],
    components: {
      equipment: Equipment,
      inventory: Inventory
    }
  }
</script>
