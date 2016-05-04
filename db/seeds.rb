require 'net/http'
Player.delete_all
Club.delete_all
Nation.delete_all


england = Nation.create({ name: 'England', capital: 'London' })
scotland = Nation.create({ name: 'Scotland', capital: 'Edinburgh' })

Club.create({ name: 'Leciester Rovers', founded: 1892, nation_id: england.id })
Club.create({ name: 'London West Tigers', founded: 1885, nation_id: england.id })
Club.create({ name: 'London Thames United', founded: 1881, nation_id: england.id })
Club.create({ name: 'Necastle Athletic', founded: 1871, nation_id: england.id })
Club.create({ name: 'Portsmouth of The South', founded: 1897, nation_id: england.id })
Club.create({ name: 'Liverton', founded: 1893, nation_id: england.id })
Club.create({ name: 'Manchester Rovers', founded: 1885, nation_id: england.id })
Club.create({ name: 'Manchester Athletic', founded: 1875, nation_id: england.id })

url = URI.parse('http://uinames.com/api/?gender=male&amount=20&region=england')
req = Net::HTTP::Get.new(url.to_s)
res = Net::HTTP.start(url.host, url.port) do |http|
  http.request(req)
end
players = JSON.parse( res.body )

players.each_with_index do |player, index|
  age = ( 16..42 ).to_a.sample
  rating = ( 1..10 ).to_a.sample
  Player.create({ name: player['name'], surname: player['surname'], age:age, rating: rating, club_id: Club.all.sample.id, nation_id: england.id })
end
