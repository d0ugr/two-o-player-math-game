require "./Question"

class Turn

  def initialize(player)
    @player = player
  end

  def go
    if (Question.new.ask(@player)) then
      @player.score += 1
    else
      @player.lives -= 1
    end
  end

end
