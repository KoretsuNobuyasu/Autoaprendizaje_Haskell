class Example
    def procedure
        $ret = $arg + 10
    end

    def function(x)
        x + 10
    end

    def main
        $arg = 5
        procedure()
        puts $ret
        puts function(5)
    end
end

if __FILE__ == $0
    example = Example.new
    example.main
end