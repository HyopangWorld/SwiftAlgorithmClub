import Foundation

/**
* 카카오 오픈챗 Swift Algorithm Club 문제 풀이
* 2019.11.22  정수 내림차순으로 배치하기 (#순한맛)
* https://programmers.co.kr/learn/courses/30/lessons/12933?language=swift
* **/

func solution(_ n:Int64) -> Int64 {
    let str = String(Array("\(n)").sorted{$0 > $1})
    return Int64(str) ?? n
}

print("\(solution(118372))")


/**
* 2019.11.22   탑  (#스택/큐 #매운맛)
* https://programmers.co.kr/learn/courses/30/lessons/12933?language=swift
* **/

func solution1(_ heights:[Int]) -> [Int] {
    var tower = [Int]()

    for i in stride(from: (heights.count-1), to: -1, by: -1) {
        var receiver = 0
        receive: for j in stride(from: (i-1), to: 0, by: -1) {
            if heights[i] < heights[j] {
                receiver = j + 1
                break receive
            }
        }
        tower.append(receiver)
    }

    return tower.reversed()
}

// 짧게 줄이고 싶은 욕구.... 그치만 복잡도 올라감....
func solution1_2(_ heights:[Int]) -> [Int] {
    var tower = [Int]()
    
    for i in stride(from: (heights.count-1), to: -1, by: -1) {
        tower.append((heights[0..<i].lastIndex{ $0 > heights[i] } ?? -1) + 1)
    }
    
    return tower.reversed()
}

// 짧게 줄이고 싶은 더 큰 욕구.... 그치만 복잡도 더 올라감....
func solution1_3(_ heights:[Int]) -> [Int] {
    return heights.enumerated().map { i, _ in
        (heights[0..<i].lastIndex{ $0 > heights[i] } ?? -1) + 1
    }
}

print("\(solution1_3([6,9,5,7,4]))")
print("\(solution1_3([3,9,9,3,5,7,2]))")
print("\(solution1_3([1,5,3,6,7,6,5]))")
