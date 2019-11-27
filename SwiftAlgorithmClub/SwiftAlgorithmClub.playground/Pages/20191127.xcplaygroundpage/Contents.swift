import Foundation

/**
 * 2019.11.27 직사각형 별찍기 (순한맛)
 * https://programmers.co.kr/learn/courses/30/lessons/12969
 * **/

let n = readLine()!.components(separatedBy: [" "]).map { Int($0)! }
let a = String(repeating: "*", count: n[0])
print(String(repeating: a+"\n", count: n[1]))


/**
 * 2019.11.27 소수 찾기 (매운맛)
 * https://programmers.co.kr/learn/courses/30/lessons/42839
 * **/

struct PrimeCheck {
    var arr: [Character]
    
    func isPrimeNumber(_ nums: [Int]) -> Int? {
        for i in 0..<nums.count {
            if nums[(i+1)..<nums.endIndex].contains(nums[i]) {
                return nil
            }
        }
        
        let number = Int(nums.reduce(""){$0+"\(arr[$1])"})!
        if number <= 1 { return nil }
        
        for i in 2..<number {
            if (number % i) == 0 { return nil }
        }
        
        return number
    }
}

func solution(_ numbers:String) -> Int {
    var primeNumbers = [Int]()
    var checker = PrimeCheck(arr: Array(numbers))
    var nums = [Int]()
    
    func combination(_ index: Int, _ r: Int, _ i: Int) {
        if r == 0  {
            if let num = checker.isPrimeNumber(nums) {
                primeNumbers.append(num)
            }
        }
        else if i == numbers.count { return }
        else {
            nums[index] = i
            combination(index + 1, r - 1, 0)
            combination(index, r, i + 1)
        }
    }
    
    for r in 1...numbers.count {
      nums = Array(repeating: 0, count: r)
      combination(0, r, 0)
    }

    return Set(primeNumbers).count
}

//print("\(solution("12345"))")
