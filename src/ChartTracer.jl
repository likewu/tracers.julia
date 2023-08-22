module ChartTracer

  using ..Commander

  struct Class
    key
    nofield
  end
  function Class(title)
    Commander.inc()
    className = "ChartTracer"
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
      command(c.key, "patch", [x, v]);
  end

  function patch(x)
      command(c.key, "patch", [x]);
  end

  function depatch(x)
      command(c.key, "depatch", [x]);
  end

  function select(sx, ex)
      command(c.key, "select", [sx, ex]);
  end

  function select(x)
      command(c.key, "select", [x]);
  end

  function deselect(sx, ex)
      command(c.key, "deselect", [sx, ex]);
  end

  function deselect(x)
      command(c.key, "deselect", [x]);
  end

  function chart(chartTracer)
      command(c.key, "chart", [chartTracer]);
  end

end # module
