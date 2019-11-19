import Foundation

/**
 * 카카오 오픈챗 Swift Algorithm Club 문제 풀이
 * 2019.11.15 파일명 알파벳 + 숫자 순으로 정렬하기
 * **/

extension String {
    func matchingReplace(_ regularExpression: String, with: String) -> String {
        do {
            let regex = try NSRegularExpression(pattern: regularExpression , options: .caseInsensitive)
            return regex.stringByReplacingMatches(in: self,
                                                  options: NSRegularExpression.MatchingOptions.reportCompletion,
                                                  range: NSMakeRange(0, self.count), withTemplate: with)
        }catch{
            print(error.localizedDescription)
            return self
        }
    }
}

struct FileName {
    enum Pattern: String {
        case number = "([0-9])"
        case word = #"\D"#
    }
    
    var file: String
    var header: String {
        let words = file.matchingReplace(Pattern.number.rawValue, with: "*").split(separator: "*")
        return String(words[0])
    }
    var number: Int {
        let numbers = file.matchingReplace(Pattern.word.rawValue, with: "*").split(separator: "*")
        return Int(String(numbers[0])) ?? 0
    }
    
    init(file: String){
        self.file = file
    }
    
}

func solution(_ files:[String]) -> [String] {
    let fileNames = files.map { FileName(file: $0) }
    
    return fileNames.sorted(by: {
        if $0.file == $1.file { return false }
        
        if $0.header.lowercased() < $1.header.lowercased() { return true }
        
        if $0.header.lowercased() == $1.header.lowercased()
            && $0.number < $1.number { return true }
        
        return false
    }).map { $0.file }
}

print("\(solution(["A0fghth00", "B 50 Superf456 ortress4654", "A 10 Thunderb4564olt II", "F 14 Tomc4at"]))")
