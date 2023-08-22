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
      Commander.command(c.key, "patch", [x, y, v]);
  end

  function patch(c::Class, x, y)
      Commander.command(c.key, "patch", [x, y]);
  end

  function depatch(c::Class, x, y)
      Commander.command(c.key, "depatch", [x, y]);
  end

  function select(c::Class, sx, sy, ex, ey)
      Commander.command(c.key, "select", [sx, sy, ex, ey]);
  end

  function select(c::Class, x, y)
      Commander.command(c.key, "select", [x, y]);
  end

  function selectRow(c::Class, x, sy, ey)
      Commander.command(c.key, "selectRow", [x, sy, ey]);
  end

  function selectCol(c::Class, y, sx, ex)
      Commander.command(c.key, "selectCol", [y, sx, ex]);
  end

  function deselect(c::Class, sx, sy, ex, ey)
      Commander.command(c.key, "deselect", [sx, sy, ex, ey]);
  end

  function deselect(c::Class, x, y)
      Commander.command(c.key, "deselect", [x, y]);
  end

  function deselectRow(c::Class, x, sy, ey)
      Commander.command(c.key, "deselectRow", [x, sy, ey]);
  end

  function deselectCol(c::Class, y, sx, ex)
      Commander.command(c.key, "deselectCol", [y, sx, ex]);
  end

end # module
