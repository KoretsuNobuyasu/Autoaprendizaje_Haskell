class Example
    def main
        x = 8

        if x < 10
        then
            x = x + 5
        else
            x = x - 5
        end
        
        puts x
    end
end

if __FILE__ == $0
    example = Example.new
    example.main
end