module Array2DTracer

  using ..Commander

  struct Class
    key
    nofield
  
    function Class(title)
      Commander.inc()
      className = "Array2DTracer"
      key = Commander.randomizeKey()
      Commander.command(key, className, [title])
      new(key,missing)
    end
    function Class()
        Class("")
    end
  end

  function set(c::Class, array2d)
      Commander.command(c.key, "set", [array2d]);
  end

  function patch(c::Class, x, y, v)
      Commander.command(c.key, "patch", [x-1, y-1, v]);
  end

  function patch(c::Class, x, y)
      Commander.command(c.key, "patch", [x-1, y-1]);
  end

  function depatch(c::Class, x, y)
      Commander.command(c.key, "depatch", [x-1, y-1]);
  end

  function select(c::Class, sx, sy, ex, ey)
      Commander.command(c.key, "select", [sx-1, sy-1, ex-1, ey-1]);
  end

  function select(c::Class, x, y)
      Commander.command(c.key, "select", [x-1, y-1]);
  end

  function selectRow(c::Class, x, sy, ey)
      Commander.command(c.key, "selectRow", [x-1, sy-1, ey-1]);
  end

  function selectCol(c::Class, y, sx, ex)
      Commander.command(c.key, "selectCol", [y-1, sx-1, ex-1]);
  end

  function deselect(c::Class, sx, sy, ex, ey)
      Commander.command(c.key, "deselect", [sx-1, sy-1, ex-1, ey-1]);
  end

  function deselect(c::Class, x, y)
      Commander.command(c.key, "deselect", [x-1, y-1]);
  end

  function deselectRow(c::Class, x, sy, ey)
      Commander.command(c.key, "deselectRow", [x-1, sy-1, ey-1]);
  end

  function deselectCol(c::Class, y, sx, ex)
      Commander.command(c.key, "deselectCol", [y-1, sx-1, ex-1]);
  end

end # module
