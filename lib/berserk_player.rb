require_relative 'player'

module StudioGame


class BerserkPlayer < Player
  def initialize(name, health=100)
    super(name, health)
    @wOOt_count = 0 
  end

  def berserk?
    @wOOt_count > 5
  end
  
  def w00t
    super
    @wOOt_count += 1
    puts "#{@name} is berserk!" if berserk?
  end
  
  
  def blam
    if berserk?
      w00t
    else
      super
    end
  end
end
end

if __FILE__ == $0
  berserker = BerserkPlayer.new("berserker", 50)
  6.times { berserker.w00t }
  2.times { berserker.blam }
  puts berserker.health
  
end

=begin could also use the following for the blam  above

def blam
  berserk? ? w00t : super
end
=end