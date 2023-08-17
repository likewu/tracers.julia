# tracers.jl

> This repository is part of the project [Algorithm Visualizer](https://github.com/algorithm-visualizer).

`tracers.jl` is a visualization library for Julia.
You can use it on [algorithm-visualizer.org](https://algorithm-visualizer.org/) or locally on your machine.

## Usage

```julia
// import visualization libraries {
using algorithm-visualizer
// }

// define tracer variables {
array2dTracer = Array2DTracer("Grid")
logTracer = LogTracer("Console")
// }

// define input variables
messages = [
  "Visualize",
  "your",
  "own",
  "code",
  "here!",
]

// highlight each line of messages recursively
function highlight(line)
  if line >= messages.length return
  const message = messages[line];
  // visualize {
  logTracer.println(message)
  array2dTracer.selectRow(line, 0, message.length - 1)
  Tracer.delay();
  array2dTracer.deselectRow(line, 0, message.length - 1)
  // }
  highlight(line + 1)
end

// visualize {
Layout.setRoot(VerticalLayout([array2dTracer, logTracer]))
array2dTracer.set(messages)
Tracer.delay()
// }
highlight(0)
```

Check out the [API reference](https://likewu.github.io/tracers.jl/) for more information.

## Contributing

Check out the [contributing guidelines](https://github.com/likewu/tracers.jl/blob/master/CONTRIBUTING.md).