import Foundation

/**
* 2019.11.26 핸드폰 번호 가리기 (순한맛)
* https://programmers.co.kr/learn/courses/30/lessons/12948
* **/

func solution(_ phone_number:String) -> String {
    return String(Array(repeating: "*", count: phone_number.count-4)) + phone_number.suffix(4)
}

//print("\(solution("01033334444"))")
//print("")
//
//print("\(solution("027778888"))")
//print("")


/**
* 2019.11.26 하노이 타워 (매운맛)
* https://programmers.co.kr/learn/courses/30/lessons/12946
* **/

func solution1(_ n:Int) -> [[Int]] {
    var ways = [[Int]]()
    
    func HanoiTower(_ n: Int, _ from: Int, _ by: Int, _ to: Int){
        if n == 1 { ways.append([from, to]) }
        else {
            HanoiTower(n-1, from, to, by)
            ways.append([from, to])
            HanoiTower(n-1, by, from, to)
        }
    }

    HanoiTower(n, 1, 2, 3)
    
    return ways
}

print("\(solution1(2))")
print("")

print("\(solution1(5))")
print("")


var Stack = [Int]()
 
func Pop() -> Int {
    if Stack.last == nil {
        print("Stack is Empty")
    }
    
    return Stack.removeLast()
}
 
// 하노이 타워 반복문 구현 함수(스택 이용)
func Hanoi(_ n: Int, _ from: Int, _ by: Int, _ to: Int)
{
    var n = n
    var from = from
    var by = by
    var to = to
 
    while true {
        while n > 1 {
            Stack.append(to)
            print("Append to : \(to) \n-> \(Stack)")
            Stack.append(by)
            print("Append by : \(by) \n-> \(Stack)")
            Stack.append(from)
            print("Append from : \(from) \n-> \(Stack)")
            Stack.append(n)
            print("Append n : \(n) \n-> \(Stack)")
            
            n -= 1
            print("")
            print("n : \(n)")
            
            Stack.append(to)
            print("Append to : \(to) \n-> \(Stack)")
            
            print("to : (\(to)) -> by(\(by)) ")
            to = by
            guard let _ = Stack.last else {
                break
            }
            print("by : (\(by)) -> lastStack(\(Stack.last!)), from(\(from))")
            by = Stack.removeLast()
            print("")
        }
        print("원반\(n)를 \(from)에서 \(to)로 이동")
        
        if Stack.count > 0 {
            n = Pop()
            from = Pop()
            by = Pop()
            to = Pop()
            print("원반\(n)를 \(from)에서 \(to)로 이동")
            
            n -= 1
            Stack.append(from)
            from = by
            by = Pop()
        }
        else { break }
    }
}

func HanoiTower(_ n: Int, _ from: Int, _ by: Int, _ to: Int){
    if n == 1 { print("원반\(n)를 \(from)에서 \(to)로 이동") }
    else {
        HanoiTower(n-1, from, to, by)
        print("원반\(n)를 \(from)에서 \(to)로 이동")
        HanoiTower(n-1, by, from, to)
    }
}

