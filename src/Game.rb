require "./Player"
require "./Turn"

class Game

  GAME_NAME = "TwO-O-Player Maximum Action Math Madness"

  def initialize(num_players, num_lives)
    # Add players to the game:
    #   Any number of players is supported, including one.
    #   Could also prompt for number of players and names...
    @players = Array.new
    for x in 1..num_players
      @players << Player.new("Player #{x}", num_lives)
    end
    @round = 0
  end

  def start
    puts "\nTHIS IS #{GAME_NAME}\n\n"
    puts "YOU WILL NEVER WANT TO STOP PLAYING\n\n"
    # Bad things happen with an empty array, so check:
    if (@players.size == 0) then
      puts "...IF SOMEONE WOULD JUST PLAY\n\n"
      return
    end
    # Loop until someone dies:
    someone_is_dead = false
    while !someone_is_dead do
      @round += 1
      puts "--- ROUND #{@round}, FIGHT! ---\n\n"
      @players.each{ |player|
        Turn.new(player).go
        someone_is_dead = player.is_dead?
        break if someone_is_dead
      }
    end
    # Print results and bail:
    puts "--- NO MORE GAME ---\n\n"
    dump_results
    puts "Tks 4 playing #{GAME_NAME}"
    puts "Ta ta for now...\n\n"
  end

  private

  def dump_results
    puts "#{@round} rounds\n\n"
    # Sort the players by descending score and dump the list:
    #   If modifying to re-use players to play again, don't sort in place.
    @players
      .sort!{ |x, y| y.score <=> x.score }
      .each{ |player| puts "#{player.name}: #{player.score}" }
    # If the highest score is zero, everyone sucks:
    if (@players[0].score == 0) then
      puts "\nWOW GOOD GOING GUYS\n\n"
    # If the highest score is unique, we have a winner:
    elsif (@players.size > 1 && @players[0].score != @players[1].score) then
      puts "\n#{@players[0].name}: WINNER IS YOU\n\n"
    # Otherwise it's a draw, or someone is playing with themself:
    else
      puts "\nEVERYONE IS A WINNER!\n\n"
    end
  end

end
