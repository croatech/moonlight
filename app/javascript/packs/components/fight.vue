<template>
  <div class="container">
    <div class="fight">
      <div class="characters row">
        <div class="col-md-6">
          <div class="character player">
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
        <%= f.submit 'HIT', class: 'btn btn-danger center' %>
      </div>
      <% end %>
      <div class="rounds">
        <% @rounds.each do |round| %>
        <hr/>
        <div class="damage">
          <p>
            <%= "#{@player.name} has dealt" %>
            <span>
              <%= "#{round.player_damage}" %>
            </span>
            <%= "to #{@bot.name}." %>
          </p>
        </div>
        <div class="damage">
          <p>
            <%= "#{@bot.name} has dealt" %>
            <span>
              <%= "#{round.bot_damage}" %>
            </span>
            <%= "to #{@player.name}." %>
          </p>
        </div>
        <hr/>
        <% end %>
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
          this.rounds = response.data['fight']['rounds']
          this.round = response.data['fight']['current_round']
          this.player = response.data['fight']['player']
          this.bot = response.data['fight']['bot']
          this.points = response.data['points']
          this.attackPoint = this.points[this.points.length - 1]
          this.defensePoint = this.points[this.points.length - 1]
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
