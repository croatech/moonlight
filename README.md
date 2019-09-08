### Install
#### ENVS
`bundle exec figaro install`

`npm install yarn`

`yarn install`

`rake db:setup`

### Redis
#### Keys
`equipment_categories`

### Sidekiq
`sidekiq -q critical,2 -q default`
`sidekiq -q critical,2 -q default`

### MAP
#### CITIES
Moonlight: 29, 37

#### CELLS
Mycelium: 22

Sacred Forest: 29, 36

Dalf Lagoon: 28

Shady Walk: 37

Northern Forest: 20, 21

South Thicket: 44

River Fork: 45

Dangerous Grounds: 53

#### BOTS
Mushrooms [1,2,3]: 22 (Mycelium)

Rat [4]: 37 (Shady Walk)

Spider [5]: 37 (Shady Walk)

Hoblin [6]: 29, 36 (Sacred Forest)

Ork [7]: 29, 36 (Sacred Forest)

Drowned [8]: 28 (Dalf Lagoon)

#### RESOURCES
Beech [0-50]: 29, 36 (Sacred Forest)

Elm [50-100]: 29, 36 (Sacred Forest)

Larch [100-150]: 28 (Dalf Lagoon)

Birch [150-200]: 20, 21 (Northern Forest)

Sequoia [200-250]: 22 (Mycelium)

Eucalyptus [250-300]: 44 (South Thicket)

Rowan [300-350]: 45 (River Fork)

Mysterious wood [350-400]: 53 (Dangerous Grounds)

### CRAFT
#### Chances for an increment of skill(lumberjacking, fishing, etc.)
0-50 = 50%

50-100 = 30%

100-150 = 20%

150-200 = 15%

200-250 = 10%

250-300 = 7%

300-350 = 5%

350-400 = 2%

