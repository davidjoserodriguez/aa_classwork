require_relative "code"

class Mastermind


    def initialize(length)
        @secret_code = Code.random(length)
    end

    def print_matches(code_instance)
       
        p @secret_code.num_exact_matches(code_instance)
        p @secret_code.num_near_matches(code_instance)

    end

    def ask_user_for_guess
        print "Enter a code"
        answer = gets.chomp
        array = Code.from_string(answer)
        p @secret_code.num_exact_matches(array)
        p @secret_code.num_near_matches(array)
        array == @secret_code

    end
end
