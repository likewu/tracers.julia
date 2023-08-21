module HorizontalLayout

  using ..Commander

  struct Class
    key
    nofield
  end
  function Class(children)
    Commander.inc()
    className = "HorizontalLayout"
    key = Commander.randomizeKey()
    Commander.command(key, className, [e.key for e in children])
    Class(key,missing)
  end

end # module
