import Foundation

/**
* 2020.12.26 제 2강 Recursion의 개념과 기본 예제들
* https://www.youtube.com/watch?v=ln7AfppN7mY&list=PL52K_8WQO5oUuH06MLOrah4h05TZ4n38l
* **/
// BinarySearch
// : 크기 순으로 정렬되어 있는 데이터에서 검색할때
// items[start]와 items[end] 사이에서 target을 검색함
func binarySearch(items: [String], start: Int, end: Int, target: String) -> Int {
    if start > end { return -1 }
    let middle = (start + end) / 2
    if target == items[middle] { return middle }
    else if target > items[middle] { return binarySearch(items: items, start: middle + 1, end: end, target: target)}
    else { return binarySearch(items: items, start: start, end: middle - 1, target: target)}
}
print("이진검색법 \(binarySearch(items: ["a","b","c","d","e","f","g","h","i","j"], start: 0, end: 9, target: "h"))")

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
