import XCTest

class TennisTests: XCTestCase {
    let player1 = "player1"
    let player2 = "player2"
    
    func testOnlyPlayer1Points() {
        let game = MyTennisGame(player1: player1, player2: player2)
        
        XCTAssertEqual(game.score, "Love-All")
        
        game.wonPoint(player1)
        XCTAssertEqual(game.score, "Fifteen-Love")
        
        game.wonPoint(player1)
        XCTAssertEqual(game.score, "Thirty-Love")
        
        game.wonPoint(player1)
        XCTAssertEqual(game.score, "Forty-Love")
        
        game.wonPoint(player1)
        XCTAssertEqual(game.score, "Win for player1")
        
        game.wonPoint(player2)
        XCTAssertEqual(game.score, "Win for player1")
        
        game.wonPoint(player2)
        XCTAssertEqual(game.score, "Win for player1")
    }
    
    func testOnlyPlayer2Points() {
        let game = MyTennisGame(player1: player1, player2: player2)
        
        XCTAssertEqual(game.score, "Love-All")
        
        game.wonPoint(player2)
        XCTAssertEqual(game.score, "Love-Fifteen")
        
        game.wonPoint(player2)
        XCTAssertEqual(game.score, "Love-Thirty")
        
        game.wonPoint(player2)
        XCTAssertEqual(game.score, "Love-Forty")
        
        game.wonPoint(player2)
        XCTAssertEqual(game.score, "Win for player2")
        
        game.wonPoint(player1)
        XCTAssertEqual(game.score, "Win for player2")
        
        game.wonPoint(player1)
        XCTAssertEqual(game.score, "Win for player2")
    }
    
    func testSamePoints() {
        let game = MyTennisGame(player1: player1, player2: player2)
        
        game.wonPoint(player1)
        game.wonPoint(player2)
        XCTAssertEqual(game.score, "Fifteen-All")
        
        game.wonPoint(player1)
        game.wonPoint(player2)
        XCTAssertEqual(game.score, "Thirty-All")
        
        game.wonPoint(player1)
        game.wonPoint(player2)
        XCTAssertEqual(game.score, "Deuce")
        
        game.wonPoint(player1)
        game.wonPoint(player2)
        XCTAssertEqual(game.score, "Deuce")
    }
    
    func testPlayer1Ahead() {
        let game = MyTennisGame(player1: player1, player2: player2)
        
        game.wonPoint(player1)
        game.wonPoint(player1)
        game.wonPoint(player2)
        XCTAssertEqual(game.score, "Thirty-Fifteen")
        
        game.wonPoint(player1)
        XCTAssertEqual(game.score, "Forty-Fifteen")
        
        game.wonPoint(player2)
        XCTAssertEqual(game.score, "Forty-Thirty")
        
        game.wonPoint(player1)
        XCTAssertEqual(game.score, "Win for player1")
        
        game.wonPoint(player2)
        XCTAssertEqual(game.score, "Advantage player1")
        
        game.wonPoint(player1)
        XCTAssertEqual(game.score, "Win for player1")
        
        game.wonPoint(player2)
        XCTAssertEqual(game.score, "Advantage player1")
        
        game.wonPoint(player1)
        XCTAssertEqual(game.score, "Win for player1")
        
        game.wonPoint(player2)
        XCTAssertEqual(game.score, "Advantage player1")
        
        game.wonPoint(player1)
        XCTAssertEqual(game.score, "Win for player1")
        
        game.wonPoint(player2)
        XCTAssertEqual(game.score, "Advantage player1")
        
        game.wonPoint(player1)
        XCTAssertEqual(game.score, "Win for player1")
        
        game.wonPoint(player2)
        XCTAssertEqual(game.score, "Advantage player1")
        
        game.wonPoint(player1)
        XCTAssertEqual(game.score, "Win for player1")
    }
    
    func testPlayer2Ahead() {
        let game = MyTennisGame(player1: player1, player2: player2)
        
        game.wonPoint(player2)
        game.wonPoint(player2)
        game.wonPoint(player1)
        XCTAssertEqual(game.score, "Fifteen-Thirty")
        
        game.wonPoint(player2)
        XCTAssertEqual(game.score, "Fifteen-Forty")

        game.wonPoint(player1)
        XCTAssertEqual(game.score, "Thirty-Forty")

        game.wonPoint(player2)
        XCTAssertEqual(game.score, "Win for player2")

        game.wonPoint(player1)
        XCTAssertEqual(game.score, "Advantage player2")

        game.wonPoint(player2)
        XCTAssertEqual(game.score, "Win for player2")

        game.wonPoint(player1)
        XCTAssertEqual(game.score, "Advantage player2")

        game.wonPoint(player2)
        XCTAssertEqual(game.score, "Win for player2")

        game.wonPoint(player1)
        XCTAssertEqual(game.score, "Advantage player2")

        game.wonPoint(player2)
        XCTAssertEqual(game.score, "Win for player2")

        game.wonPoint(player1)
        XCTAssertEqual(game.score, "Advantage player2")

        game.wonPoint(player2)
        XCTAssertEqual(game.score, "Win for player2")

        game.wonPoint(player1)
        XCTAssertEqual(game.score, "Advantage player2")

        game.wonPoint(player2)
        XCTAssertEqual(game.score, "Win for player2")
    }
}
