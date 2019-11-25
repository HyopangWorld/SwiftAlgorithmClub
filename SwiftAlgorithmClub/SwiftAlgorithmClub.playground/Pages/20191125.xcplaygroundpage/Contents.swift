import Foundation

/**
 * 2019.11.25  다리를 지나는 트럭 (순한맛)
 * https://programmers.co.kr/learn/courses/30/lessons/42583?language=swift
 * **/

func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
    var trucks = truck_weights
    var bridge = [Int]()
    var time = 0
    var curWeight = 0

    while trucks.count > 0 {
        if bridge.count >= bridge_length { curWeight -= bridge.removeFirst() }

        if weight < (curWeight + trucks.first!) { bridge.append(0) }
        else {
            curWeight += trucks.first!
            bridge.append(trucks.removeFirst())
        }
        
        time += 1
    }

    return time + bridge_length
}

//print("\(solution(10, 10, [1,2,3,4,5,1,2,3,4,5]))")
//print("")
//
//print("\(solution(10, 10, [1,2,3,4,5,6,7,8,9,10]))")
//print("")

/**
 * 2019.11.25  멀리 뛰기 (매운맛)
 * https://programmers.co.kr/learn/courses/30/lessons/12914?language=swift
 * **/

func solution1(_ n:Int) -> Int {
    var total = 1
    var two = 1
    
    while true {
        let one = n - (two * 2)
        if one < 1 {
            if one == 0 { total += 1 }
            break
        }
        
        total += factorial(one + two) / (factorial(two) * factorial(one))
        two += 1
    }
    
    return total
}

func factorial(_ num: Int) -> Int {
    if (num == 1) { return 1 }
    return num * factorial(num-1)
}

print("\(solution1(4))")
print("")
print("\(solution1(3))")
print("")
