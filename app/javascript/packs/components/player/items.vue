<template>
  <div>
    <nav class="navbar">
      <ul>
        <li><a href="" class="btn btn-default">Equipment</a></li>
        <li><a href="" class="btn btn-default">Tools</a></li>
        <li><a href="" class="btn btn-default">Resources</a></li>
      </ul>
    </nav>

    <div class="items">
      <div class="item row" v-for="item in player.equipment_items" v-if="player.equipment_items.length > 0">
        <equipment-item :item="item"></equipment-item>
      </div>
      <h2 v-else>No equipment items</h2>

      <div class="item row" v-for="item in player.tool_items" v-if="player.tool_items.length > 0">
        <tool-item :item="item"></tool-item>
      </div>
      <h2 v-else>No tool items</h2>

      <div class="item row" v-for="item in player.resources" v-if="player.resources.length > 0">
        <resource :item="item"></resource>
      </div>
      <h2 v-else>No resources</h2>
    </div>
  </div>
</template>

<script>
  import EquipmentItem from '../equipment/item.vue'
  import ToolItem from '../tool/item.vue'
  import Resource from '../resources/item.vue'

  export default {
    props: ['player'],
    components: {
      equipmentItem: EquipmentItem,
      toolItem: ToolItem,
      resource: Resource
    }
  }
</script>
