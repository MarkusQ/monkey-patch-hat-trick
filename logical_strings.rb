
class String
    def reverse
        case self
          when /^It is not true that (.*)/: $1
          else "It is not true that #{self}"
          end
        end
    end

s = "This string is 34 characters long."
print "#{s.inspect}.reverse = #{s.reverse}\n"
print "#{s.inspect}.length = #{s.length}\n"
print "#{s.inspect}.bortch = #{s.bortsch}\n" rescue Exception

