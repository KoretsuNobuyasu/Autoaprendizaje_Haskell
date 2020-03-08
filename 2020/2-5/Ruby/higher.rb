class Example
    def main
        five {|i| puts i}
        five {|i| puts "*" * i}
    end

    def five
        i = 1
        while ( i < 6)
            yield i
            i += 1
        end
    end
end

if __FILE__ == $0
    example = Example.new
    example.main
end