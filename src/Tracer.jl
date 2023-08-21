module Tracer

  using ..Commander
  
  #=
   * Remove the tracer.
   =#
  function delay()
     Commander.command(missing, "delay", []);
  end

  struct Class
    key
    nofield
  end
  function Class(title)
    Commander.inc()
    className = "Tracer"
    key = Commander.randomizeKey()
    Commander.command(key, className, title)
    Class(key,missing)
  end

  function Class()
      Class([])
  end

  function set(c::Class)
    Commander.command(c.key, "set", []);
  end

  function reset(c::Class)
    Commander.command(c.key, "reset", []);
  end

end # module
