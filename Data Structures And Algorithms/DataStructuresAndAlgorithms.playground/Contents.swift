import Foundation

enum EdgeType {

    case directed
    case undirected
}

protocol Graph {

    associatedtype Element

    func createVertex(data: Element) -> Vertex<Element>
    func addDirectedEdge(from source: Vertex<Element>,
                         to destination: Vertex<Element>,
                         weight: Double?)
    func addUndirectedEdge(between source: Vertex<Element>,
                           and destination: Vertex<Element>,
                           weight: Double?)
    func addEdge(_ edgeType: EdgeType,
                 from source: Vertex<Element>,
                 to destination: Vertex<Element>,
                 weight: Double?)
    func edges(of vertex: Vertex<Element>) -> [Edge<Element>]
    func weight(from source: Vertex<Element>,
                to destination: Vertex<Element>) -> Double?
}


struct Vertex<T> {

    let index: Int
    let data: T
}

extension Vertex: Hashable where T: Hashable { }
extension Vertex: Equatable where T: Equatable { }
extension Vertex: CustomStringConvertible {

    var description: String {
        return "\(index): \(data)"
    }
}

struct Edge<T> {

    let from: Vertex<T>
    let to: Vertex<T>
    let weight: Double?
}



extension Graph {

    func addUndirectedEdge(between source: Vertex<Element>, and destination: Vertex<Element>, weight: Double?) {
        addDirectedEdge(from: source, to: destination, weight: weight)
        addDirectedEdge(from: destination, to: source, weight: weight)

    }

    func addEdge(_ edgeType: EdgeType, from source: Vertex<Element>, to destination: Vertex<Element>, weight: Double?) {
        switch edgeType {
        case .directed: addDirectedEdge(from: source, to: destination, weight: weight)
        case .undirected: addUndirectedEdge(between: source, and: destination, weight: weight)
        }
    }
}

// Graph implementation with Dictionary
/*
    Storage: O(V+E)
    Add vertex: O(1)
    Add edge: O(1)
    Find edges and weights: O(V)
 */

class AdjacencyList<T: Hashable> : Graph {

    typealias Element = T


    private var dict: [Vertex<T>: [Edge<T>]] = [:]

    func createVertex(data: Element) -> Vertex<Element> {
        let vertex = Vertex(index: dict.count, data: data)
        dict[vertex] = []
        return vertex
    }

    func addDirectedEdge(from source: Vertex<T>, to destination: Vertex<T>, weight: Double?) {
        let edge = Edge(from: source, to: destination, weight: weight)
        dict[source]?.append(edge)
    }

    func edges(of vertex: Vertex<T>) -> [Edge<T>] {
        return dict[vertex] ?? []
    }

    func weight(from source: Vertex<T>, to destination: Vertex<T>) -> Double? {
        edges(of: source)
            .first { $0.to == destination }?
        .weight
    }
}

extension AdjacencyList: CustomStringConvertible {

    var description: String {
        var result = ""
        for (vertex, edges) in dict {
            result += "\(vertex) has \(edges.count) edges\n"
            for edge in edges.sorted { $0.weight ?? 0 > $1.weight ?? 0 } {
                result += "\t\(edge.weight ?? 0 ) to \(edge.to.data)\n"
            }
        }
        return result
    }
}

// Graph implementation with Matrix
/*
    Storage: O(V^2)
    Add vertex: O(^2)
    Add edge: O(1)
    Find edges and weights: O(V) - O(1)
 */

class AdjacencyMatrix<T> : Graph {

    typealias Element = T

    private var vertices: [Vertex<T>] = []
    private var matrix: [[Double?]] = []

    func createVertex(data: Element) -> Vertex<Element> {
        let vertex = Vertex(index: vertices.count, data: data)
        vertices.append(vertex)
        for i in 0..<matrix.count {
            matrix[i].append(nil)
        }
        let row: [Double?] = Array(repeating: nil, count: vertices.count)
        matrix.append(row)
        return vertex
    }

    func addDirectedEdge(from source: Vertex<Element>, to destination: Vertex<Element>, weight: Double?) {
        matrix[source.index][destination.index] = weight
    }

    func edges(of source: Vertex<T>) -> [Edge<T>] {
        var edges: [Edge<T>] = []
        for column in 0..<vertices.count {
            if let weight = matrix[source.index][column] {
                let edge = Edge(from: source, to: vertices[column], weight: weight)
                edges.append(edge)
            }
        }
        return edges
    }

    func weight(from source: Vertex<T>, to destination: Vertex<T>) -> Double? {
        matrix[source.index][destination.index]
    }
}

extension AdjacencyMatrix: CustomStringConvertible {

    var description: String {
        var string = ""
        for row in 0..<matrix.count {
            let edgeCount = matrix[row].compactMap { $0 }.count
            string += "\(vertices[row]) has \(edgeCount) edges:\n"
            for column in 0..<matrix.count {
                if let weight = matrix[row][column] {
                    string += "\t\(weight) to \(vertices[column].data)\n"
                }
            }
        }
        return string
    }
}

// Graphs in Action

let graph = AdjacencyMatrix<String>()

let singapore = graph.createVertex(data: "Singapore")
let tokyo = graph.createVertex(data: "Tokyo")
let hongKong = graph.createVertex(data: "Hong Kong")
let detroit = graph.createVertex(data: "Detroit")
let sanFrancisco = graph.createVertex(data: "San Francisco")
let washingtonDC = graph.createVertex(data: "Washington DC")
let austinTexas = graph.createVertex(data: "Austin Texas")
let seattle = graph.createVertex(data: "Seattle")

graph.addEdge(.undirected, from: singapore, to: hongKong, weight: 300)
graph.addEdge(.undirected, from: singapore, to: tokyo, weight: 500)
graph.addEdge(.undirected, from: hongKong, to: tokyo, weight: 250)
graph.addEdge(.undirected, from: tokyo, to: detroit, weight: 450)
graph.addEdge(.undirected, from: tokyo, to: washingtonDC, weight: 300)
graph.addEdge(.undirected, from: hongKong, to: sanFrancisco, weight: 600)
graph.addEdge(.undirected, from: detroit, to: austinTexas, weight: 50)
graph.addEdge(.undirected, from: austinTexas, to: washingtonDC, weight: 292)
graph.addEdge(.undirected, from: sanFrancisco, to: washingtonDC, weight: 337)
graph.addEdge(.undirected, from: washingtonDC, to: seattle, weight: 277)
graph.addEdge(.undirected, from: sanFrancisco, to: seattle, weight: 218)
graph.addEdge(.undirected, from: austinTexas, to: sanFrancisco, weight: 297)

print(graph)
