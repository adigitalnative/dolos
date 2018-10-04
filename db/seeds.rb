puts "Creating a square game"
square_game = Game.create(name: "Square Game")
north_west_room = square_game.rooms.first
north_east_room = square_game.rooms.last
south_east_room = Room.create(name: "Southeast Room: The Third", description: "Another room", game: square_game)
south_west_room = Room.create(name: "Southwest Room: The Fourth", description: "Another room", game: square_game)

north_east_room.two_way_connect_to(south_east_room, "South", "South", "North", "North")
south_east_room.two_way_connect_to(south_west_room, "West", "West", "East", "East")
south_west_room.two_way_connect_to(north_west_room, "North", "North", "South", "South")

puts "Square game created"

rope = Item.create(name: "Rope", description: "10ft sturdy rope", game: square_game, owner: square_game.player)
key = Item.create(name: "Key1", description: "Your starting key", game: square_game, owner: square_game.player)


puts "Successfully seeded database"
