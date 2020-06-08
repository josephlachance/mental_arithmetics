class RandomNumber
  attr_reader :number
  def initialize
      @number = rand(01..99)
  end
end

class NumberFlashcard
  attr_accessor :answer
  attr_reader :solution

  def initialize number1
    @num_1 = number1
    @solution = 100 - number1.number
  end

  def is_correct?
    answer == @solution
  end

  def to_s
    "#{@num_1.number}"
  end
end

class Presenter
  attr_reader :flashcard

  def ask
    puts "What is #{flashcard} from 100? "
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

20.times do
  num_1 = RandomNumber.new
  num_2 = RandomNumber.new
  flashcard = NumberFlashcard.new num_1
  presenter.play flashcard
end


presenter.play
