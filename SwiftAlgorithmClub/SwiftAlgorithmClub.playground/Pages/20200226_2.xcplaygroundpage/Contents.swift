import Foundation

/**
 * 2020.02.26 Compare the Triplets  (easy)
 * https://www.hackerrank.com/challenges/compare-the-triplets/problem?isFullScreen=true
 * **/
// Complete the compareTriplets function below.
func compareTriplets(a: [Int], b: [Int]) -> [Int] {
    var point = [0,0]
    for i in 0..<a.count {
        if a[i] > b[i] { point[0] += 1 }
        else if a[i] < b[i] { point[1] += 1 }
    }
    print("\(point)")

    return point
}
//print("\(compareTriplets(a: [5,3,4], b: [1,5,8]))")


/**
 * 2020.02.26 Forming a Magic Square  (middle)
 * https://www.hackerrank.com/challenges/magic-square-forming/problem?isFullScreen=true
 * **/
// 공식이 있는 문제... 경우의 수가 8가지 밖에 없다.
// Complete the formingMagicSquare function below.
func formingMagicSquare(s: [[Int]]) -> Int {
    let magic_square = [
            [[8, 1, 6], [3, 5, 7], [4, 9, 2]],
            [[6, 1, 8], [7, 5, 3], [2, 9, 4]],
            [[4, 9, 2], [3, 5, 7], [8, 1, 6]],
            [[2, 9, 4], [7, 5, 3], [6, 1, 8]],
            [[8, 3, 4], [1, 5, 9], [6, 7, 2]],
            [[4, 3, 8], [9, 5, 1], [2, 7, 6]],
            [[6, 7, 2], [1, 5, 9], [8, 3, 4]],
            [[2, 7, 6], [9, 5, 1], [4, 3, 8]]
    ]
    
    var countList: [Int] = []
    for list in magic_square {
        var cnt = 0
        for i in 0..<list.count {
            for j in 0..<list.count {
                cnt += abs(list[i][j] - s[i][j])
            }
        }
        countList.append(cnt)
    }
    
    return countList.min() ?? 0
}

//print("\(formingMagicSquare(s: [[5,3,4],[1,5,8],[6,4,2]]))")


/**
 * 2020.02.26 Climbing the Leaderboard (middle)
 * https://www.hackerrank.com/challenges/climbing-the-leaderboard/problem?isFullScreen=true
 * **/
// Complete the climbingLeaderboard function below.
func climbingLeaderboard(scores: [Int], alice: [Int]) -> [Int] {
    let list = Set(scores).sorted { $0 > $1 }
    var lank: [Int] = []
    
    for score in alice {
        lank.append(binarySearch(data: list, start: 0, end: list.count - 1, target: score) + 1)
    }
    
    return lank
}

func binarySearch(data: [Int], start: Int, end: Int, target: Int) -> Int {
    let middle = (start+end)/2
    if start>end{ return end+1 }
    if target > data[middle] { return binarySearch(data: data, start: start, end: middle - 1, target: target) }
    else if target < data[middle] { return binarySearch(data: data, start: middle + 1, end: end, target: target) }
    else { return middle }
}

print("\(climbingLeaderboard(scores: [100,100,50,40,40,20,10], alice: [5,25,50,120]))")
print("\(climbingLeaderboard(scores: [100,90,90,80,80,75,60], alice: [50,65,77,90,102]))")
