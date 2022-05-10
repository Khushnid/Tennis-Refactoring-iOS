import Foundation

class MyTennisGame: TennisGame {
    private let player1Name: String
    private let player2Name: String
    private var P1point: Int = 0
    private var P2point: Int = 0
    private var P1res: String = ""
    private var P2res: String = ""
    
    required init(player1: String, player2: String) {
        player1Name = player1
        player2Name = player2
    }
    
    var score: String? { getScore(P1point, P2point) }
}

extension MyTennisGame {
    private func getScore(_ point1: Int, _ point2: Int) -> String {
        switch (point1, point2) {
            case let (pt1, pt2) where pt1 >= 4 && pt1 - pt2 >= 2: return "Win for player1"
            case let (pt1, pt2) where pt2 >= 4 && pt2 - pt1 >= 2: return "Win for player2"
            case let (pt1, pt2) where pt1 > pt2 && pt2 >= 3: return "Advantage player1"
            case let (pt1, pt2) where pt2 > pt1 && pt1 >= 3: return "Advantage player2"
            case let (pt1, pt2) where pt1 == pt2 && pt1 > 2: return "Deuce"
            case let (pt1, pt2) where pt1 == pt2 && pt1 < 3: return "\(scoreMake(point: pt1))-All"
            case let (pt1, pt2) where pt1 > 0 && pt2 == 0: return playerScores(scoreMake(point: pt1), nil)
            case let (pt1, pt2) where pt2 > 0 && pt1 == 0: return playerScores(nil, scoreMake(point: point2))
            default: return playerScores(scoreMake(point: point1), scoreMake(point: point2))
        }
    }
    
    private func scoreMake(point: Int) -> String {
        switch point {
            case 0: return "Love"
            case 1: return "Fifteen"
            case 2: return "Thirty"
            default: return "Forty"
        }
    }
    
    private func playerScores(_ p1Result: String?, _ p2Result: String?) -> String {
        return "\(p1Result ?? "Love")-\(p2Result ?? "Love")"
    }
    
    func wonPoint(_ playerName: String) {
        playerName == "player1" ? (P1point += 1) : (P2point += 1)
    }
}
