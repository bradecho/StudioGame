  require_relative 'player'
  require_relative 'die'
  require_relative 'treasure_trove'
  
  
  # The following 2 lines worked with the remmed out code below
  #@treasurearray = ['pie','bottle','hammer','skillett','broomstick','crowbar']
  #@pointarray = [5,25,50,100,200,400]
  
  
module GameTurn

  def self.take_turn(player)
    die = Die.new
    case die.roll
    when 1..2
      player.blam
    when 3..4
      puts "#{player.name} was skipped."
    else
      player.w00t
    end
  
    treasure = TreasureTrove.random
    #puts "#{player.name} found a #{treasure.name} worth #{treasure.points} points."
    player.found_treasure(treasure)
  end
end

#def self.take_turn2(player)
  #die = Die.new
  #case die.roll
  #when 1
    #puts "#{player.name} found a #{@treasurearray[0]} worth #{@pointarray[0]} points."
    
    #when 2
    #puts "#{player.name} found a #{@treasurearray[1]} worth #{@pointarray[1]} points."
    
    #when 3
   # puts "#{player.name} found a #{@treasurearray[2]} worth #{@pointarray[2]} points."
    
  #when 4
    #puts "#{player.name} found a #{@treasurearray[3]} worth #{@pointarray[3]} points."
    
    #when 5
   # puts "#{player.name} found a #{@treasurearray[4]} worth #{@pointarray[4]} points."
    
  #when 6
    #puts "#{player.name} found a #{@treasurearray[5]} worth #{@pointarray[5]} points."
    #end 
  
#end
#end


if __FILE__ == $0
   player = Player.new("curly",125)
   GameTurn.take_turn(player)
end