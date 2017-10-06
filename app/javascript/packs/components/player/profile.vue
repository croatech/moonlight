<template>
  <div class="profile">
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
  </div>
</template>

<script>
  import axios from 'axios'

  export default {
    props: ['player'],
    computed: {
      hpPercent: function() {
        return (this.player.current_hp / this.player.hp * 100) + '%'
      },
      expPercent: function() {
        return (this.player.exp / this.player.exp_next * 100) + '%'
      }
    }
  }
</script>
