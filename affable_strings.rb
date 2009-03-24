class String
    def method_missing(*args)
        "I beg your pardon, I don't understand: #{args.inspect}"
        end
    end
s = "This string is 34 characters long."
print "#{s.inspect}.reverse = #{s.reverse}\n"
print "#{s.inspect}.length = #{s.length}\n"
print "#{s.inspect}.bortch = #{s.bortsch}\n"
