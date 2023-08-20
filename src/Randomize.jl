module Randomize

  using Random

  abstract type Randomizer end
  random(a::Randomizer) = a.random
  type(a::Randomizer) = a.type
  #Randomizer()=Randomizer(rand((1, 100)),Int)

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
    _min::Float64;
    _max::Float64;

    function Double(min::Float64, max::Float64)
      _min = min;
      _max = max
      type=Float64
    end
    Double(min::Float64)=new(min, 1)
    Double()=new(0)
  end

  struct String <: Randomizer
    _length::Int
    _letters::Base.String

    function String(length::Int64, letters::Base.String)
      _length = length
      _letters = letters
      type=Base.String
    end
    String(length::Int64)=new(length, "abcdefghijklmnopqrstuvwxyz")
    String()=new(16)
  end

end # module
