<template>
  <div class="container">
    <div class="winner center" v-if="winner != null">
      <h1 class="text-center">
        Winner: {{ winner.name }}
      </h1>
      <% if @winner.is_a?(Player) %>
      <div class="progress">
        <div aria-valuemax="100" aria-valuemin="0" aria-valuenow="80" class="progress-bar progress-bar-danger" role="progressbar" style="width: <%= progress_percents(@player.hp, @rounds.last.player_hp) %>">
          <span class="sr-only">80% Complete (danger)</span>
          <%= "#{@winner.current_hp} HP" if @winner == @player %>
        </div>
      </div>
      <div class="progress">
        <div aria-valuemax="100" aria-valuemin="0" aria-valuenow="60" class="progress-bar progress-bar-warning" role="progressbar" style="width: <%= progress_percents(@player.exp_next, @player.exp) %>">
          <%= "EXP: #{@player.exp}/#{@player.exp_next}" %>
        </div>
      </div>
      <% end %>
      <%= image_tag @winner.avatar, class: 'image center' %>
    </div>


    <div class="fight" v-if="winner == null">
      <div class="characters row">
        <div class="col-md-6">
          <div class="character player">
            <h2>{{ player.name }}[{{ player.level }}]</h2>
            <div class="progress">
              <div aria-valuemax="100" aria-valuemin="0" aria-valuenow="80" class="progress-bar progress-bar-danger" role="progressbar" :style="{ width: playerHpPercent }">
                {{ round.player_hp }} HP
              </div>
            </div>

            <img :src="player.avatar.url" class="image" alt="avatar">

            <div class="points">
              <h4 class="block-title">Defense: {{ attackPoint }}</h4>
              <ul v-for="point in points">
                <li><button @click=setAttackPoint(point) :class="'btn btn-default attack ' + resolveAttackPointClass(point)">{{ point }}</button></li>
              </ul>
            </div>
          </div>
        </div>

        <div class="col-md-6">
          <div class="character bot">
            <h2>{{ bot.name }}[{{ bot.level }}]</h2>
            <div class="progress">
              <div aria-valuemax="100" aria-valuemin="0" aria-valuenow="80" class="progress-bar progress-bar-danger" role="progressbar" :style="{ width: botHpPercent }">
              {{ round.bot_hp }} HP
              </div>
            </div>

            <img :src="bot.avatar.url" class="image" alt="avatar">

            <div class="points">
              <h4 class="block-title">Attack: {{ defensePoint }}</h4>
              <ul v-for="point in points">
                <li><button @click=setDefensePoint(point) :class="'btn btn-default attack ' + resolveDefensePointClass(point)">{{ point }}</button></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
      <div class="row">
        <button @click="attack" class="btn btn-danger btn-attack">Attack</button>
      </div>
      <div class="rounds">
        <div v-for="round in rounds">
          <div v-if="round.player_damage != null">
            <hr/>
            <div class="damage">
              <p>
                {{ player.name }} has dealt
                <span>{{ round.player_damage }}</span>
                damage to {{ bot.name }}.
              </p>
            </div>

            <div class="damage">
              <p>
                {{ bot.name }} has dealt
                <span>{{ round.bot_damage }}</span>
                damage to {{ player.name }}.
              </p>
            </div>
            <hr/>
          </div>
        </div>
      </div>
    </div>
  </div>

</template>

<script>
  import axios from 'axios'
  import { calculate } from '../mixins/calculate'

  export default {
    data: function() {
      return {
        rounds: [],
        round: {},
        player: {},
        bot: {},
        winner: {},
        points: [],
        attackPoint: '',
        defensePoint: ''
      }
    },
    mixins: [calculate],
    methods: {
      getFight: function() {
        axios.get('/fight')
        .then(response => {
          this.setDataFromResponse(response.data)
        })
        .catch(e => {
          console.log(e)
        })
      },
      attack: function() {
        axios.patch('/fight', {
          defensePoint: this.defensePoint,
          attackPoint: this.attackPoint
        })
        .then(response => {
          this.setDataFromResponse(response.data)
        })
        .catch(e => {
          console.log(e)
        })
      },
      resolveAttackPointClass: function(point) {
        if(this.attackPoint == point) {
          return 'active'
        }
      },
      resolveDefensePointClass: function(point) {
        if(this.defensePoint == point) {
          return 'active'
        }
      },
      setAttackPoint: function(point) {
        this.attackPoint = point
      },
      setDefensePoint: function(point) {
        this.defensePoint = point
      },
      setDataFromResponse: function(data) {
        this.rounds = data['fight']['rounds']
        this.round = data['fight']['current_round']
        this.player = data['fight']['player']
        this.bot = data['fight']['bot']
        this.winner = data['fight']['winner']
        this.points = data['points']
        this.attackPoint = this.points[this.points.length - 1]
        this.defensePoint = this.points[this.points.length - 1]
      }
    },
    created: function() {
      this.getFight()
    },
    computed: {
      playerHpPercent: function() {
        return this.percentProgressBar(this.round['player_hp'], this.player['hp'])
      },
      botHpPercent: function() {
        return this.percentProgressBar(this.round['bot_hp'], this.bot['hp'])
      }
    }
  }
</script>
