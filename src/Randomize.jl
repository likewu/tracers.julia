module Randomize

  using Random

  abstract type Randomizer end

  struct Integer <: Randomizer
    _min::Int;
    _max::Int;
    type

    function Integer(min::Int, max::Int)
      new(min,max,Int64)
    end
    Integer(min::Int)=Integer(min, 9)
    Integer()=Integer(1)
  end

  struct Double <: Randomizer
    _min::Float64;
    _max::Float64;
    type

    function Double(min::Float64, max::Float64)
      new(min,max,Float64)
    end
    Double(min::Float64)=Double(min, 1)
    Double()=Double(0)
  end

  struct String <: Randomizer
    _length::Int64
    _letters::Base.String
    type

    function String(length::Int64, letters::Base.String)
      new(length, letters, Base.String)
    end
    String(length::Int64)=String(length, "abcdefghijklmnopqrstuvwxyz")
    String()=String(16)
  end

  function create(r::Integer)
    return rand(r._min:r._max)
  end
  function create(r::Double)
    return rand(Float64) * (r._max-r._min) + r._min
  end
  function create(r::Randomize.String)
    text = ""
    len=length(r._letters)
    for i=1:r._length
      text=string(text, r._letters[rand(1:len)])
    end
    #print(len,text)
    text
  end

end # module
