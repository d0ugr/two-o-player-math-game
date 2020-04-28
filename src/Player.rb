class Player

  attr_accessor :name, :lives, :score

  def initialize(name, lives)
    @name  = name
    @lives = lives
    @score = 0
  end

  def is_dead?
    return self.lives <= 0
  end

end
