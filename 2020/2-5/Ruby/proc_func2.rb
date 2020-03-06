class Example
    def main
        $w = 10

        z = fun(8, 15)
        puts $w
        puts z
    end

    def fun(x, y)
        $w = 100
        x + y
    end
end
if __FILE__ == $0
    example = Example.new
    example.main
end