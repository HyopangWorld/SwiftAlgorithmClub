import Foundation

/**
* 2019.11.26 하노이 타워 (순한맛)
* https://programmers.co.kr/learn/courses/30/lessons/12948
* **/

func solution(_ phone_number:String) -> String {
    return String(Array(repeating: "*", count: phone_number.count-4)) + phone_number.suffix(4)
}

print("\(solution("01033334444"))")
print("")

print("\(solution("027778888"))")
print("")


/**
* 2019.11.26 하노이 타워 (매운맛)
* https://programmers.co.kr/learn/courses/30/lessons/12946
* **/

func solution1(_ n:Int) -> [[Int]] {
    return []
}

//print("\(solution1(10, 10, [1,2,3,4,5,1,2,3,4,5]))")
//print("")
//
//print("\(solution1(10, 10, [1,2,3,4,5,6,7,8,9,10]))")
//print("")

