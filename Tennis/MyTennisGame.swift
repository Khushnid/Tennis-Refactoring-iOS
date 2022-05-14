import Foundation

final class MyTennisGame: TennisGame {
  
    private var P1point: Int = 0
    private var P2point: Int = 0

    required init(player1 p1: String, player2 p2: String) {}
    
    func wonPoint(_ playerName: String) {
        playerName == "player1" ? (P1point += 1) : (P2point += 1)
    }
    
    var score: String? {
        getScore(p1Pts: P1point, p2Pts: P2point)
    }
}

extension MyTennisGame {
    func getScore(p1Pts: Int, p2Pts: Int) -> String {
        switch true {
            case p1Pts >= 4 && (p1Pts - p2Pts) >= 2: return "Win for player1"
            case p2Pts >= 4 && (p2Pts - p1Pts) >= 2: return "Win for player2"
            case p1Pts > p2Pts && p2Pts >= 3: return "Advantage player1"
            case p2Pts > p1Pts && p1Pts >= 3: return "Advantage player2"
            case p1Pts == p2Pts && p1Pts > 2: return "Deuce"
            case p1Pts == p2Pts: return currentScore(r1: p1Pts, r2: nil)
            case p1Pts > 0 && p2Pts == 0: return currentScore(r1: p1Pts)
            case p2Pts > 0 && p1Pts == 0: return currentScore(r2: p2Pts)
            default: return currentScore(r1: p1Pts, r2: p2Pts)
        }
    }
    
    func getScore(for score: Int) -> String {
        switch score {
            case 0: return "Love"
            case 1: return "Fifteen"
            case 2: return "Thirty"
            case 3: return "Forty"
            default: return "All"
        }
    }
    
    private func currentScore(r1: Int = 0, r2: Int? = 0) -> String {
        "\(getScore(for: r1))-\(getScore(for: r2 ?? -1))"
    }
}
