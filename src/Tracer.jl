module Tracer

  using ..Commander
  
  #=
   * Remove the tracer.
   =#
  function delay()
     Commander.command(missing, "delay", []);
  end

  function Class(title)
    Commander.inc()
    className = "Tracer"
    key = Commander.randomizeKey()
    Commander.command(className, title)
  end

  function Class()
      Class([])
  end

  function set()
    Commander.command("set", []);
  end

  function reset()
    Commander.command("reset", []);
  end

end # module
