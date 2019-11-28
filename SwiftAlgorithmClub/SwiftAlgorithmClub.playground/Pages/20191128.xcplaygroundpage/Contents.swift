import Foundation

/**
 * 2019.11.28 설탕배달 (순한맛)
 * https://www.acmicpc.net/problem/2839
 * **/

let N = Int(readLine() ?? "0")!

for five in stride(from: Int(N / 5), to: -1, by: -1) {
    if (N - (five * 5)) % 3 == 0 {
        print("\(five + ((N - (five * 5)) / 3))")
        break
    }
    if five <= 0 { print("-1") }
}


/**
* 2019.11.28 올바른 괄호의 갯수 (매운맛)
* https://programmers.co.kr/learn/courses/30/lessons/12929
* **/

func solution(_ n:Int) -> Int {
    var arr = ["(", ")"]
    var str = Array(repeating: "", count: n * 2)
    var count = 0
    
    func combination(_ index: Int, _ r: Int, _ i: Int) {
        if r == 0  {
            if isParentheses(str) {
                count += 1
            }
        }
        else if i == arr.count { return }
        else {
            print("index: \(index) r :\(r) i : \(i) \(str.reduce(""){$0+$1})")
            str[index] = "\(arr[i])"
            combination(index + 1, r - 1, 0)
            combination(index, r, i + 1)
        }
    }
    
    combination(0, n * 2, 0)
    
    return count
}

func isParentheses(_ str: [String]) -> Bool {
    let cnt1 = str.filter{ $0 == ")" }.count
    let cnt2 = str.filter{ $0 == "(" }.count

    if cnt1 != cnt2 { return false }
    if str.first != "(" || str.last != ")" { return false }
    
    var splitArr = str
    while splitArr.count > 0 {
        var flag = true
        split : for i in 0..<splitArr.count - 1 {
            if splitArr[i] == "(" && splitArr[i+1] == ")" {
                splitArr.remove(at: i)
                splitArr.remove(at: i)
                flag = false
                break split
            }
        }
        if flag { return false }
    }
    
    return true
}

print("\(solution(4))")
