require "monkeypatch_condom"

print "With affable strings----------------------------\n"
in_a_monkeypatch_condom %q{
    require "affable_strings"
    $s1 = "this is a test"
    }

print "With loginal strings----------------------------\n"
in_a_monkeypatch_condom %q{
    require "logical_strings"
    $s2 = "this is a test"
    }

print "In a context which sees both------------------------\n"
print "Reversing the affable string #{$s1.inspect} gives #{$s1.reverse}\n"
print "Reversing the logical string #{$s2.inspect} gives #{$s2.reverse}\n"
print "Asking the affable string #{$s1.inspect} to use twitter gives #{$s1.use_twitter}\n"
print "Asking the logical string #{$s2.inspect} to use twitter gives \n"
print "#{$s2.use_twitter}\n"
