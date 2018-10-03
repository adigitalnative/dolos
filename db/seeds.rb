puts "Creating a square game"
square_game = Game.create(name: "Square Game")
north_west_room = square_game.rooms.first
north_east_room = square_game.rooms.last
south_east_room = Room.create(name: "Southeast Room: The Third", description: "Another room", game: square_game)
south_west_room = Room.create(name: "Southwest Room: The Fourth", description: "Another room", game: square_game)

north_east_room.two_way_connect_to(south_east_room, "South", "North")
south_east_room.two_way_connect_to(south_west_room, "West", "East")
south_west_room.two_way_connect_to(north_west_room, "North", "South")
puts "Square game created"
puts "Successfully seeded database"