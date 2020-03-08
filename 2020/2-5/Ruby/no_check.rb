class Example
    def main
        n = 123
        if n == 123
            puts "hello"
        else
            puts 15 + "hello"
        end
    end
end

if __FILE__ == $0
    example = Example.new
    example.main
end