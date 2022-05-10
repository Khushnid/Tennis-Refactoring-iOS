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
        var score = ""
      
        if P1point == P2point && P1point < 3 {
            score = scoreMake(point: P1point)
            score = "\(score)-All"
        }
      
        if P1point == P2point && P1point > 2 {
            score = "Deuce"
        }

        if P1point > 0 && P2point == 0 {
            P1res = scoreMake(point: P1point)
            P2res = "Love"
            
            score = "\(P1res)-\(P2res)"
        }
        if P2point > 0 && P1point == 0 {
            P2res = scoreMake(point: P2point)
            P1res = "Love"
            
            score = "\(P1res)-\(P2res)"
        }
        
        if (P1point>P2point && P1point < 4) {
            P1res = scoreMake(point: P1point)
            P2res = scoreMake(point: P2point)
            
            score = "\(P1res)-\(P2res)"
        }
      
        if P2point>P1point && P2point < 4 {
            P2res = scoreMake(point: P2point)
            P1res = scoreMake(point: P1point)
        
            score = "\(P1res)-\(P2res)"
        }
        
        if P1point > P2point && P2point >= 3 {
            score = "Advantage player1"
        }
        
        if P2point > P1point && P1point >= 3 {
            score = "Advantage player2"
        }
        
        if P1point >= 4 && P2point >= 0 && (P1point-P2point)>=2 {
            score = "Win for player1"
        }
      
        if P2point >= 4 && P1point >= 0 && (P2point-P1point) >= 2 {
            score = "Win for player2"
        }
      
        return score
    }
    
   private func setP1Score(number: Int) {
        for _ in 0..<number {
            P1Score()
        }
    }

    private func setP2Score(number: Int) {
        for _ in 0..<number {
            P2Score()
        }
        
    }
    
    private func P1Score() {
        P1point+=1
    }
    
    private func P2Score() {
        P2point+=1
    }
    
    func wonPoint(_ playerName: String) {
        if playerName == "player1" {
            P1Score()
        } else {
            P2Score()
        }
    }
}

// MARK: - Helper Methods
extension MyTennisGame {
    private func scoreMake(point: Int) -> String {
        if point == 0 {
            return "Love"
        } else if point == 1 {
            return "Fifteen"
        } else if point == 2 {
            return "Thirty"
        } else {
            return "Forty"
        }
    }
}
