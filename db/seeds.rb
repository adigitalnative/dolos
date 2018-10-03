square_game = Game.create(name: "Square Game")
north_west_room = square_game.rooms.first
north_east_room = square_game.rooms.last
south_east_room = Room.create(name: "Southeast Room: The Third", description: "Another room", game: square_game)
south_west_room = Room.create(name: "Southwest Room: The Fourth", description: "Another room", game: square_game)

north_east_room.connect_to(south_east_room, "South")
south_east_room.connect_to(north_east_room, "North")

south_east_room.connect_to(south_west_room, "West")
south_west_room.connect_to(south_east_room, "East")

south_west_room.connect_to(north_west_room, "North")
north_west_room.connect_to(south_west_room, "South")