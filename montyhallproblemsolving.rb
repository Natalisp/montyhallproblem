class MontyHallProblem
  attr_accessor :prize_door, :player_choice, :month_open, :switch_guess

  DOORS = [1, 2, 3]

  def initialize(prize_door = rand(1..3), player_choice = rand(1..3))
    @prize_door = prize_door
    @player_choice = player_choice
    @monty_open = monty_open
    @switch_guess = switch_guess
  end

  def monty_open
    if @prize_door == @player_choice
    left_doors = DOORS.select {|door| (door != @prize_door)}
    @monty_open = left_doors.sample
    elsif @prize_door != @player_choice
    only_door = DOORS.select {|door| (door != @prize_door) && (door != @player_choice)}
    @monty_open = only_door.sample
    end
  end
  
  def switch_guess
    switch_choice = DOORS.select {|door| (door != @player_choice) && (door !=@monty_open)}
    switch_choice.sample
  end
 end
 
 
def run_sim(num)
    first_choice_wins = 0
    switch_guess_wins = 0
    num.times do 
      an = Monty.new
      if an.prize_door == an.player_choice
         first_choice_wins += 1
      elsif an.prize_door == an.switch_guess
         switch_guess_wins += 1
      end
      
    end
  a = (first_choice_wins.fdiv(num)*100).round(3)
  b = (switch_guess_wins.fdiv(num)*100).round(3)
  
  puts "When they STUCK WITH THEIR ORIGINAL choice they won #{a}% of the times"
  puts "When a contestant SWITCHED their guess they won #{b}% of the times"
  end 
 