require_relative 'player'
require_relative 'game_turn'
require_relative 'treasure_trove'

module StudioGame
class Game
  
  attr_accessor :title
  
  def initialize(title)
    @title = title
    @players = []
  end
  
  def load_players (from_file)
    File.readlines(from_file).each do |line|
      name, health = line.split(',')   
      player = Player.new(name, Integer(health))
      add_player(player)
     end
  end
  
  
  def add_player(a_player)
    @players.push(a_player)
  end
  
  def play(rounds)    
    puts "There are #{@players.size} players in #{@title}: "
    
     @players.each do |player|
        puts player
      end
      
      treasures = TreasureTrove::TREASURES
      puts "\nThere are #{treasures.size} treasures to be found:"
      treasures.each do |treasure|
        puts "A #{treasure.name} is worth #{treasure.points} points"
    end
      
   # the following will loop upto the total number of rounds 
    1.upto(rounds) do |round|
      puts "\nRound #{round}:"
      @players.each do |player|
        GameTurn.take_turn(player)
      end
    end 
  end
      
      
  def print_name_and_health(player)
    puts "#{player.name}  (#{player.health})"
  end
      
  def total_points
    @players.reduce(0) { |sum, player| sum + player.points }
  end    

  def high_score_entry(player)
    formatted_name = player.name.ljust(20, '.')
    puts "#{formatted_name} #{player.score}"
  end

  def print_stats
    puts "\n#{@title} Statistics:"
    
    
    
    strong_players, wimpy_players = @players.partition { |player| player.strong? }
    
    #strong_players = @players.select { |player| player.strong? }
    #wimpy_players = @players.reject { |player| player.strong? }
    #sorted_players = [@players.select, @players.reject]
    
    #this sorts by the score and it works
    #sorted_players = @players.sort { |a, b| b.score <=> a.score }
    
    puts "#{strong_players.size} strong players:"
    strong_players.each do |player|
      print_name_and_health(player)
    end
      #puts "#{player.name} (#{player.health})"
      #end
    puts "#{wimpy_players.size} wimpy players:"
    wimpy_players.each do |player|
      print_name_and_health(player)
    end
      #puts "#{player.name} (#{player.health})"
      #end
=begin    
    # this puts the score using periods
    puts "\n#{@title} High Scores:"
    #sorted_players.each do |player|  # this was remmed to replace with a global
    @players.sort.each do |player|
      formatted_name = player.name.ljust(20, '.')
      puts "#{formatted_name} #{player.score}"
    end
=end          
    
    #puts "\n#{@title} High Scores:"
    #sorted_players.each do |player|  # this was remmed to replace with a global
    puts "\n#{@title} High Scores:"
     @players.sort.each do |player|
       puts high_score_entry(player)
     end
    
    puts "\n#{total_points} total points from treasures found"
    @players.sort.each do |player|
      puts "\n#{player.name}'s point totals:"
      player.each_found_treasure do |treasure|
        puts "#{treasure.points} total #{treasure.name} points"
      end
      puts "#{player.points} grand total points"
    end
        
    puts "\n#{@title} High Scores:"
    @players.sort.each do |player|
     # formatted_name = player.name.ljust(20, '.')
      #puts "#{formatted_name} #{player.score}"
    end
    
    def save_high_scores(to_file='high_scores.txt')
      File.open(to_file, "w") do |file|
        file.puts "#{@title} High Scorpssdafads:"
        @players.sort.each do |player|
            #file.puts high_score_entry(player) -- THIS SHOULD WORK BUT DOES NOT
            
            formatted_name = player.name.ljust(20, '.')
            file.puts "#{formatted_name} #{player.score}"
        end
      end
    end  
  end
end
end
