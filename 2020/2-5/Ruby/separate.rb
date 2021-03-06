class Example
    $n = 0
    def main
        id = []
        action = add(sub(add(id, 15), 8), 5)
        run(action)
        puts $n
    end

    def run(act)
        act.each do |a|
            if a[0] == :add
                    $n += a[1]
            elsif a[0] == :sub
                    $n -= a[1]
            end
        end
    end

    def add (a, x)
        a.push [:add, x]
    end

    def sub(a, x)
        a.push [:sub, x]
    end
end

if __FILE__ == $0
    example = Example.new
    example.main
end