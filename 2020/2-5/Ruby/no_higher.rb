class Example
    def main
        i = 1
        while (i < 6)
            puts i
            i += 1
        end

        i = 1
        while (i < 6)
            puts "*" * i
            i += 1
        end
    end
end
if __FILE__ == $0
    example = Example.new
    example.main
end