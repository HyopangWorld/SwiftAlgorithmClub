import Foundation

/**
* 카카오 오픈챗 Swift Algorithm Club 문제 풀이
* 2019.11.21  모의고사
* https://programmers.co.kr/learn/courses/30/lessons/42840?language=swift
* **/

struct MathHatter {
    var number: Int
    var answer: [Int]
    var score: Int
}

func solution(_ answers:[Int]) -> [Int] {
    var mathHatters = [MathHatter]()
    mathHatters.append(MathHatter(number: 1, answer: [1,2,3,4,5], score: 0))
    mathHatters.append(MathHatter(number: 2, answer: [2,1,2,3,2,4,2,5], score: 0))
    mathHatters.append(MathHatter(number: 3, answer: [3,3,1,1,2,2,4,4,5,5], score: 0))
    
    for i in 0..<mathHatters.count {
        for j in 0..<answers.count {
            let num = j - ((j / mathHatters[i].answer.count) * mathHatters[i].answer.count)
            if mathHatters[i].answer[num] == answers[j] {
                mathHatters[i].score += 1
            }
        }
    }
    
    let max = mathHatters.max { $0.score < $1.score }
    return mathHatters.filter{ $0.score >= (max?.score ?? 0) }.map { $0.number }
}

print("\(solution([1,3,2,4,2]))")
