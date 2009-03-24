
module MonkeypatchCondom
    require 'rational'
    def shim_classes
        Object.constants.each { |c|
            case Object.const_get(c)
              when Class:  module_eval("class #{c} < ::#{c};   end")
              when Module: eval("module #{c}; include ::#{c}; end")
              end unless c == 'Class'
            } 
        end
    def require(filename)
        if File.exists?(filename+".rb")
            #print "Caught #{filename}\n"
            s = File.read(filename+".rb")
            s = s.split(/("[^"]*")/).collect { |x|
                if x[0,1] == '"'
                    "String.new(#{x})"
                  else
                    x.gsub(/([^$\d])\b(\d+)(?!\.)\b/,'\1Rational(\2,1)') #.gsub(/def ([a-z]+)/,'def self.\1')
                  end
              }.join
            print s,"\n\n" if filename =~ /rational/
            module_eval(s)
          else
            super
          end
        end
    public :require
    end

def in_a_monkeypatch_condom(s)
    Module.new { 
        extend MonkeypatchCondom
        shim_classes
        module_eval s.split(/("[^"]*")/).collect { |x| (x[0,1] == '"') ? "String.new(#{x})" : x }.join 
        }
    end


