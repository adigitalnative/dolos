puts "Creating a square game"
square_game = Game.create(name: "Square Game")
north_west_room = square_game.rooms.first
north_east_room = square_game.rooms.last
south_east_room = Room.create(name: "Southeast Room: The Third", description: "Another room", game: square_game)
south_west_room = Room.create(name: "Southwest Room: The Fourth", description: "Another room", game: square_game)

north_east_room.two_way_connect_to(south_east_room, "South", "South", "North", "North")
south_east_room.two_way_connect_to(south_west_room, "West", "West", "East", "East")
south_west_room.two_way_connect_to(north_west_room, "North", "North", "South", "South")

rope = Item.create(name: "Rope", description: "10ft sturdy rope", game: square_game, owner: square_game.player)
key = Item.create(name: "Key1", description: "Your starting key", game: square_game, owner: square_game.player)

puts "Square game created"

puts "Creating a Maze game"

# Build the game
maze_game = Game.create(name: "Maze Runner")

## Game Map - stars are rooms, lines are connections
      # *-*-* *-*
      # | |   | |
      # * * *-* *
      # | | | |  
      # * *-* *-*
      #   |     |
      # *-* *-* *
      # |   | | |
      # *-* * *-*

# Build the rooms of a 5x5 maze
maze_room_1 = Room.create(name: "A room in the maze 1", description: "You are in a maze. How will you get out?", game: maze_game)
maze_room_2 = Room.create(name: "A room in the maze 2", description: "You are in a maze. How will you get out?", game: maze_game)
maze_room_3 = maze_game.rooms.first
maze_room_4 = square_game.rooms.last
maze_room_5 = Room.create(name: "A room in the maze 5", description: "You are in a maze. How will you get out?", game: maze_game)
maze_room_6 = Room.create(name: "A room in the maze 6", description: "You are in a maze. How will you get out?", game: maze_game)
maze_room_7 = Room.create(name: "A room in the maze 7", description: "You are in a maze. How will you get out?", game: maze_game)
maze_room_8 = Room.create(name: "A room in the maze 8", description: "You are in a maze. How will you get out?", game: maze_game)
maze_room_9 = Room.create(name: "A room in the maze 9", description: "You are in a maze. How will you get out?", game: maze_game)
maze_room_10 = Room.create(name: "A room in the maze 10", description: "You are in a maze. How will you get out?", game: maze_game)
maze_room_11 = Room.create(name: "A room in the maze 11", description: "You are in a maze. How will you get out?", game: maze_game)
maze_room_12 = Room.create(name: "A room in the maze 12", description: "You are in a maze. How will you get out?", game: maze_game)
maze_room_13 = Room.create(name: "A room in the maze 13", description: "You are in a maze. How will you get out?", game: maze_game)
maze_room_14 = Room.create(name: "A room in the maze 14", description: "You are in a maze. How will you get out?", game: maze_game)
maze_room_15 = Room.create(name: "A room in the maze 15", description: "You are in a maze. How will you get out?", game: maze_game)
maze_room_16 = Room.create(name: "A room in the maze 16", description: "You are in a maze. How will you get out?", game: maze_game)
maze_room_17 = Room.create(name: "A room in the maze 17", description: "You are in a maze. How will you get out?", game: maze_game)
maze_room_18 = Room.create(name: "A room in the maze 18", description: "You are in a maze. How will you get out?", game: maze_game)
maze_room_19 = Room.create(name: "A room in the maze 19", description: "You are in a maze. How will you get out?", game: maze_game)
maze_room_20 = Room.create(name: "A room in the maze 20", description: "You are in a maze. How will you get out?", game: maze_game)
maze_room_21 = Room.create(name: "A room in the maze 21", description: "You are in a maze. How will you get out?", game: maze_game)
maze_room_22 = Room.create(name: "A room in the maze 22", description: "You are in a maze. How will you get out?", game: maze_game)
maze_room_23 = Room.create(name: "The Maze Exit", description: "You are in a maze. How will you get out?", game: maze_game)
maze_room_24 = Room.create(name: "A room in the maze 24", description: "You are in a maze. How will you get out?", game: maze_game)
maze_room_25 = Room.create(name: "A room in the maze 25", description: "You are in a maze. How will you get out?", game: maze_game)

# Clear pre-build connections
maze_room_3.exits.delete_all
maze_room_4.exits.delete_all

#Horizontal connections
maze_room_1.two_way_connect_to(maze_room_2, "East", "East", "West", "West")
maze_room_2.two_way_connect_to(maze_room_3, "East", "East", "West", "West")
maze_room_4.two_way_connect_to(maze_room_5, "East", "East", "West", "West")

maze_room_8.two_way_connect_to(maze_room_9, "East", "East", "West", "West")

maze_room_12.two_way_connect_to(maze_room_13, "East", "East", "West", "West")
maze_room_14.two_way_connect_to(maze_room_15, "East", "East", "West", "West")

maze_room_16.two_way_connect_to(maze_room_17, "East", "East", "West", "West")
maze_room_18.two_way_connect_to(maze_room_19, "East", "East", "West", "West")

maze_room_21.two_way_connect_to(maze_room_22, "East", "East", "West", "West")
maze_room_24.two_way_connect_to(maze_room_25, "East", "East", "West", "West")

# Vertical connections
maze_room_1.two_way_connect_to(maze_room_6, "South", "South", "North", "North")
maze_room_2.two_way_connect_to(maze_room_7, "South", "South", "North", "North")
maze_room_4.two_way_connect_to(maze_room_9, "South", "South", "North", "North")
maze_room_5.two_way_connect_to(maze_room_10, "South", "South", "North", "North")

maze_room_6.two_way_connect_to(maze_room_11, "South", "South", "North", "North")
maze_room_7.two_way_connect_to(maze_room_12, "South", "South", "North", "North")
maze_room_8.two_way_connect_to(maze_room_13, "South", "South", "North", "North")
maze_room_9.two_way_connect_to(maze_room_14, "South", "South", "North", "North")

maze_room_12.two_way_connect_to(maze_room_17, "South", "South", "North", "North")
maze_room_15.two_way_connect_to(maze_room_20, "South", "South", "North", "North")

maze_room_16.two_way_connect_to(maze_room_21, "South", "South", "North", "North")
maze_room_18.two_way_connect_to(maze_room_23, "South", "South", "North", "North") # This is the final door to 'win'
maze_room_19.two_way_connect_to(maze_room_24, "South", "South", "North", "North")
maze_room_20.two_way_connect_to(maze_room_25, "South", "South", "North", "North")

puts "Maze completed"




puts "Successfully seeded database"
