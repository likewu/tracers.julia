# import visualization libraries {
using algorithm_visualizer
# }

const T = Dict([]);

const elements = [5, 8, 10, 3, 1, 6, 9, 7, 2, 0, 4]; # item to be inserted

# define tracer variables {
const graphTracer = GraphTracer.Class(" BST - Elements marked red indicates the current status of tree ");
const elemTracer = Array1DTracer.Class(" Elements ");
const logger = LogTracer.Class(" Log ");
Layout.setRoot(VerticalLayout.Class([graphTracer, elemTracer, logger]));
Array1DTracer.set(elemTracer, elements);
GraphTracer.log(graphTracer, logger);
Tracer.delay();
# }

function bstInsert(root, element, parent) # root = current node , parent = previous node
  # visualize {
  GraphTracer.visit(graphTracer, root, parent);
  Tracer.delay();
  # }
  treeNode = T[root];
  propName = "";
  if element < root
    propName = "left";
  elseif element > root
    propName = "right";
  end
  if (propName !== "")
    if !haskey(treeNode, propName) # insert as left child of root
      treeNode[propName] = element;
      T[element] = Dict([])
      # visualize {
      GraphTracer.addNode(graphTracer, element);
      GraphTracer.addEdge(graphTracer, root, element);
      GraphTracer.select(graphTracer, element, root);
      Tracer.delay();
      GraphTracer.deselect(graphTracer, element, root);
      LogTracer.println(logger, "$element Inserted");
      # }
    else
      bstInsert(treeNode[propName], element, root);
    end
  end
  # visualize {
  GraphTracer.leave(graphTracer, root, parent);
  Tracer.delay();
  # }
end

const Root = elements[1]; # take first element as root
T[Root] = Dict([])
# visualize {
GraphTracer.addNode(graphTracer, Root);
GraphTracer.layoutTree(graphTracer, Root, true);
LogTracer.println(logger, "$Root Inserted as root of tree ");
# }

for i = 2:length(elements)
  # visualize {
  Array1DTracer.select(elemTracer, i);
  Tracer.delay();
  # }
  bstInsert(Root, elements[i], missing); # insert ith element
  # visualize {
  Array1DTracer.deselect(elemTracer, i);
  Tracer.delay();
  # }
end
