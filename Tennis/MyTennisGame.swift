import Foundation

final class MyTennisGame: TennisGame {
    private var p1Pts: Int = 0
    private var p2Pts: Int = 0
    
    init(player1: String, player2: String) {}
    
    func wonPoint(_ playerName: String) {
        playerName == "player1" ? (p1Pts += 1) : (p2Pts += 1)
    }
    
    var score: String? {
        switch true {
            case p1Pts > 3 && p1Pts - p2Pts > 1: return "Win for player1"
            case p2Pts > 3 && p2Pts - p1Pts > 1: return "Win for player2"
            case p2Pts > 2 && p1Pts > p2Pts: return "Advantage player1"
            case p1Pts > 2 && p2Pts > p1Pts: return "Advantage player2"
            case p1Pts > 0 && p2Pts == 0: return scoreResult(p1: p1Pts)
            case p2Pts > 0 && p1Pts == 0: return scoreResult(p2: p2Pts)
            case p1Pts == p2Pts: return valueWhenPlayerPointsAreEqual
            default: return scoreResult(p1: p1Pts, p2: p2Pts)
        }
    }
    
    var valueWhenPlayerPointsAreEqual: String {
        return (p1Pts > 2) ? "Deuce" : scoreResult(p1: p1Pts, p2: nil)
    }
    
    private func scoreResult(p1: Int = 0, p2: Int? = 0) -> String {
        return "\(getPoint(for: p1))-\(getPoint(for: p2 ?? -1))"
    }
    
    private func getPoint(for score: Int) -> String {
        switch score {
            case 0: return "Love"
            case 1: return "Fifteen"
            case 2: return "Thirty"
            case 3: return "Forty"
            default: return "All"
        }
    }
}
