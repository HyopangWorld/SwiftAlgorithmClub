import Foundation

/**
 * 2019.12.02 피보나치 수 (순한맛)
 * https://programmers.co.kr/learn/courses/30/lessons/12945
 * **/

func solution(_ n:Int) -> Int {
    var fibo = [0,1,1]
    if n < 3 { return fibo[n] }
    
    for _ in 3...n {
        fibo[0] = fibo[1]
        fibo[1] = fibo[2]
        fibo[2] = (fibo[0] + fibo[1]) % 1234567
    }
    
    return fibo[2]
}

print("\(solution(100))")

// 재귀함수
//func solution1(_ n:Int) -> Int {
//    if (n == 0) { return 0 }
//    else if (n == 1) { return 1 }
//    else { return (solution(n-1) + solution(n-2)) % 1234567 }
//}
