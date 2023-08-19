module Commander

  export Commander

  using JSON
  using ..Randomize

  const MAX_COMMANDS = 1000000;
  const MAX_OBJECTS = 100;

  struct Command
    key::String
    method::String
    args
  end

  objectCount = 0;

  commands = [];
  const key::String;

  function Commander(args)
    objectCount++;
    const className = "Commander"
    key = randomizeKey();
    command(className, args);
  end

  #=
   * @ignore
   =#
  function init()
    commands = [];
    objectCount = 0;
  end

  function command(key, method, args)
    const args = Array.from(args);
    push(commands, Command(
      key,
      method,
      args: JSON.parse(JSON.json(args)),
    ))
    if length(commands)>MAX_COMMANDS throw("Too Many Commands") end
    if objectCount>MAX_OBJECTS throw("Too Many Objects") end
  end

  function randomizeKey()
    return Randomize.String(8, "abcdefghijklmnopqrstuvwxyz0123456789")
  end

  #=
   * Remove the tracer.
   =#
  function destroy()
    objectCount--;
    command("destroy", []);
  end

  function command(method, args) {
    command(key, method, args);
  }

  function toJSON() {
    return key;
  end

  function __init__()
    atexit() do
      if !ENV["ALGORITHM_VISUALIZER"]
        using HTTP
        resp = HTTP.post("https://algorithm-visualizer.org/api/visualizations", body=Dict("content" => JSON.json(Commander.commands)))
      else
        resp=JSON.json(commands)
      end
    end
    nothing
  end

end # module
