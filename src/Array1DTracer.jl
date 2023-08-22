module Array1DTracer

  using ..Commander

  struct Class
    key
    nofield
  end
  function Class(title)
    Commander.inc()
    className = "Array1DTracer"
    key = Commander.randomizeKey()
    Commander.command(key, className, [title])
    Class(key,missing)
  end

  function Class()
      Class("")
  end

  function set(c::Class, array1d)
      Commander.command(c.key, "set", [array1d]);
  end

  function patch(c::Class, x, v)
      Commander.command(c.key, "patch", [x-1, v]);
  end

  function patch(c::Class, x)
      Commander.command(c.key, "patch", [x-1]);
  end

  function depatch(c::Class, x)
      Commander.command(c.key, "depatch", [x-1]);
  end

  function select(c::Class, sx, ex)
      Commander.command(c.key, "select", [sx-1, ex-1]);
  end

  function select(c::Class, x)
      Commander.command(c.key, "select", [x-1]);
  end

  function deselect(c::Class, sx, ex)
      Commander.command(c.key, "deselect", [sx-1, ex-1]);
  end

  function deselect(c::Class, x)
      Commander.command(c.key, "deselect", [x-1]);
  end

  function chart(c::Class, chartTracer)
      Commander.command(c.key, "chart", [chartTracer]);
  end

end # module
