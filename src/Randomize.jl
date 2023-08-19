module Randomize

  using Random

  struct Randomizer
    random
    type
    Randomizer()=new(rand((1, 100)),Int)
  end

  struct Integer <: Randomizer
    _min::Int;
    _max::Int;

    function Integer(min::Int, max::Int)
      _min = min;
      _max = max
      type=Int
    end
    Integer(min::Int)=new(min, 9)
    Integer()=new(1)
  end

  struct Double <: Randomizer
    _min::Float;
    _max::Float;

    function Double(min::Float, max::Float)
      _min = min;
      _max = max
      type=Float
    end
    Double(min::Float)=new(min, 1)
    Double()=new(0)
  end

  struct String <: Randomizer
    _length::Int
    _letters::String

    function String(length::Int, letters::String)
      _length = length
      _letters = letters
      type=String
    end
    String(length::Int)=new(length, "abcdefghijklmnopqrstuvwxyz")
    String()=new(16)
  end

end # module
