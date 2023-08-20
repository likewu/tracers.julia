module Array2DTracer

  using ..Commander

  function Class(title)
    Commander.inc()
    className = "Array2DTracer"
    key = Commander.randomizeKey()
    Commander.command(className, title)
  end

  function Class()
      Class([])
  end

end # module
