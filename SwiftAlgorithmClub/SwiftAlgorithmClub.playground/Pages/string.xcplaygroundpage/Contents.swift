import Fondation

/**
* 2020.03.02 Sherlock and the Vaild String  (midium)
* https://www.hackerrank.com/challenges/sherlock-and-valid-string/problem?isFullScreen=true
* **/
// 숫자가 다른 한개가 있어야하고
// 그 한개는 다른 숫자들보다 1개 많아야한다.
func isValid(s: String) -> String {
    let arr = Array(s.lowercased())
    var result: [Int] = []
    
    for i in 97..<122 {
        let array = arr.filter({ "\($0)" == "\(UnicodeScalar(i) ?? "a")" })
        if array.count != 0 { result.append(array.count) }
    }
    
    var count: Int = 0
    for j in 0..<(result.count - 1) {
        if abs(result[0] - result[j+1]) > 0 { count += 1 }
        print("\(result[0] ) - \(result[j+1]) = \(abs(result[0] - result[j+1]))")
    }
    return count > 1 ? "NO" : "YES"
}

print("\(isValid(s: "aabbcd"))")
