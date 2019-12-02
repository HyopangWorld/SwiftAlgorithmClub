import Foundation

/**
 * 2019.11.29 기능개발 (순한맛)
 * https://programmers.co.kr/learn/courses/30/lessons/42586
 * **/

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    var complete = [Int]()
    var j = -1
    var days = [Int]()
    
    zip(progresses, speeds).map { (progress, speed) in
        let day = Int(ceil(Double(100 - progress) / Double(speed)))
        
        if (days.max() ?? 0) < day {
            days.append(day)
            complete.append(1)
            j += 1
        }
        else { complete[j] += 1 }
    }
    
    return complete
}

print("\(solution([93,30,55], [1,30,5]))")


/**
 * 2019.11.29 가장 먼 노드 (매운맛)
 * https://programmers.co.kr/learn/courses/30/lessons/49189
 * **/

func solution(_ n:Int, _ edge:[[Int]]) -> Int {
    var distances = Array(repeating: 0, count: n)
    var stack = [Int]()
    
    // 1에서 n으로 가는 길 찾기
    for i in 2...n {
        var index = 1
        stack.append(1)
        while true {
            let way = edge.filter{ $0.contains(index) }
            if way.contains([index, i]) {
                
            }
            else {
                stack.append(index)
            }
        }
    }
    
    return 0
}

print("\(solution(6, [[3, 6], [4, 3], [3, 2], [1, 3], [1, 2], [2, 4], [5, 2]]))")
