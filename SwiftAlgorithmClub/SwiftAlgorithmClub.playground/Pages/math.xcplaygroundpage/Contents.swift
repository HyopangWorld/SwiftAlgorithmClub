import Foundation

/**
 * 2020.12.26 제 2강 Recursion의 개념과 기본 예제들
 * https://www.youtube.com/watch?v=ln7AfppN7mY&list=PL52K_8WQO5oUuH06MLOrah4h05TZ4n38l
 * **/

// 최대값 찾기
print("")
func findMax(data: [Int], point: Int, value: Int) -> Int {
    if point > (data.count - 1) { return value }
    let max = value > data[point] ? value : data[point]
    return findMax(data: data, point: point + 1, value: max)
}
print("최대값 찾기 \(findMax(data: [2,45,6,1,2,0,100,4,5], point: 0, value: 0))")

// sequntial search (순차 탐색)
// 정렬되어 있지 않고, 있는지 없는지 모르는 값을 탐색할때 순서대로 탐색하는 방법
print("")
func sequntial(data: [Int], point: Int, target: Int) -> Int {
    if point > (data.count - 1) { return -1 }
    if data[point] == target { return point }
    return sequntial(data: data, point: point + 1, target: target)
}
print("순차 탐색 \(sequntial(data: [1,2,3,4,5,6,7,8,9,10], point: 0, target: 5))")


/**
 * 2020.12.26 제 1강 Recursion의 개념과 기본 예제들
 * https://www.youtube.com/watch?v=ln7AfppN7mY&list=PL52K_8WQO5oUuH06MLOrah4h05TZ4n38l
 * **/
// 2진수 변환
print("")
func printInBinary(_ n: Int) {
    if n < 2 {
        print("\(n)")
        return
    }
    printInBinary(n/2)
    print("\(n % 2)")
}
printInBinary(10)

// 문자열 거꾸로 출력
print("")
func printreverse(_ str: String) {
    if str.count == 0 { return }
    print("\(str.last!)")
    let endIndex = str.index(str.endIndex, offsetBy: -1)
    printreverse("\(str[..<endIndex])")
}
printreverse("air")

print("")
func printreverse2(_ str: String) {
    _ = str.reversed().map { print("\($0)") }
}
printreverse2("air")

// 최대공약수 (Euclid Method)
// m>=n 인 두 양의 정수 m, n이 있다고 가정하면
// - m이 n의 배수이면, gcd(m,n) = n이고,
// - 그렇지 않으면 gcd(m,n) = gcd(n, m%n) == n과 m을 n으로 나눈 나머지 사이의 값.
print("")
func euclid(_ m: Int, _ n: Int) -> Int {
    var tmp = 0
    var _m = m
    var _n = n
    
    if _m < _n {
        tmp = _m
        _m = _n
        _n = tmp
    }
    if _m % _n == 0 { return _n }
    return euclid(_n, _m % _n)
}
print("euclid 10, 5 == \(euclid(10, 5))")

print("")
func euclid2(_ m: Int, _ n: Int) -> Int {
    if n == 0 { return m }
    return euclid2(n, m % n)
}
print("euclid2 30, 40 == \(euclid2(30, 40))")

/*
 fibonacci 정의
 - f(0) = 0, f(1) = 1
 - f(n) = f(n-1) + f(n-2)
 */
print("")
func fibonacci(_ n: Int) -> Int {
    if n < 2 { return n }
    return fibonacci(n-1) + fibonacci(n-2)
}
print("fibonacci f(5) == \(fibonacci(5))")

/*
 x의 n승(x^n) 정의
 - x^0 = 1
 - x^n = x * x^(n-1)    if n>0
 */
print("")
func power(_ x: Int, _ n: Int) -> Int {
    if n == 0 { return 1 }
    return x * power(x, n-1)
}
print("power \(power(10, 3))")

/*
 factorial 정의
 - 0! = 1
 - n! = n * (n-1)!
 */
print("")
func factorial(_ n: Int) -> Int {
    if n == 0 { return 1 }
    return n * factorial(n-1)
}
print("factorial 4! == \(factorial(4))")

/*
 행렬의 합
 - 두 행렬의 크기는 같아야 함
 */
print("")
func matrixAddtion(a1: [[Int]], a2:[[Int]]) -> [[Int]]{
    if a1.count != a2.count { return [] }
    var result: [[Int]] = a1
    
    for i in 0..<a1.count {
        for j in 0..<a1[i].count {
            result[i][j] = a1[i][j] + a2[i][j]
        }
    }
    
    return result
}
print("matrixAddtion \(matrixAddtion(a1: [[5,3], [-2,4], [2,3]], a2: [[3,0], [1,6], [2,2]]))")

/*
 행렬의 차
 - 두 행렬의 크기는 같아야 함
 */
print("")
func matrixMinus(a1: [[Int]], a2:[[Int]]) -> [[Int]]{
    if a1.count != a2.count { return [] }
    var result: [[Int]] = a1
    
    for i in 0..<a1.count {
        for j in 0..<a1[i].count {
            result[i][j] = a1[i][j] - a2[i][j]
        }
    }
    
    return result
}
print("matrixMinus \(matrixMinus(a1: [[5,3], [-2,4], [2,3]], a2: [[3,0], [1,6], [2,2]]))")

/*
 행렬의 곱
 - 형렬 A의 크기가 (m,n)이고, 행렬 B의 크기가 (n,o)일 때, A * B = C의 크기는 (m,o)
 */
print("")
func matrixMultification(a1: [[Int]], a2:[[Int]]) -> [[Int]]{
    var result: [[Int]] = Array(repeating: Array(repeating: 0, count: a2[0].count), count: a1.count)
    
    for i in 0..<a1.count {
        for j in 0..<a1[i].count {
            for k in 0..<a2[j].count {
                result[i][k] = a1[i][j] + a2[j][k]
            }
        }
    }
    
    return result
}
print("matrixMultification \(matrixMultification(a1: [[5,3], [-2,4], [2,3]], a2: [[3,3,-1,2], [5,7,1,0]]))")


/*
 중복 순열 정의
 - n개의 데이터 중 r개를 중복을 허용하여 배열하는 경우 (ex: 주사위 던지기)
 - n^r (ex: 4개중 3개 중복순열, 4^3 = 64)
 ex) 1,2,3,4,5 중에서 중복을 허락하여 세자리 숫자를 만드는 경우
 */
print("")

var cnt = 0
func rePermutations(array: [Int], n: Int) {
    rePermutation(array: [1,2,3,4,5], reArray: Array(repeating: 0, count: n), n: n, r: 0)
    print("중복순열 갯수 : \(cnt)")
}

func rePermutation(array: [Int], reArray: [Int], n: Int, r: Int) {
    var a = array
    var result = reArray
    
    if r >= n {
        cnt += 1
        print("\(result)")
    }
    else {
        for i in 0..<a.count {
            a.swapAt(0, i)
            result[r] = a[0]
            rePermutation(array: a, reArray: result, n: n, r: r+1)
            a.swapAt(0, i)
        }
    }
}

rePermutations(array: [1,2,3,4,5], n: 3)


/*
 순열 정의
 - n개의 데이터 중 r개를 중복을 없이 배열하는 경우
 - n! / (n-r)!
 ex) 제비뽑기
 */
var cnt2 = 0
func permutations(array: [Int], n: Int) {
    permutation(array: [1,2,3,4,5], reArray: Array(repeating: 0, count: n), n: n, r: 0)
    print("순열 갯수 : \(cnt2)")
}

print("")
func permutation(array: [Int], reArray: [Int], n: Int, r: Int) {
    var a = array
    var result = reArray
    
    if r >= n {
        cnt2 += 1
        print("\(result)")
    }
    else {
        for i in r..<a.count {
            a.swapAt(r, i)
            result[r] = a[r]
            permutation(array: a, reArray: result, n: n, r: r+1)
            a.swapAt(r, i)
        }
    }
}

permutations(array: [1,2,3,4,5], n: 3)

/*
 조합 정의
 - n개의 데이터 중 r개를 중복 없이, 순서 상관없이 배열
 - n! / (n-r)! * r!
 ex) A,B,C,D,E 5권 중 순서대로 A,B,C를 고를 확룰은 1/60
 */
var cnt3 = 0
print("")
func combination(array: [Int], reArray: [Int], n: Int, r: Int, ii: Int) {
    var result = reArray
    
    if r >= n {
        cnt3 += 1
        print("\(result)")
    }
    else {
        for i in (ii+1)..<array.count {
            result[r] = array[i]
            combination(array: array, reArray: result, n: n, r: r+1, ii: i)
        }
    }
}

combination(array: [1,2,3,4,5], reArray: Array(repeating: 0, count: 3), n: 3, r: 0, ii: -1)
print("조합 갯수 : \(cnt3)")

/*
 중복 조합 정의
 - n개의 데이터 중 r개를 중복을 허용하고, 순서 상관없이 배열
 - {r+(n-1)!} / (n-r)! * r!
 ex) 5개 중 3개의 중복 조합은 {3+(5-1)!} / (5-1)! * 3! = 7!/4!*3! = 35가지
 */
var cnt4 = 0
print("")
func reCombination(array: [Int], reArray: [Int], n: Int, r: Int, ii: Int) {
    var result = reArray
    
    if r >= n {
        cnt4 += 1
        print("\(result)")
    }
    else {
        for i in ii..<array.count {
            result[r] = array[i]
            reCombination(array: array, reArray: result, n: n, r: r+1, ii: i)
        }
    }
}

reCombination(array: [1,2,3,4,5], reArray: Array(repeating: 0, count: 3), n: 3, r: 0, ii: 0)
print("중복 조합 갯수 : \(cnt4)")
