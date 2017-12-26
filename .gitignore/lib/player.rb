require_relative 'treasure_trove'
require_relative 'playable'

module StudioGame
class Player
  include Playable
  
  attr_accessor :name
  attr_reader :health


  def initialize(name, health=100)
    @name = name.capitalize
    @health = health
    @found_treasures = Hash.new(0)
  end
=begin
  def blam
    @health -= 10
    puts "#{@name} got blammed!"
  end
  
  def w00t
    @health += 15
    puts "#{@name} got w00ted!"
  end
  
  def strong?
    @health > 100
  end
=end
  def score
    @health + points #@name.length
  end
  
  def points
    @found_treasures.values.reduce(0, :+)
  end
  
  
  
  def found_treasure(treasure)
    @found_treasures[treasure.name] += treasure.points
    puts "#{@name} found a #{treasure.name} worth #{treasure.points} points."
  end
  
  def each_found_treasure
    @found_treasures.each do |name, points|
      next_treasure = Treasure.new(name, points)
      yield next_treasure
    end
  end
  
  # this should always return the player array sorted in descending order
    def <=>(other)
      other.score <=> score
    end
    
    def to_s
      "I'm #{@name} with a health = #{@health}, points = #{points}, and a score of #{score}."
    end
  end
end
      

if __FILE__ == $0
  player = Player.new("moe")
  puts player.name
  puts player.health
  player.w00t
  puts player.health
  player.blam
  puts player.health
end