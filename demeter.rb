# Law of Demeter
# Low Coupling
# Localising information
# Small interfaces

# WRONG

class C
  def m
    # sends message to object O
    O.new.do_a_thing
  end
end

# BETTER

class C
  def m(o)
    # sends message to object o == O.new
    o.do_a_thing
  end
end

# ALSO BETTER

class C
  def initialize(o)
    @o = o
  end

  def m
    # sends message to object @o == O.new
    @o.do_a_thing
  end
end

# WHY IS DEMETER MISREAD AS BEING ABOUT CHAINING?

class C
  def m(o)
    # Because stuff like this that violates Demeter
    # because it's reaching into too many types of class
    # in one line
    o.do_a_thing.upcase.to_i + 2
    # tends to be refactored to this
    str = o.do_a_thing
    upcase_str = str.upcase
    int_string_plus_two = upcase_str.to_i + 2
  end
end


