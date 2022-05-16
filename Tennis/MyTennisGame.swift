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
            case p1Pts - p2Pts >= 2 where p1Pts > 3: return "Win for player1"
            case p2Pts - p1Pts >= 2 where p2Pts > 3: return "Win for player2"
            case p1Pts > p2Pts where p2Pts > 2: return "Advantage player1"
            case p2Pts > p1Pts where p1Pts > 2: return "Advantage player2"
            case p1Pts == p2Pts where p1Pts > 2: return "Deuce"
            case p1Pts > 0 where p2Pts == 0: return currentScore(p1Res: p1Pts)
            case p2Pts > 0 where p1Pts == 0: return currentScore(p2Res: p2Pts)
            case p1Pts == p2Pts: return currentScore(p1Res: p1Pts, p2Res: nil)
            default: return currentScore(p1Res: p1Pts, p2Res: p2Pts)
        }
    }
    
    private func currentScore(p1Res: Int = 0, p2Res: Int? = 0) -> String {
        return "\(getScore(for: p1Res))-\(getScore(for: p2Res ?? -1))"
    }
    
    private func getScore(for score: Int) -> String {
        switch score {
            case 0: return "Love"
            case 1: return "Fifteen"
            case 2: return "Thirty"
            case 3: return "Forty"
            default: return "All"
        }
    }
}
