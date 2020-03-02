import Foundation

// 그리니디 알고리즘
func miniumCoin(money: Int){
    let coin = [100, 50, 10, 1]
    var m = money
    
    for i in coin {
        print("\(i)짜리 \(m / i)개")
        m = m % i
    }
}
miniumCoin(money: 365)

func cacheHow(_ cacheSize: Int, _ cities: [String]) -> Int {
    var time = 0
    var cache: [String] = []
    
    for city in cities {
        if cache.contains(city) {
            time += 1
            cache.removeAll{ $0 == city }
        }
        else {
            if cache.count >= cacheSize { cache.removeFirst() }
            time += 5
        }
        cache.append(city)
    }
    
    return time
}
print("\(cacheHow(3, ["Jeju", "Pangyo", "Seoul", "Jeju", "Pangyo", "Seoul", "Jeju", "Pangyo", "Seoul"]))")
print("\(cacheHow(2, ["Jeju", "Pangyo", "Seoul", "NewYork", "LA", "SanFrancisco", "Seoul", "Rome", "Paris", "Jeju", "NewYork", "Rome"]))")


// 깊이 우선 탐색 DFS
// stack 구조를 사용하여 모든 정점을 탐색하는 방법
// 1. 출발 정점을 정한다.
// 2. 인접한 정점을 검사하여 낮은 인덱스를 전진할 정점으로 정한다.
// 3. 방문표시 및 현재 정점을 Stack에 저장하고 전진하다.
// 4. 전진할 정점이 없으면 Stack에서 Pop 하여 (2)로 간다.
// 5. 만약 stack이 비었다면 탐색 완료
func dfsSearch(graph: [String], load: [[Int]]){
    for node in graph {
        print("\(node) 길찾기")
        searchingDFS(graph: graph, load: load, start: node)
        print("")
    }
}

func searchingDFS(graph: [String], load: [[Int]], start: String) -> [Int] {
    var searchOk: [Int] = Array(repeating: 0, count: graph.count)
    var i = 0
    var j = 0
    var stack: [Int] = []
    
    while i < graph.count {
        if start == graph[i] { break }
        i += 1
    }
    
    searchOk[i] = 1
    repeat {
        j = 0
        while j < graph.count {
            if load[i][j] == 1 && searchOk[j] == 0 {
                searchOk[j] = 1 // 현재 정점
                print("\(graph[j])")
                stack.append(i) // 지나온 정점을 stack에 담는다.
                i = j
            }
            j += 1
        }
        if (j >= graph.count) {
            i = stack.last != nil ? stack.removeLast() : -1
        }
    } while (i >= 0)
    
    return stack
}

//print("\(dfsSearch(graph: ["A", "B", "C", "D", "E", "F", "G"], load: [[0,1,1,1,0,0,0], [1,0,0,0,1,0,0], [1,0,0,0,0,0,0], [1,0,0,0,0,0,0], [0,1,0,0,0,1,1], [0,0,0,0,1,0,1], [0,0,0,0,1,1,0]]))")


// 너비 우선 탐색 BFS
// Queue 구조를 사용하여 모든 정점을 탐색하는 방법
// 1. 출발 정점을 정한다.
// 2. 인접한 정점을 모두 차례로 방문하고 그 순서대로 Queue에 저장
// 3. Queue에서 정점을 꺼내 (2)를 반복한다.
// 4. 만약 Queue이 비었다면 탐색 완료
func bfsSearch(graph: [String], load: [[Int]]){
    for node in graph {
        print("\(node) 길찾기")
        searchingBFS(graph: graph, load: load, start: node)
        print("")
    }
}

func searchingBFS(graph: [String], load: [[Int]], start: String) -> [Int] {
    var searchOk: [Int] = Array(repeating: 0, count: graph.count)
    var i = 0
    var queue: [Int] = []
    
    while i < graph.count {
        if start == graph[i] { break }
        i += 1
    }
    
    searchOk[i] = 1
    queue.append(i)
    repeat {
        for j in 0..<graph.count {
            if load[i][j] == 1 && searchOk[j] == 0 {
                searchOk[j] = 1 // 현재 정점
                print("\(graph[j])")
                queue.append(j) // 지나온 정점을 stack에 담는다.
            }
        }
        i = queue.first != nil ? queue.removeFirst() : -1
    } while (i >= 0)
    
    return queue
}

print("\(bfsSearch(graph: ["1", "2", "3", "4", "5", "6", "7", "8"], load: [[0,1,1,0,0,0,0,0], [1,0,0,1,1,0,0,0], [1,0,0,0,0,1,1,0], [0,1,0,0,0,0,0,1], [0,1,0,0,0,0,0,1], [0,0,1,0,0,0,0,1], [0,0,1,0,0,0,0,1], [0,0,0,1,1,1,1,0]]))")


// Dijkstra Search (다익스트라[최단경로] 탐색)
// 모든 정점에서 도착점까지 최단 경로 및 거리를 구해나가는 방법
// 1. 출발점을 기준으로 각 정점에 대한 시간표를 만든다.
// 2. 계속해서 이표를 수정한다.
// 3. 도달하지 못한 것은 무한대로 표시
// 4. 정점 집합이 공집합이 될때까지 반복

let graph = ["0.집","1.미용실","2.슈퍼마켓","3.영어학원","4.레스토랑","5.은행","6.학교","7.랄라"]

func minVertex(D: [Int], chk: [Int]) -> Int {
    var minIndex: Int
    var minValue = -1
    var i = 0
    
    while i < graph.count {
        if chk[i] == 0 { break }
        i += 1
    }
    minValue = D[i]
    minIndex = i
    
    while i < graph.count {
        if chk[i] == 0 && minValue > D[i] && D[i] > 0 {
            minValue = D[i]
            minIndex = i
        }
        i += 1
    }

    print("\(minIndex)")
    return minIndex
}

func dijkstraSearch(end: String){
    let G = [[0,12,15,18,Int.max,Int.max,Int.max,Int.max],
        [12,0,Int.max,Int.max,33,26,Int.max,Int.max],
        [15,Int.max,0,7,Int.max,10,Int.max, Int.max],
        [18,Int.max,7,0,Int.max,Int.max,11,Int.max],
        [Int.max,33,Int.max,Int.max,0,17,Int.max,15],
        [Int.max,26,10,Int.max,17,0,Int.max,28],
        [Int.max,Int.max,Int.max,11,Int.max,Int.max,0,20],
        [Int.max,Int.max,Int.max,Int.max,15,28,20,0]]
    var D = Array(repeating: Int.max, count: graph.count)
    var P = Array(repeating: 0, count: graph.count)
    
    guard var i = graph.firstIndex(of: end) else { return }
    D[i] = 0
    var chk = Array(repeating: 0, count: graph.count)
    
    for j in 0..<graph.count {
        if G[i][j] > 0 && G[i][j] < Int.max {
            D[j] = G[i][j]
            P[j] = i
        }
    }
    chk[i] = 1
    var cnt = 1
    
    while cnt < graph.count {
        i = minVertex(D: D, chk: chk)
        for j in 0..<graph.count {
            if G[i][j] > 0 && G[i][j] < Int.max {
                if D[j] > (D[i] + G[i][j]) {  // 경로가 짧다면
                    D[j] = D[i] + G[i][j]  //짧은 거리로 업데이트
                    P[j] = i
                }
            }
        }
        chk[i] = 1
        cnt += 1
    }
    
    print("도착 정점 \(graph[i])까지 최단 경로 및 거리\n")
    var vertexNum: Int
    for i in 0..<graph.count {
        if graph[i] == end { continue }
        print("\(graph[i])에서 출발")
        vertexNum = i
        while graph[vertexNum] != end {
            vertexNum = P[vertexNum]
            print("-> \(graph[vertexNum])")
        }
        print(", \(D[i])\n")
    }
}

dijkstraSearch(end: "1.미용실")

// BinarySearch
// : 크기 순으로 정렬되어 있는 데이터에서 검색할때
// items[start]와 items[end] 사이에서 target을 검색함
func binarySearch(items: [String], start: Int, end: Int, target: String) -> Int {
    if start > end { return -1 }
    let middle = (start + end) / 2
    if target == items[middle] { return middle }
    else if target > items[middle] { return binarySearch(items: items, start: middle + 1, end: end, target: target)}
    else { return binarySearch(items: items, start: start, end: middle - 1, target: target)}
}
print("이진검색법 \(binarySearch(items: ["a","b","c","d","e","f","g","h","i","j"], start: 0, end: 9, target: "h"))")

/**
* 2020.03.02 Sherlock and the Vaild String  (midium)
* https://www.hackerrank.com/challenges/sherlock-and-valid-string/problem?isFullScreen=true
* **/
// 1. 각 주택마다 1의 송신기 이상 범위 내에 있도록 설치
// 2. 송신기는 양옆으로 k 거리 만큼 송신 가능 == k * 2
// x는 주택 거리 배열, k는 송신 거리
func hackerlandRadioTransmitters(x: [Int], k: Int) -> Int {
    let house = x.sorted()
    var count = 1
    var i = 0
    
    while i < house.count {
        count += 1
        var loc = x[i] + k
        while i < x.count && house[i] <= loc { i += 1 }
        i -= 1
        loc = house[i] + k
        while i < x.count && house[i] <= loc { i += 1 }
    }
    
    print("count : \(count)")
    return count
}
print("")
print("\(hackerlandRadioTransmitters(x: [1,2,3,4,5], k: 1))")
print("")
print("\(hackerlandRadioTransmitters(x: [1,2,3,4,5,1999,2000,2001], k: 2))")
print("")
