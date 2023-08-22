module GraphTracer

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
    className = "GraphTracer"
    key = Commander.randomizeKey()
    Commander.command(key, className, [title])
    Class(key,missing)
  end

  function Class()
      Class("")
  end

  function set(c::Class)
    Commander.command(c.key, "set", []);
  end

  function reset(c::Class)
    Commander.command(c.key, "reset", []);
  end


  function set(c::Class, array2d)
      Commander.command(c.key, "set", [array2d]);
  end

  function directed(c::Class, isDirected)
      Commander.command(c.key, "directed", [isDirected])
      return c;
  end

  function directed(c::Class)
      Commander.command(c.key, "directed", [])
      return c;
  end

  function weighted(c::Class, isWeighted)
      Commander.command(c.key, "weighted", [isWeighted])
      return c;
  end

  function weighted(c::Class)
      Commander.command(c.key, "weighted", [])
      return c;
  end

  function layoutCircle(c::Class)
      Commander.command(c.key, "layoutCircle", [])
      return c;
  end

  function layoutTree(c::Class, root, sorted)
      Commander.command(c.key, "layoutTree", [root, sorted])
      return c;
  end

  function layoutTree(c::Class, root)
      Commander.command(c.key, "layoutTree", [root])
      return c;
  end

  function layoutTree(c::Class)
      Commander.command(c.key, "layoutTree", [])
      return c;
  end

  function layoutRandom(c::Class)
      Commander.command(c.key, "layoutRandom", [])
      return c;
  end

  function addNode(c::Class, id, weight, x, y, visitedCount, selectedCount)
      Commander.command(c.key, "addNode", [id, weight, x-1, y-1, visitedCount, selectedCount]);
  end

  function addNode(c::Class, id, weight, x, y, visitedCount)
      Commander.command(c.key, "addNode", [id, weight, x-1, y-1, visitedCount]);
  end

  function addNode(c::Class, id, weight, x, y)
      Commander.command(c.key, "addNode", [id, weight, x-1, y-1]);
  end

  function addNode(c::Class, id, weight, x)
      Commander.command(c.key, "addNode", [id, weight, x-1]);
  end

  function addNode(c::Class, id, weight)
      Commander.command(c.key, "addNode", [id, weight]);
  end

  function addNode(c::Class, id)
      Commander.command(c.key, "addNode", [id]);
  end

  function updateNode(c::Class, id, weight, x, y, visitedCount, selectedCount)
      Commander.command(c.key, "updateNode", [id, weight, x-1, y-1, visitedCount, selectedCount]);
  end

  function updateNode(c::Class, id, weight, x, y, visitedCount)
      Commander.command(c.key, "updateNode", [id, weight, x-1, y-1, visitedCount]);
  end

  function updateNode(c::Class, id, weight, x, y)
      Commander.command(c.key, "updateNode", [id, weight, x-1, y-1]);
  end

  function updateNode(c::Class, id, weight, x)
      Commander.command(c.key, "updateNode", [id, weight, x-1]);
  end

  function updateNode(c::Class, id, weight)
      Commander.command(c.key, "updateNode", [id, weight]);
  end

  function updateNode(c::Class, id)
      Commander.command(c.key, "updateNode", [id]);
  end

  function removeNode(c::Class, id)
      Commander.command(c.key, "removeNode", [id]);
  end

  function addEdge(c::Class, source, target, weight, visitedCount, selectedCount)
      Commander.command(c.key, "addEdge", [source, target, weight, visitedCount, selectedCount]);
  end

  function addEdge(c::Class, source, target, weight, visitedCount)
      Commander.command(c.key, "addEdge", [source, target, weight, visitedCount]);
  end

  function addEdge(c::Class, source, target, weight)
      Commander.command(c.key, "addEdge", [source, target, weight]);
  end

  function addEdge(c::Class, source, target)
      Commander.command(c.key, "addEdge", [source, target]);
  end

  function updateEdge(c::Class, source, target, weight, visitedCount, selectedCount)
      Commander.command(c.key, "updateEdge", [source, target, weight, visitedCount, selectedCount]);
  end

  function updateEdge(c::Class, source, target, weight, visitedCount)
      Commander.command(c.key, "updateEdge", [source, target, weight, visitedCount]);
  end

  function updateEdge(c::Class, source, target, weight)
      Commander.command(c.key, "updateEdge", [source, target, weight]);
  end

  function updateEdge(c::Class, source, target)
      Commander.command(c.key, "updateEdge", [source, target]);
  end

  function removeEdge(c::Class, source, target)
      Commander.command(c.key, "removeEdge", [source, target]);
  end

  function visit(c::Class, target, source, weight)
      Commander.command(c.key, "visit", [target, source, weight]);
  end

  function visit(c::Class, target, source)
      Commander.command(c.key, "visit", [target, source]);
  end

  function visit(c::Class, target)
      Commander.command(c.key, "visit", [target]);
  end

  function leave(c::Class, target, source, weight)
      Commander.command(c.key, "leave", [target, source, weight]);
  end

  function leave(c::Class, target, source)
      Commander.command(c.key, "leave", [target, source]);
  end

  function leave(c::Class, target)
      Commander.command(c.key, "leave", [target]);
  end

  function select(c::Class, target, source)
      Commander.command(c.key, "select", [target, source]);
  end

  function select(c::Class, target)
      Commander.command(c.key, "select", [target]);
  end

  function deselect(c::Class, target, source)
      Commander.command(c.key, "deselect", [target, source]);
  end

  function deselect(c::Class, target)
      Commander.command(c.key, "deselect", [target]);
  end

  function log(c::Class, logTracer)
      Commander.command(c.key, "log", [logTracer]);
  end

end # module
