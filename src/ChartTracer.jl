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
      Commander.command(c.key, "set", [array1d]);
  end

  function patch(x, v)
      Commander.command(c.key, "patch", [x-1, v]);
  end

  function patch(x)
      Commander.command(c.key, "patch", [x-1]);
  end

  function depatch(x)
      Commander.command(c.key, "depatch", [x-1]);
  end

  function select(sx, ex)
      Commander.command(c.key, "select", [sx-1, ex-1]);
  end

  function select(x)
      Commander.command(c.key, "select", [x-1]);
  end

  function deselect(sx, ex)
      Commander.command(c.key, "deselect", [sx-1, ex-1]);
  end

  function deselect(x)
      Commander.command(c.key, "deselect", [x-1]);
  end

  function chart(chartTracer)
      Commander.command(c.key, "chart", [chartTracer]);
  end

end # module
