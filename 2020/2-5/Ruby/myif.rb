class Example
    def main
        puts (if true then 88 else 95 / 0 end)
        puts (myif(true, 88, 95 / 0))
    end

    def myif(b, t, e)
        if b then t else e end
    end
end

if __FILE__ == $0
    example = Example.new
    example.main
end