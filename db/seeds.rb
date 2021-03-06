puts ""
progressbar = ProgressBar.create(format: "\e[0;97;49m%t \e[0;90;49m|\e[0;31;49m%b\e[0;90;49m>>\e[0m", title: "Setting up", total: 62, length: 79)

unless Game.find_by(name: "Square Game")
  square_game = Game.create(name: "Square Game")
  north_west_room = square_game.rooms.first
  north_east_room = square_game.rooms.last
  south_east_room = Room.create(name: "Southeast Room: The Third", description: "Another room", game: square_game)
  south_west_room = Room.create(name: "Southwest Room: The Fourth", description: "Another room", game: square_game)
  progressbar.progress+=5

  north_east_room.two_way_connect_to(south_east_room, "South", "South", "North", "North")
  south_east_room.two_way_connect_to(south_west_room, "West", "West", "East", "East")
  south_west_room.two_way_connect_to(north_west_room, "North", "North", "South", "South")
  progressbar.progress+=3


  rope = Item.create(name: "Rope", description: "10ft sturdy rope", game: square_game, owner: square_game.player)
  key = Item.create(name: "Key1", description: "Your starting key", game: square_game, owner: square_game.player)
  progressbar.progress+=2
else
  10.times { progressbar.increment; sleep 0.01 }
end


unless Game.find_by(name: "Triwizard Tournament")
  # Build the game
  maze_game = Game.create(name: "Triwizard Tournament")
  progressbar.progress+=1


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
  maze_room_1 = Room.create(name: "The Triwizard Tournament Maze", description: "The maze goes on forever. Better keep moving... someone might be lurking in the shadows...", game: maze_game)
  maze_room_2 = Room.create(name: "The Triwizard Tournament Maze", description: "The maze goes on forever. Better keep moving... someone might be lurking in the shadows...", game: maze_game)
  maze_room_3 = maze_game.rooms.first
  maze_room_3.update_attributes(name: "Triwizard Tournament: The Maze Entrance", description: "Welcome, contenstant, to the Triwizard Tournament's final challenge. If you can find it, the Triwizard Cup will be yours! But beware: there are dangers lurking in this maze...")
  maze_room_4 = square_game.rooms.last
  maze_room_4.update_attributes(name: "The Triwizard Tournament Maze", description: "The maze goes on forever. Better keep moving... someone might be lurking in the shadows...")

  maze_room_5 = Room.create(name: "The Triwizard Tournament Maze", description: "The maze goes on forever. Better keep moving... someone might be lurking in the shadows...", game: maze_game)
  maze_room_6 = Room.create(name: "The Triwizard Tournament Maze", description: "The maze goes on forever. Better keep moving... someone might be lurking in the shadows...", game: maze_game)
  maze_room_7 = Room.create(name: "The Triwizard Tournament Maze", description: "The maze goes on forever. Better keep moving... someone might be lurking in the shadows...", game: maze_game)
  maze_room_8 = Room.create(name: "The Triwizard Tournament Maze", description: "The maze goes on forever. Better keep moving... someone might be lurking in the shadows...", game: maze_game)
  maze_room_9 = Room.create(name: "The Triwizard Tournament Maze", description: "The maze goes on forever. Better keep moving... someone might be lurking in the shadows...", game: maze_game)
  maze_room_10 = Room.create(name: "The Triwizard Tournament Maze", description: "The maze goes on forever. Better keep moving... someone might be lurking in the shadows...", game: maze_game)
  maze_room_11 = Room.create(name: "The Triwizard Tournament Maze", description: "The maze goes on forever. Better keep moving... someone might be lurking in the shadows...", game: maze_game)
  maze_room_12 = Room.create(name: "The Triwizard Tournament Maze", description: "The maze goes on forever. Better keep moving... someone might be lurking in the shadows...", game: maze_game)
  maze_room_13 = Room.create(name: "The Triwizard Tournament Maze", description: "The maze goes on forever. Better keep moving... someone might be lurking in the shadows...", game: maze_game)
  maze_room_14 = Room.create(name: "The Triwizard Tournament Maze", description: "The maze goes on forever. Better keep moving... someone might be lurking in the shadows...", game: maze_game)
  maze_room_15 = Room.create(name: "The Triwizard Tournament Maze", description: "The maze goes on forever. Better keep moving... someone might be lurking in the shadows...", game: maze_game)
  maze_room_16 = Room.create(name: "The Triwizard Tournament Maze", description: "The maze goes on forever. Better keep moving... someone might be lurking in the shadows...", game: maze_game)
  maze_room_17 = Room.create(name: "The Triwizard Tournament Maze", description: "The maze goes on forever. Better keep moving... someone might be lurking in the shadows...", game: maze_game)
  maze_room_18 = Room.create(name: "The Triwizard Tournament Maze", description: "The maze goes on forever. Better keep moving... someone might be lurking in the shadows...", game: maze_game)
  maze_room_19 = Room.create(name: "The Triwizard Tournament Maze", description: "The maze goes on forever. Better keep moving... someone might be lurking in the shadows...", game: maze_game)
  maze_room_20 = Room.create(name: "The Triwizard Tournament Maze", description: "The maze goes on forever. Better keep moving... someone might be lurking in the shadows...", game: maze_game)
  maze_room_21 = Room.create(name: "The Triwizard Tournament Maze", description: "The maze goes on forever. Better keep moving... someone might be lurking in the shadows...", game: maze_game)
  maze_room_22 = Room.create(name: "The Triwizard Tournament Maze", description: "The maze goes on forever. Better keep moving... someone might be lurking in the shadows...", game: maze_game)
  maze_room_23 = Room.create(name: "The Maze Exit", description: "The maze goes on forever. Better keep moving... someone might be lurking in the shadows...", game: maze_game)
  maze_room_24 = Room.create(name: "The Triwizard Tournament Maze", description: "The maze goes on forever. Better keep moving... someone might be lurking in the shadows...", game: maze_game)
  maze_room_25 = Room.create(name: "The Triwizard Tournament Maze", description: "The maze goes on forever. Better keep moving... someone might be lurking in the shadows...", game: maze_game)
  progressbar.progress+=25

  # Clear pre-build connections
  maze_room_3.exits.delete_all
  maze_room_4.exits.delete_all
  progressbar.progress+=2


  #Horizontal connections
  maze_room_1.two_way_connect_to(maze_room_2, "East", "East", "West", "West")
  maze_room_2.two_way_connect_to(maze_room_3, "East", "East", "West", "West")
  maze_room_4.two_way_connect_to(maze_room_5, "East", "East", "West", "West")
  progressbar.progress+=3

  maze_room_8.two_way_connect_to(maze_room_9, "East", "East", "West", "West")
  progressbar.progress+=1

  maze_room_12.two_way_connect_to(maze_room_13, "East", "East", "West", "West")
  maze_room_14.two_way_connect_to(maze_room_15, "East", "East", "West", "West")
  progressbar.progress+=2

  maze_room_16.two_way_connect_to(maze_room_17, "East", "East", "West", "West")
  maze_room_18.two_way_connect_to(maze_room_19, "East", "East", "West", "West")
  progressbar.progress+=2

  maze_room_21.two_way_connect_to(maze_room_22, "East", "East", "West", "West")
  maze_room_24.two_way_connect_to(maze_room_25, "East", "East", "West", "West")
  progressbar.progress+=2

  # Vertical connections
  maze_room_1.two_way_connect_to(maze_room_6, "South", "South", "North", "North")
  maze_room_2.two_way_connect_to(maze_room_7, "South", "South", "North", "North")
  maze_room_4.two_way_connect_to(maze_room_9, "South", "South", "North", "North")
  maze_room_5.two_way_connect_to(maze_room_10, "South", "South", "North", "North")
  progressbar.progress+=4

  maze_room_6.two_way_connect_to(maze_room_11, "South", "South", "North", "North")
  maze_room_7.two_way_connect_to(maze_room_12, "South", "South", "North", "North")
  maze_room_8.two_way_connect_to(maze_room_13, "South", "South", "North", "North")
  maze_room_9.two_way_connect_to(maze_room_14, "South", "South", "North", "North")
  progressbar.progress+=4

  maze_room_12.two_way_connect_to(maze_room_17, "South", "South", "North", "North")
  maze_room_15.two_way_connect_to(maze_room_20, "South", "South", "North", "North")
  progressbar.progress+=2

  maze_room_16.two_way_connect_to(maze_room_21, "South", "South", "North", "North")
  maze_room_18.two_way_connect_to(maze_room_23, "South", "South", "North", "North") # This is the final door to 'win'
  maze_room_19.two_way_connect_to(maze_room_24, "South", "South", "North", "North")
  maze_room_20.two_way_connect_to(maze_room_25, "South", "South", "North", "North")
  progressbar.progress+=4

  # Build items in the room
  triwizard_cup = Item.create(name: "The Triwizard Cup", description: "A tropy. Definitly NOT a Portkey...", game: maze_game, owner: maze_room_23)

else
  52.times { progressbar.increment; sleep 0.01 }
end

puts ""
puts "Dolos is waiting. 'rake start' to begin."
puts ""