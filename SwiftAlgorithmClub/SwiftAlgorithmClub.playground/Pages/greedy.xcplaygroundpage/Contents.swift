import Foundation
// Greedy 알고리즘

/**
* 2020.02.29 Candies  (midium)
* https://www.hackerrank.com/challenges/candies/problem
* **/
// 1. 왼쪽에 사람과 비교한다.
// - 더 크면 왼쪽사람사탕 수 +1
// - 더 작거나 같으면 1
// 2. 오른쪽에 사람과 비교한다.
// - 더 크면 +1
// - 더 작거나 같으면 1
 func candies2(n: Int, arr: [Int]) -> Int {
     var candies: [Int] = Array(repeating: 1, count: arr.count)
     
     for i in 1..<n {
         if arr[i-1] < arr[i] { candies[i] = candies[i-1]+1 }
     }
     
    for i in stride(from: n-2, through: 0, by: -1) {
         if arr[i+1] < arr[i] { candies[i] = max(candies[i+1], candies[i]+1) }
     }
     
     let total = candies.reduce(0){ $0 + $1 }
     print("\(total)")
     
     return total
 }

//print("최적의 사탕 갯수2 \(candies2(n: 10, arr: [2,4,2,6,1,7,8,9,2,1]))")

func candies3(n: Int, arr: [Int]) -> Int {
     var candies: [Int] = Array(repeating: 1, count: arr.count)

     for i in 1..<n {
         if arr[i-1] < arr[i] { candies[i] = candies[i-1]+1 }
     }

    for i in (1..<arr.count).reversed() {
         if arr[i] < arr[i-1] { candies[i-1] = max(candies[i]+1, candies[i-1]) }
     }

     let total = candies.reduce(0,+)
     print("\(total)")

     return total
}

//print("최적의 사탕 갯수3 \(candies3(n: 10, arr: [2,4,2,6,1,7,8,9,2,1]))")


/**
* 2020.03.01 Candies  (midium)
* https://www.hackerrank.com/challenges/candies/problem
* **/
// (cur + prev) * origin price
// 1. 사람 수로 가장 큰 수 먼저
let array = """
390225 426456 688267 800389 990107 439248 240638 15991 874479 568754 729927 980985 132244 488186 5037 721765 251885 28458 23710 281490 30935 897665 768945 337228 533277 959855 927447 941485 24242 684459 312855 716170 512600 608266 779912 950103 211756 665028 642996 262173 789020 932421 390745 433434 350262 463568 668809 305781 815771 550800
"""
func toArray(array: String) -> [Int] {
    return array.split(separator: " ").map{ Int($0) ?? 0 }
}

func getMinimumCost(k: Int, c: [Int]) -> Int {
    let costs = c.sorted{$0 > $1}
    var total = 0
    
    for j in 0..<c.count { total += ((j / k) + 1) * costs[j] }
    
    return total
}
//print("최적의 구매 가격 \(getMinimumCost(k: 3, c: toArray()))")


/**
* 2020.03.02 Max Min  (midium)
* https://www.hackerrank.com/challenges/angry-children/problem?isFullScreen=true&h_r=next-challenge&h_v=zen
* **/
// 1. 정렬
//
func maxMin(k: Int, arr: [Int]) -> Int {
    let list = arr.sorted()
    var result:[Int] = []
    
    for i in stride(from: 0, through: list.count - k, by: 1){
        result.append(list[i+(k-1)] - list[i])
        print("\(i) : \(list[i...(i+(k-1))]) -> \(result)")
    }
    
    let val = result.min() ?? 0
    print("\(val)")
    
    return val
}

print("\(maxMin(k: 2, arr: [5,2,1,2,1,2,1]))")
print("\(maxMin(k: 4, arr: [10,4,1,2,3,4,10,20,30,40,100,200]))")
print("\(maxMin(k: 3, arr: [7,3,10,100,300,200,1000,20,30]))")
