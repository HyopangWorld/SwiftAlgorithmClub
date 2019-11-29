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
