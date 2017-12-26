
#require_relative 'player'
require_relative '../lib/clumsyplayer'
require_relative '../lib/berserk_player'
require_relative '../lib/game'

player1 = StudioGame::Player.new("moe")
player2 = StudioGame::Player.new("larry", 60)
player3 = StudioGame::Player.new("curly", 125)
player4 = StudioGame::ClumsyPlayer.new("klutz", 105)
player5 = StudioGame::BerserkPlayer.new("berserk", 50)


knuckleheads = StudioGame::Game.new("knuckleheads")
#knuckleheads.load_players("players.csv")

default_player_file = File.join(File.dirname(__FILE__), 'players.csv')
knuckleheads.load_players(ARGV.shift || default_player_file)

#knuckleheads.load_players(ARGV.shift || "players.csv")

knuckleheads.add_player(player5)
knuckleheads.add_player(player4)
knuckleheads.add_player(player3)
knuckleheads.add_player(player2)
knuckleheads.add_player(player1)


loop do
  puts "How many game rounds? ('quit' to exit)"
  # in the next line I used the variable name rounds, but they used answer
  rounds = gets.chomp.downcase
  #puts answer
  
    case rounds
      when (/^\d+$/)  
        knuckleheads.play(rounds.to_i)
		  when 'quit', 'exit'
        puts "Goodbye"
        knuckleheads.print_stats
	      break
      else
        puts "You did not enter 'quit' or a number."
    end
  end

=begin
if answer == "quit" then
    puts "Goodbye"
    exit
  elsif answer.is_a? Numeric then
    knuckleheads.play(rounds)
  else
    puts "You did not enter 'quit' or a number."
  end
=end


        knuckleheads.print_stats
        knuckleheads.save_high_scores




#knuckleheads.print_stats



