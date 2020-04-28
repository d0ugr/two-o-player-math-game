class Question

  def initialize
    @operand1 = rand(20) + 1
    @operand2 = rand(20) + 1
  end

  def ask(player)
    print "#{player.name}: What is #{@operand1} + #{@operand2}? "
    correct = (gets.chomp.to_i == @operand1 + @operand2)
    if (correct) then
      puts "You are so smrt!\n\n"
    else
      puts "Nope.\n\n"
    end
    return correct
  end

end
