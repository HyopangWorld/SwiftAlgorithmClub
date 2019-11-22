import Foundation

/**
* 카카오 오픈챗 Swift Algorithm Club 문제 풀이
* 2019.11.22  정수 내림차순으로 배치하기
* https://programmers.co.kr/learn/courses/30/lessons/42840?language=swift
* **/

func solution(_ n:Int64) -> Int64 {
    let str = String(Array("\(n)").sorted{$0 > $1})
    return Int64(str) ?? n
}

print("\(solution(118372))")
