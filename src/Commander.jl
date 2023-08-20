module Commander

  export randomizeKey

  using JSON
  using HTTP
  using ..Randomize

  const MAX_COMMANDS = 1000000;
  const MAX_OBJECTS = 100;

  struct Command
    key
    method::String
    args
  end

  objectCount = 0;

  commands = [];
  key = missing

  function Class(args)
    objectCount=objectCount+1
    className = "Commander"
    key = randomizeKey()
    command(className, args)
  end

  #=
   * @ignore
   =#
  function init()
    global
    commands = [];
    global
    objectCount = 0;
  end

  function inc()
    global
    objectCount=objectCount+1
  end

  function command(key, method, args)
    push!(commands, Command(
      key,
      method,
      JSON.parse(JSON.json(args)),
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
    objectCount=objectCount-1
    command("destroy", []);
  end

  function command(method, args)
    command(key, method, args);
  end

  function toJSON()
    return key;
  end

  function __init__()
    atexit() do
      if haskey(ENV, "ALGORITHM_VISUALIZER") && !ENV["ALGORITHM_VISUALIZER"]
        resp = HTTP.post("https://algorithm-visualizer.org/api/visualizations", body=Dict("content" => JSON.json(Dict("Payload"=>Dict("success"=>1, "commands" => commands)))))
      else
        resp=JSON.json(Dict("Payload"=>Dict("success"=>1, "commands" => commands)))
        #resp=JSON.json(Dict("Payload"=>Dict("success"=>0, "errorMessage" => "err")))
        print(resp)
      end
    end
    nothing
  end

end # module
