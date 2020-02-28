import Foundation

/**
 * 자료구조
 * **/

// p.24 하노이 타워
 a는 시작점, b는 경유지, c는 목적지
print("")
func hanoiTower(n: Int, a: String, b: String, c: String) {
    if n == 1 { print("원판 \(n), \(a) -> \(c)") }
    else {
        hanoiTower(n: n - 1, a: a, b: c, c: b) // A -> B
        print("원판 \(n), \(a) -> \(c)")
        hanoiTower(n: n - 1, a: b, b: a, c: c) // B -> C
    }
}
hanoiTower(n: 5, a: "A", b: "B", c: "C")


// p49 연결리스트
struct Node {
    var number: Int
    var link: UnsafePointer<Node>
}

func insetNode(prev prevNode: Node, num number: Int) {
    var prev = prevNode
    let result = withUnsafePointer(to: &prev) { prevPointer -> Result<UnsafePointer<Node>, Error> in
        return .success(prevPointer)
    }

    do {
        guard let prevLink = try? result.get() else { return }
        var newNode = Node(number: number, link: prevLink)
    } catch {
        print("\(error.localizedDescription)")
    }
}


// selection sort (선택 정렬)
// (n-1) + (n-2) + ... + 1
// 복잡도 O(n^2)
print("")
func selectionSort(array: [Int]) -> [Int] {
    var a = array
    for i in 0..<a.count {
        var min = a[i]
        var index = i
        for j in i..<a.count {
            if a[j] < min {
                min = a[j]
                index = j
            }
        }
        let temp = a[i]
        a[i] = a[index]
        a[index] = temp
    }

    return a
}
print("\(selectionSort(array: [5,1,2,3,6,7,10,9,8,5]))")

// Insertion Sort (선택 정렬)
// 1 + 2 + 3 + ... + (n-2) + (n-1)
// 복잡도 O(n^2)
print("")
func insertionSort(array: [Int]) -> [Int] {
    var a = array
    for key in 1..<a.count {
        inner : for i in 0..<key {
            if a[i] > a[key] {
                let val = a[key]
                a.remove(at: key)
                a.insert(val, at: i)
                break inner
            }
        }
    }

    return a
}
print("\(insertionSort(array: [5,1,2,3,6,7,10,9,8,5]))")

// Bubble Sort (선택 정렬)
// 1 + 2 + 3 + ... + (n-2) + (n-1)
// 복잡도 O(n^2)
print("")
func bubbleSort(array: [Int]) -> [Int] {
    var a = array

    for n in 1..<a.count {
        for i in 1...(a.count - n) {
            if a[i-1] > a[i] {
                a.swapAt(i-1, i)
            }
        }
    }

    return a
}
print("\(bubbleSort(array: [5,1,2,3,6,7,10,9,8,5]))")

// shel Sort (삽입 정렬 개선)
// 1 + 2 + 3 + ... + (n-2) + (n-1)
// 복잡도 O(n^2)
print("")
func shellSort(array: [Int]) -> [Int] {
    var a = array
    var t = array.count/2

    while true {
        for i in 0..<a.count {
            var temp = i
            for j in stride(from: i+t, to: a.count, by: t) {
                if a[temp] > a[j] {
                    let val = a[j]
                    a.remove(at: j)
                    a.insert(val, at: temp)
                    temp += 1
                }
                print("\(temp) : \(j) -> \(a)")
            }
        }

        if t <= 1 { break }
        else { t /= 2}
    }


    return a
}
print("\(shellSort(array: [10,8,6,20,4,3,22,1,0,15,16]))")

func quickSort(a: [String]) -> [String] {
    var array = a
    if array.isEmpty { return [] }
    let key = array.remove(at: 0)
    // (key값 보다 작거나 같은 배열의 정렬) + key + (key값보다 큰 배열의 정렬)
    return quickSort(a: array.filter{ $0 <= key }) + [key] + quickSort(a: array.filter{ $0 > key })
}

// Complete the bigSorting function below.
func bigSorting(unsorted: [String]) -> [String] {
    let list = unsorted.sorted { $0.count == $1.count ? $0 < $1 : $0.count < $1.count }
    for i in list { print(i) }
    return list
}

print("\(bigSorting(unsorted: ["8","1","2","100","12303479849857341718340192371","3084193741082937","3084193741082938","111","200"]))")
print("\(bigSorting(unsorted: ["12303479849857341718340192371","12303479849857341718340192371","12303479849857341718340192371","12303479849857341718340192371","12303479849857341718340192371","12303479849857341718340192371","12303479849857341718340192371","12303479849857341718340192371","12303479849857341718340192371"]))")
