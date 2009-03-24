
module MonkeypatchCondom
    def shim_classes
        Object.constants.each { |c|
            case Object.const_get(c)
            when Class:  module_eval("class #{c} < ::#{c};   end")
            when Module: eval("module #{c}; include ::#{c}; end")
            end unless c == 'Class'
        } 
    end
    def isolate(s)
        module_eval s.split(/("[^"]*")/).collect { |x| (x[0,1] == '"') ? "String.new(#{x})" : x }.join 
    end
    def require(filename)
        if File.exists?(filename+".rb")
            isolate File.read(filename+".rb")
        else
            super
        end
    end
end

def in_a_monkeypatch_condom(s)
    Module.new { 
        extend MonkeypatchCondom
        shim_classes
        isolate(s)
    }
end


