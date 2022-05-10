import Foundation
import UIKit
import XCTest

class MyTennisGame: TennisGame {
    private let player1Name: String
    private let player2Name: String
    private var P1point: Int = 0
    private var P1res: String = ""
    private var P2point: Int = 0
    private var P2res: String = ""

    required init(player1: String, player2: String) {
        player1Name = player1
        player2Name = player2
    }

    var score: String? {
        if P1point >= 4 && P2point >= 0 && (P1point-P2point) >= 2 {
            return "Win for player1"
        } else if P2point >= 4 && P1point >= 0 && (P2point-P1point) >= 2 {
            return "Win for player2"
        } else if P1point == P2point && P1point < 3 {
            return "\(scoreMake(point: P1point))-All"
        } else if P1point == P2point && P1point > 2 {
            return "Deuce"
        } else if P1point > 0 && P2point == 0 {
            P1res = scoreMake(point: P1point)
            P2res = "Love"
            return "\(P1res)-\(P2res)"
        } else if P2point > 0 && P1point == 0 {
            P2res = scoreMake(point: P2point)
            P1res = "Love"
            return "\(P1res)-\(P2res)"
        } else if P1point>P2point && P1point < 4 {
            P1res = scoreMake(point: P1point)
            P2res = scoreMake(point: P2point)
            return "\(P1res)-\(P2res)"
        } else if P2point>P1point && P2point < 4 {
            P2res = scoreMake(point: P2point)
            P1res = scoreMake(point: P1point)
            return "\(P1res)-\(P2res)"
        } else if P1point > P2point && P2point >= 3 {
            return "Advantage player1"
        } else {
            return "Advantage player2"
        }
    }
}

extension MyTennisGame {
    func wonPoint(_ playerName: String) {
        func P1Score() { P1point += 1 }
        func P2Score() { P2point += 1 }
        
        playerName == "player1" ? P1Score() : P2Score()
    }
    
    private func scoreMake(point: Int) -> String {
        switch point {
            case 0: return "Love"
            case 1: return "Fifteen"
            case 2: return "Thirty"
            default: return "Forty"
        }
    }
}
