import Foundation

// 정점에서 출발
// 이동할 곳이 있나 체크
//      a. 있으면 str에 추가하고 이동
//.     b. 없으면 +1 하고 아직 가지 않은 곳이 있나 탐색


func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    var stack = [Int]()
    var str = ""
    var count = 0
    
    func searching(i: Int){
        for j in 0..<n {
            if (computers[i][j] == 1) && !str.contains("\(j)") {
                stack.append(j)
                str += "\(j)"
                searching(i: j)
                return
            }
        }
        stack.removeLast()
        if stack.count <= 0 { return }
        
        count += 1
        searching(i: stack.last ?? 0)
    }
    
    searching(i: 0)
    
    return 0
}

//print("\(solution(3, [[1,1,0], [1,1,0], [0,0,1]]))")
//print("\(solution(5, [[1,0,0,0,1],[0,1,1,0,0],[0,1,1,1,0],[0,0,1,1,1],[1,0,0,1,1]]))")

print("\(solution(5, [[1,1,0,0,1],[0,1,1,0,0],[0,0,1,0,0],[0,0,0,1,1],[1,0,0,1,1]]))")
