<template>
  <div>
    <div class="player-name">
      {{ player.name }}
      <strong>
        [{{ player.level }}]
      </strong>
      <a :href="'/players/' + player.name"><i class="fa fa-external-link"></i></a>
    </div>

    <div class="progresses">
      <div class="progress">
        <div aria-valuemax="100" aria-valuemin="0" aria-valuenow="80" class="progress-bar progress-bar-danger" role="progressbar" :style="{ width: hpPercent }">
          {{ player.current_hp }} / {{ player.hp }} HP
        </div>
      </div>

      <div class="progress">
        <div aria-valuemax="100" aria-valuemin="0" aria-valuenow="60" class="progress-bar progress-bar-warning" role="progressbar" :style="{ width: expPercent }">
          {{ player.exp }} / {{ player.exp_next }} EXP
        </div>
      </div>
    </div>

    <div class="player">
      <div class="player-items left-column">
        <div v-for="item in player.put_on_equipment_items" :class="item.category.name.toLowerCase() + ' item'">
          <a href="'equipment/items/' + item.id + 'take_off'">
            <img :src="item.image" alt="item">
          </a>
        </div>
      </div>

      <div class="avatar">
        <img :src="player.avatar.image" alt="avatar">
      </div>

      <div class="player-items tools">
        <div v-for="(item, i) in player.put_on_tool_items" :class="'item tool num-' + i">
          <a href="">
            <img :src="item.image" alt="tool">
          </a>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
  import axios from 'axios'
  import { eventBus } from '../../application'

  export default {
    props: ['player'],
    computed: {
      hpPercent: function() {
        return (this.player.current_hp / this.player.hp * 100) + '%'
      },
      expPercent: function() {
        return (this.player.exp / this.player.exp_next * 100) + '%'
      }
    },
    created: function() {
      eventBus.$on('player-changed', (data) => {
        this.player = data
      })
    }
  }
</script>
