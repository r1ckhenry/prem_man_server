require 'net/http'
Brain.delete_all
Technical.delete_all
Player.delete_all
Club.delete_all
League.delete_all
Nation.delete_all

england = Nation.create({ name: 'England', capital: 'London' })
scotland = Nation.create({ name: 'Scotland', capital: 'Edinburgh' })

prem = League.create({ name: "Premier Division", nation_id: england.id })

Club.create({ name: 'Leciester City', founded: 1892, nation_id: england.id, col_1: '#0053A0', col_2: '#FDBE11', description: "Reigning champions Leicester have an opportunity to compete in the European Cup this season.",  league_id: prem.id})
Club.create({ name: 'Arsenal', founded: 1892, nation_id: england.id, col_1: '#EF0107', col_2: '#FFFFFF', description: "Based in North London.",  league_id: prem.id })
Club.create({ name: 'West Ham United', founded: 1885, nation_id: england.id, col_1: '  #5f1126', col_2: '#71BAEB',  league_id: prem.id })
Club.create({ name: 'Chelsea', founded: 1881, nation_id: england.id, col_1: '#034694', col_2: '#FFFFFF',  league_id: prem.id })
Club.create({ name: 'Newcastle United', founded: 1871, nation_id: england.id, col_1: '#000000', col_2: '#FFFFFF',  league_id: prem.id })
Club.create({ name: 'Southampton', founded: 1897, nation_id: england.id, col_1: '#ED1A3B', col_2: '#FFFFFF',  league_id: prem.id })
Club.create({ name: 'Everton', founded: 1893, nation_id: england.id, col_1: '#264588', col_2: '#FFFFFF',  league_id: prem.id })
Club.create({ name: 'Manchester City', founded: 1885, nation_id: england.id, col_1: '#5CBFEB', col_2: '#FFFFFF',  league_id: prem.id })
Club.create({ name: 'Manchester United', founded: 1875, nation_id: england.id, col_1: '#DA020E', col_2: '#FFFFFF',  league_id: prem.id })

Club.create({ name: 'Hibernian', founded: 1875, nation_id: scotland.id, col_1: '#00753B', col_2: '#FFFFFF' })
Club.create({ name: 'Heart of Midlothian', founded: 1893, nation_id: scotland.id, col_1: '#9E1931', col_2: '#FFFFFF' })
Club.create({ name: 'The Rangers', founded: 1885, nation_id: scotland.id, col_1: '#0C2577', col_2: '#FFFFFF' })
Club.create({ name: 'Celtic', founded: 1888, nation_id: scotland.id, col_1: '#018749', col_2: '#FFFFFF'  })

url = URI.parse('http://uinames.com/api/?gender=male&amount=20&region=england')
req = Net::HTTP::Get.new(url.to_s)
res = Net::HTTP.start(url.host, url.port) do |http|
  http.request(req)
end
players = JSON.parse( res.body )

players.each_with_index do |player, index|
  age = ( 16..42 ).to_a.sample
  rating = ( 1..10 ).to_a.sample
  player = Player.create({ name: player['name'], surname: player['surname'], age:age, rating: rating, club_id: Club.all.sample.id, nation_id: england.id })
  Brain.create({ player_id: player.id, decisions: rand(100) })
  Technical.create({ player_id: player.id, passing: rand(100), shooting: rand(100) })
end
