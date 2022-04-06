class GuessingGame
    
    attr_reader :num_attempts

    def initialize(min,max)
        @secret_num = rand(min..max)
        @num_attempts = 0
        @game_over = false
    end

    def game_over?
        @game_over
    end

    def check_num(n)
        @num_attempts += 1
        @game_over = true if n == @secret_num
        puts 'you win' if n == @secret_num
        puts n > @secret_num? 'too big' : 'too small'
    end

    def ask_user
        puts 'enter a number'
        check_num(gets.chomp.to_i)
    end

end
