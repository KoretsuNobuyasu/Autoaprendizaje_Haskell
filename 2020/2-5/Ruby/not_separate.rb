class Example
    $n = 0

    def main
        add(15)
        sub(8)
        add(5)
        puts $n
    end

    def add(x)
        $n += x
    end

    def sub(x)
        $n -= x
    end
end

if __FILE__ == $0
    example = Example.new
    example.main
end