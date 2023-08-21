module VerticalLayout

  using ..Commander

  struct Class
    key
    nofield
  end
  function Class(children)
    Commander.inc()
    className = "VerticalLayout"
    key = Commander.randomizeKey()
    Commander.command(key, className, [e.key for e in children])
    Class(key,missing)
  end

end # module
