//
//  GameViewController.swift
//  TicTacToe
//
//  Created by Mattias Andersson on 2021-12-10.
//

import UIKit

class GameViewController: UIViewController {
    
    var player1Type: Int!
    var player2Type: Int!
    var player1: Player!
    var player2: Player!
    var whatPlayerWon: Int!
    var startingPlayer: Int!
    
    @IBOutlet weak var player1Field: UILabel!
    @IBOutlet weak var player2Field: UILabel!
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button8: UIButton!
    @IBOutlet weak var button9: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        player2Field.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 1)
        player1 = Player(listOfCells: [], playerType: player1Type)
        player2 = Player(listOfCells: [], playerType: player2Type)
        
        // Random player starts
        switchPlayerTurns(player: (1...2).randomElement()! )
    }
    
    func switchPlayerTurns(player: Int) {
        print("Player: \(player)'s turn\n")
        
        switch player {
        case 1:
            player1Field.backgroundColor = .green
            player2Field.backgroundColor = .lightGray
            startingPlayer = 1
        case 2:
            player1Field.backgroundColor = .lightGray
            player2Field.backgroundColor = .green
            startingPlayer = 2
        default:
            break
        }
    }
    
    func goToWinningScreen(winningPlayer: Int, bothLost: Bool) {
        if bothLost == true {
            whatPlayerWon = 0
        } else {
            whatPlayerWon = winningPlayer
        }
        
        self.performSegue(withIdentifier: "segueToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToResult" {
            let destination = segue.destination as! ResultViewController
            
            destination.whatPlayerWon = whatPlayerWon
        }
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        switch startingPlayer {
        case 1:
            switch Game().performPlayerActions(cellTag: sender.tag, myPlayer: player1, otherPlayer: player2) {
            case "SwitchTurn":
                sender.setTitle("X", for: [])
                switchPlayerTurns(player: 2)
            case "player1Won":
                goToWinningScreen(winningPlayer: 1, bothLost: false)
            case "player2Won":
                goToWinningScreen(winningPlayer: 2, bothLost: false)
            case "Draw":
                goToWinningScreen(winningPlayer: 0, bothLost: true)
            default:
                break
            }
            
        case 2:
            switch Game().performPlayerActions(cellTag: sender.tag, myPlayer: player2, otherPlayer: player1) {
            case "SwitchTurn":
                sender.setTitle("O", for: [])
                switchPlayerTurns(player: 1)
            case "player1Won":
                goToWinningScreen(winningPlayer: 1, bothLost: false)
            case "player2Won":
                goToWinningScreen(winningPlayer: 2, bothLost: false)
            case "Draw":
                goToWinningScreen(winningPlayer: 0, bothLost: true)
            default:
                break
            }
            
        default:
            break
        }
    }
    
}
