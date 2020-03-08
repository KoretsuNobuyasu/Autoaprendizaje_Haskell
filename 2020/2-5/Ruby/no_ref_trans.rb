class Example
    $n = 0
    def main
        puts add(3, 2) + add(1, 1) * add(2, 1)
    end

    def add(x, y)
        $n += 1
        x + y + $n
    end
end

if __FILE__ == $0
    example = Example.new
    example.main
end