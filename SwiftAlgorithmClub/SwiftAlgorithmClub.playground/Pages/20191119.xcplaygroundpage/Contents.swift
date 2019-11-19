//: [Previous](@previous)

import Foundation

struct Load {
    struct Coordinate: Hashable {
        var x: Int
        var y: Int
        
        init (_ x: Int, _ y: Int) {
            self.x = x
            self.y = y
        }
    }

    struct Way: Hashable {
        var start: Coordinate
        var end: Coordinate
        
        func hash(into hasher: inout Hasher) {
            hasher.combine(self.start)
            hasher.combine(self.end)
        }
        
        static func == (lhs: Way, rhs: Way) -> Bool {
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
    
    private var loads: [Way] = []
    private var location: Coordinate = Coordinate(0,0)
    
    var newLoadCount: Int {
        loads.count
    }
    
    mutating func moving(dir: Character) {
        guard let direction = Direction(rawValue: dir)?.discription else {
            return
        }
        
        if abs(location.x + direction.x) > 5 || abs(location.y + direction.y) > 5 {
            return
        }
        
        let start = location
        location.x += direction.x
        location.y += direction.y
        
        let way = Way(start: start, end: location)
        if loads.contains(where: { $0 == way }) {
            return
        }
        
        loads.append(way)
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

