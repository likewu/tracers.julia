module Layout

  using ..Commander

  struct Class
    key
    nofield
  end
  function Class(children)
    Commander.inc()
    className = "Layout"
    key = Commander.randomizeKey()
    Commander.command(key, className, [children])
    Class(key,missing)
  end

  function setRoot(child)
      Commander.command(missing, "setRoot", [child.key]);
  end

  function add(c::Class, child, index)
      Commander.command(c.key, "add", [child, index]);
  end

  function add(c::Class, child)
      Commander.command(c.key, "add", [child]);
  end

  function remove(c::Class, child)
      Commander.command(c.key, "remove", [child]);
  end

  function removeAll(c::Class)
      Commander.command(c.key, "removeAll", []);
  end

end # module
