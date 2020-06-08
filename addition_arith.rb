class RandomNumber
  attr_reader :number
  def initialize
    @number = rand(1..99)
  end
end

class NumberFlashcard
  attr_accessor :answer
  attr_reader :solution

  def initialize number1, number2
    @num_1 = number1
    @num_2 = number2
    @solution = number1.number + number2.number
  end

  def is_correct?
    answer == @solution
  end

  def to_s
    "#{@num_1.number} + #{@num_2.number}"
  end
end

class Presenter
  attr_reader :flashcard

  def ask
    puts "yo brother what is #{flashcard} ? "
    flashcard.answer = gets.chomp.to_i
  end

  def check
    if flashcard.is_correct?
      puts "hell yeah bruddah"
    else
      puts "get a job the answer is #{flashcard.solution}"
    end
  end

  def play flashcard
    @flashcard = flashcard
    ask
    check
  end
end


presenter = Presenter.new

10.times do
  num_1 = RandomNumber.new
  num_2 = RandomNumber.new
  flashcard = NumberFlashcard.new num_1, num_2
  presenter.play flashcard
end


presenter.play
