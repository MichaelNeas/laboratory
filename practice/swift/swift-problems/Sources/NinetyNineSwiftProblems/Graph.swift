import Foundation

class Graph<T, U> {
    var direction: GraphDirection { return .indirected }
    var nodes: List<T>?
    var edges: List<(T, T, U)>?
}

class Digraph<T, U> : Graph<T, U> {
    override var direction: GraphDirection { return .directed }
}

enum GraphDirection {
    case indirected
    case directed
}

extension Graph {
    convenience init(nodes: List<T>, edges: List<(T, T)>?) {
        self.init()
        self.nodes = nodes
        //        self.edges = edges.map { edge in (edge.0, edge.1, 0) }
    }
}

extension Graph {
    convenience init(adjacentList: List<(T, List<T>?)>) {
        self.init(nodes: List(adjacentList.value.0), edges: nil) // FIXME
    }
}

extension Graph {
    convenience init(nodes: List<T>, labeledEdges: List<(T, T, U)>?) {
        self.init(nodes: nodes, edges: nil)
    }
}

extension Graph {
    convenience init(adjacentLabeledList: List<(T, List<(T, U)>?)>) {
        self.init(nodes: List(adjacentLabeledList.value.0), edges: nil) // FIXME
    }
}

extension Graph {
    func isIsomorphicTo<V, W>(graph: Graph<V, W>) -> Bool {
        return false
    }
}
