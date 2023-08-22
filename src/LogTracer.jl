module LogTracer

  using ..Commander

  struct Class
    key
    nofield
  end
  function Class(title)
    Commander.inc()
    className = "LogTracer"
    key = Commander.randomizeKey()
    Commander.command(key, className, [title])
    Class(key,missing)
  end

  function Class()
      Class("")
  end

  function set(c::Class, log)
      Commander.command(c.key, "set", [log]);
  end

  function print(c::Class, message)
      Commander.command(c.key, "print", [message]);
  end

  function println(c::Class, message)
      Commander.command(c.key, "println", [message]);
  end

  function printf(c::Class, format, args)
      traceArgs = [length(args) + 1];
      traceArgs[0] = format;
      #arraycopy(args, 0, traceArgs, 1, args.length);
      Commander.command(c.key, "printf", traceArgs);
  end

end # module
