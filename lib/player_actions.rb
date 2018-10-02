module PlayerActions
  
  def look
    puts player.room.name
    puts ""
    puts player.room.description
  end
end