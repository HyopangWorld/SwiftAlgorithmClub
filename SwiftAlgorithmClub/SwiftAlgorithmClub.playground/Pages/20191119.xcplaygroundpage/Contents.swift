//: [Previous](@previous)

import Foundation

/**
* 카카오 오픈챗 Swift Algorithm Club 문제 풀이
* 2019.11.19  방문 길이 구하기
* https://programmers.co.kr/learn/courses/30/lessons/49994?language=swift
* **/

struct Load {
    struct Coordinate: Hashable {
        var x: Int
        var y: Int
        
        init (_ x: Int, _ y: Int) {
            self.x = x
            self.y = y
        }
        
        static func + (lhs: Coordinate, rhs: Coordinate) -> Coordinate {
            Coordinate(lhs.x + rhs.x, lhs.y + rhs.y)
        }
    }

    struct Path: Hashable {
        var start: Coordinate
        var end: Coordinate
        
        func hash(into hasher: inout Hasher) {
            hasher.combine(self.start)
            hasher.combine(self.end)
        }
        
        static func == (lhs: Path, rhs: Path) -> Bool {
            (lhs.start == rhs.start && lhs.end == rhs.end)
            || (lhs.start == rhs.end && lhs.end == rhs.start)
        }
    }
    
    enum Direction: Character {
        case up = "U"
        case down = "D"
        case right = "R"
        case left = "L"
        
        var discription: Coordinate {
            switch self {
            case .up:
                return Coordinate(1,0)
            case .down:
                return Coordinate(-1,0)
            case .right:
                return Coordinate(0,1)
            case .left:
                return Coordinate(0,-1)
            }
        }
    }
    
    private var loads: [Path] = []
    private var position: Coordinate = Coordinate(0,0)
    
    var newLoadCount: Int {
        loads.count
    }
    
    mutating func moving(dir: Character) {
        guard let direction = Direction(rawValue: dir)?.discription else {
            return
        }
        
        let move = position + direction
        
        if abs(move.x) > 5 || abs(move.y) > 5 {
            return
        }
        
        let way = Path(start: position, end: move)
        
        if loads.contains(where: { $0 == way }) {
            return
        }
        
        loads.append(way)
        position = move
    }
    
}

func solution(_ dirs:String) -> Int {
    var curLocation = Load()
    
    for dir in Array(dirs) {
        curLocation.moving(dir: dir)
    }
    
    return curLocation.newLoadCount
}

print("\(solution("ULURRDLLU"))")

