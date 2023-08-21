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
    Commander.command(key, className, title)
    Class(key,missing)
  end

  function Class()
      Class([])
  end

  function set(c::Class)
    Commander.command(c.key, "set", []);
  end

  function reset(c::Class)
    Commander.command(c.key, "reset", []);
  end


  function set(c::Class, array2d)
      command("set", [array2d]);
  end

  function directed(c::Class, isDirected)
      command("directed", [isDirected])
      return this;
  end

  function directed(c::Class)
      command("directed", [])
      return this;
  end

  function weighted(c::Class, isWeighted)
      command("weighted", [isWeighted])
      return this;
  end

  function weighted(c::Class)
      command("weighted", [])
      return this;
  end

  function layoutCircle(c::Class)
      command("layoutCircle", [])
      return this;
  end

  function layoutTree(c::Class, root, sorted)
      command("layoutTree", [root, sorted])
      return this;
  end

  function layoutTree(c::Class, root)
      command("layoutTree", [root])
      return this;
  end

  function layoutTree(c::Class)
      command("layoutTree", [])
      return this;
  end

  function layoutRandom(c::Class)
      command("layoutRandom", [])
      return this;
  end

  function addNode(c::Class, id, weight, x, y, visitedCount, selectedCount)
      command("addNode", [id, weight, x, y, visitedCount, selectedCount]);
  end

  function addNode(c::Class, id, weight, x, y, visitedCount)
      command("addNode", [id, weight, x, y, visitedCount]);
  end

  function addNode(c::Class, id, weight, x, y)
      command("addNode", [id, weight, x, y]);
  end

  function addNode(c::Class, id, weight, x)
      command("addNode", [id, weight, x]);
  end

  function addNode(c::Class, id, weight)
      command("addNode", [id, weight]);
  end

  function addNode(c::Class, id)
      command("addNode", [id]);
  end

  function updateNode(c::Class, id, weight, x, y, visitedCount, selectedCount)
      command("updateNode", [id, weight, x, y, visitedCount, selectedCount]);
  end

  function updateNode(c::Class, id, weight, x, y, visitedCount)
      command("updateNode", [id, weight, x, y, visitedCount]);
  end

  function updateNode(c::Class, id, weight, x, y)
      command("updateNode", [id, weight, x, y]);
  end

  function updateNode(c::Class, id, weight, x)
      command("updateNode", [id, weight, x]);
  end

  function updateNode(c::Class, id, weight)
      command("updateNode", [id, weight]);
  end

  function updateNode(c::Class, id)
      command("updateNode", [id]);
  end

  function removeNode(c::Class, id)
      command("removeNode", [id]);
  end

  function addEdge(c::Class, source, target, weight, visitedCount, selectedCount)
      command("addEdge", [source, target, weight, visitedCount, selectedCount]);
  end

  function addEdge(c::Class, source, target, weight, visitedCount)
      command("addEdge", [source, target, weight, visitedCount]);
  end

  function addEdge(c::Class, source, target, weight)
      command("addEdge", [source, target, weight]);
  end

  function addEdge(c::Class, source, target)
      command("addEdge", [source, target]);
  end

  function updateEdge(c::Class, source, target, weight, visitedCount, selectedCount)
      command("updateEdge", [source, target, weight, visitedCount, selectedCount]);
  end

  function updateEdge(c::Class, source, target, weight, visitedCount)
      command("updateEdge", [source, target, weight, visitedCount]);
  end

  function updateEdge(c::Class, source, target, weight)
      command("updateEdge", [source, target, weight]);
  end

  function updateEdge(c::Class, source, target)
      command("updateEdge", [source, target]);
  end

  function removeEdge(c::Class, source, target)
      command("removeEdge", [source, target]);
  end

  function visit(c::Class, target, source, weight)
      command("visit", [target, source, weight]);
  end

  function visit(c::Class, target, source)
      command("visit", [target, source]);
  end

  function visit(c::Class, target)
      command("visit", [target]);
  end

  function leave(c::Class, target, source, weight)
      command("leave", [target, source, weight]);
  end

  function leave(c::Class, target, source)
      command("leave", [target, source]);
  end

  function leave(c::Class, target)
      command("leave", [target]);
  end

  function select(c::Class, target, source)
      command("select", [target, source]);
  end

  function select(c::Class, target)
      command("select", [target]);
  end

  function deselect(c::Class, target, source)
      command("deselect", [target, source]);
  end

  function deselect(c::Class, target)
      command("deselect", [target]);
  end

  function log(c::Class, logTracer)
      command("log", [logTracer]);
  end

end # module
