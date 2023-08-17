module Commander

  export Commander

  using JSON
  using ..Randomize

  const MAX_COMMANDS = 1000000;
  const MAX_OBJECTS = 100;

  objectCount = 0;

  commands: Command[] = [];
  const key: string;

  function Commander(iArguments::IArguments)
    Commander.objectCount++;
    const className = "Commander"
    key = randomizeKey();
    command(className, iArguments);
  end

  #=
   * @ignore
   =#
  function init()
    commands = [];
    objectCount = 0;
  end

  function command(key: string | null, method: string, iArguments: IArguments)
    const args = Array.from(iArguments);
    push(commands, {
      key,
      method,
      args: JSON.parse(JSON.json(args)),
    });
    if (this.commands.length > MAX_COMMANDS) throw new Error("Too Many Commands");
    if (this.objectCount > MAX_OBJECTS) throw new Error("Too Many Objects");
  end

  function randomizeKey()
    return Randomize.String({length: 8, letters: "abcdefghijklmnopqrstuvwxyz0123456789"});
  end

  #=
   * Remove the tracer.
   =#
  function destroy() {
    Commander.objectCount--;
    this.command("destroy", arguments);
  }

  function command(method: string, iArguments: IArguments) {
    Commander.command(this.key, method, iArguments);
  }

  function toJSON() {
    return this.key;
  end

  function __init__()
    if !ENV["ALGORITHM_VISUALIZER"]
      using HTTP
      atexit() do
         resp = HTTP.post("https://algorithm-visualizer.org/api/visualizations", body=Dict("content" => JSON.json(Commander.commands)))
      end
    end
    nothing
  end

end # module
