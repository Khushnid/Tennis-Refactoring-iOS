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
    
    func wonPoint(_ playerName: String) {
        playerName == "player1" ? (P1point += 1) : (P2point += 1)
    }
    
    var score: String? {
        switch (P1point, P2point) {
        case let (pt1, pt2) where pt1 >= 4 && pt1 - pt2 >= 2: return "Win for player1"
        case let (pt1, pt2) where pt2 >= 4 && pt2 - pt1 >= 2: return "Win for player2"
        case let (pt1, pt2) where pt1 > pt2 && pt2 >= 3: return "Advantage player1"
        case let (pt1, pt2) where pt2 > pt1 && pt1 >= 3: return "Advantage player2"
        case let (pt1, pt2) where pt1 == pt2 && pt1 > 2: return "Deuce"
        case let (pt1, pt2) where pt1 == pt2 && pt1 < 3: return "\(scoreMake(point: pt1))-All"
        case let (pt1, pt2) where pt1 > 0 && pt2 == 0: return playerScores(p1Res: scoreMake(point: pt1))
        case let (pt1, pt2) where pt2 > 0 && pt1 == 0: return playerScores(p2Res: scoreMake(point: pt2))
        default: return playerScores(p1Res: scoreMake(point: P1point), p2Res: scoreMake(point: P2point))
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
    
    private func playerScores(p1Res: String? = nil, p2Res: String? = nil) -> String {
        "\(p1Res ?? "Love")-\(p2Res ?? "Love")"
    }
}
