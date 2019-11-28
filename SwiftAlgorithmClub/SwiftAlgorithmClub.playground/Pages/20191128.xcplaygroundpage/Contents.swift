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
