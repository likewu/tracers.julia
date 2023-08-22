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

  function set(array1d)
      command(c.key, "set", [array1d]);
  end

  function patch(x, v)
      command(c.key, "patch", [x-1, v]);
  end

  function patch(x)
      command(c.key, "patch", [x-1]);
  end

  function depatch(x)
      command(c.key, "depatch", [x-1]);
  end

  function select(sx, ex)
      command(c.key, "select", [sx-1, ex-1]);
  end

  function select(x)
      command(c.key, "select", [x-1]);
  end

  function deselect(sx, ex)
      command(c.key, "deselect", [sx-1, ex-1]);
  end

  function deselect(x)
      command(c.key, "deselect", [x-1]);
  end

  function chart(chartTracer)
      command(c.key, "chart", [chartTracer]);
  end

end # module
