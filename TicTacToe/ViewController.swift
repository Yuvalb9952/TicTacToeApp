//
//  ViewController.swift
//  TicTacToe
//
//  Created by admin on 26/04/2022.
//

import UIKit

class ViewController: UIViewController {

    enum Turn {
        case X
        case O
    }
    
    @IBOutlet weak var turnLabel: UILabel!
    @IBOutlet weak var cell11: UIButton!
    @IBOutlet weak var cell12: UIButton!
    @IBOutlet weak var cell13: UIButton!
    @IBOutlet weak var cell21: UIButton!
    @IBOutlet weak var cell22: UIButton!
    @IBOutlet weak var cell23: UIButton!
    @IBOutlet weak var cell31: UIButton!
    @IBOutlet weak var cell32: UIButton!
    @IBOutlet weak var cell33: UIButton!
    
    var firstTurn = Turn.X
    var currentTurn = Turn.X
    var xTitle = "X"
    var oTitle = "O"
    var board = [UIButton]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initBoard()
    }

    func initBoard() {
        board.append(cell11)
        board.append(cell12)
        board.append(cell13)
        board.append(cell21)
        board.append(cell22)
        board.append(cell23)
        board.append(cell31)
        board.append(cell32)
        board.append(cell33)
    }

    @IBAction func cellTapAction(_ sender: UIButton) {
        addToCell(sender)
        
        if (checkWinningCombinations(xTitle)) {
            alertGameResult(title: "X Won!")
        } else if (checkWinningCombinations(oTitle)) {
            alertGameResult(title: "O Won!")
        } else if (fullBoard()) {
            alertGameResult(title: "Draw")
        }
    }
    
    func addToCell(_ sender:UIButton) {
        if (sender.title(for: .normal) == nil) {
            if (currentTurn == Turn.O) {
                sender.setTitle(oTitle, for: .normal)
                currentTurn = Turn.X
                turnLabel.text = xTitle
            } else if (currentTurn == Turn.X) {
                sender.setTitle(xTitle, for: .normal)
                currentTurn = Turn.O
                turnLabel.text = oTitle
            } 
        }
    }
    
    func fullBoard() -> Bool {
        for btn in board {
            // Found empty space in board - not full
            if (btn.title(for: .normal) == nil) {
                return false
            }
        }
        return true
    }
    
    func alertGameResult(title: String) {
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Reset Game", style: .default, handler: {
            (_) in self.resetGame()
        }))
        self.present(alert, animated: true)
    }
    
    func resetGame() {
        // Clean board
        for btn in board {
            btn.setTitle(nil, for: .normal)
        }
        
        turnLabel.text = xTitle
        currentTurn = Turn.X
    }
    
    func checkWinningCombinations(_ s: String) -> Bool {
        if (cell11.title(for: .normal) == s && cell12.title(for: .normal) == s && cell13.title(for: .normal) == s) {
            return true
        }
        if (cell21.title(for: .normal) == s && cell22.title(for: .normal) == s && cell23.title(for: .normal) == s) {
            return true
        }
        if (cell31.title(for: .normal) == s && cell32.title(for: .normal) == s && cell33.title(for: .normal) == s) {
            return true
        }
        if (cell11.title(for: .normal) == s && cell21.title(for: .normal) == s && cell31.title(for: .normal) == s) {
            return true
        }
        if (cell12.title(for: .normal) == s && cell22.title(for: .normal) == s && cell32.title(for: .normal) == s) {
            return true
        }
        if (cell13.title(for: .normal) == s && cell23.title(for: .normal) == s && cell33.title(for: .normal) == s) {
            return true
        }
        if (cell11.title(for: .normal) == s && cell22.title(for: .normal) == s && cell33.title(for: .normal) == s) {
            return true
        }
        if (cell13.title(for: .normal) == s && cell22.title(for: .normal) == s && cell31.title(for: .normal) == s) {
            return true
        }
        return false
    }
}

