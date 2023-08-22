# import visualization libraries {
using algorithm_visualizer
# }

const G = [ # G[i][j] indicates whether the path from the i-th node to the j-th node exists or not
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0],
];

const T = [ # mapping to G as a binary tree , [i][0] indicates left child, [i][1] indicates right child
  [-1, -1],
  [0, 2],
  [-1, -1],
  [1, 4],
  [-1, -1],
  [3, 8],
  [-1, 7],
  [-1, -1],
  [6, 10],
  [-1, -1],
  [9, -1],
];

const key = Randomize.create(Randomize.Integer(1, length(G))) # item to be searched
# define tracer variables {
const tracer = GraphTracer.Class(" Binary Search Tree ")
const logger = LogTracer.Class(" Log ")
Layout.setRoot(VerticalLayout.Class([tracer, logger]));
GraphTracer.set(tracer, G);
GraphTracer.layoutTree(tracer, 5);
GraphTracer.log(tracer, logger);
Tracer.delay();
# }

function bst(item, node, parent) # node = current node , parent = previous node
  # visualize {
  GraphTracer.visit(tracer, node, parent);
  Tracer.delay();
  # }
  if item === node # key found
    # logger {
    LogTracer.println(logger, " Match Found ");
    # }
  elseif item < node # key less than value of current node
    if T[node][1] === -1
      # logger {
      LogTracer.println(logger, " Not Found ");
      # }
    else
      bst(item, T[node][1], node);
    end
  else # key greater than value of current node
    if T[node][2] === -1
      # logger {
      LogTracer.println(logger, " Not Found ");
      # }
    else
      bst(item, T[node][2], node);
    end
  end
end

# logger {
LogTracer.println(logger, "Finding number $key");
# }
bst(key, 6, missing); # node with key 5 is the root
