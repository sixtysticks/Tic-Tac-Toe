//
//  ViewController.swift
//  TicTacToe
//
//  Created by David Gibbs on 03/03/2016.
//  Copyright © 2016 SixtySticks. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //  Noughts == 1 and Crosses == 2
    var activePlayer = 1
    var isGameActive = true
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    var numberOfSpacesFilled = 0
    var winningCombinations = [ [0, 1, 2], [3, 4, 5], [6, 7, 8],    // horizontal winning lines
                                [0, 3, 6], [1, 4, 7], [2, 5, 8],    // vertical winning lines
                                [0, 4, 8], [2, 4, 6] ]              // diagonal winning lines
    
    @IBOutlet weak var winnerAnnounced: UILabel!
    
    @IBOutlet weak var playAgainButtonLabel: UIButton!
    
    @IBOutlet weak var button: UIButton!
    
    @IBAction func buttonPressed(sender: AnyObject) {
        
        if gameState[sender.tag] == 0 && isGameActive == true {
            
            numberOfSpacesFilled += 1
            
            gameState[sender.tag] = activePlayer
            
            var image = UIImage()
            
            if activePlayer == 1 {
                image = UIImage(named: "nought@2x.png")!
                activePlayer = 2
            } else {
                image = UIImage(named: "cross@2x.png")!
                activePlayer = 1
            }
            
            sender.setImage(image, forState: .Normal)
            
            for combination in winningCombinations {
                if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]] {
                    
                    if gameState[combination[0]] == 1 {
                        andTheWinnerIs("Noughts have won!")
                        
                    } else {
                        andTheWinnerIs("Crosses have won!")
                    }
                }
            }
            
            if numberOfSpacesFilled == 9 {
                andTheWinnerIs("It's a draw!")
            }
        }
    }
    
    @IBAction func playAgainPressed(sender: AnyObject) {
        activePlayer = 1
        isGameActive = true
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        
        var button: UIButton
        
        for var i = 0; i < 9; i++ {
            button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, forState: .Normal)
        }
        
        winnerAnnounced.hidden = true
        playAgainButtonLabel.hidden = true
    }

    func andTheWinnerIs(labelText: String) {
        winnerAnnounced.text = labelText
        winnerAnnounced.hidden = false
        playAgainButtonLabel.hidden = false
        isGameActive = false
        numberOfSpacesFilled = 0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        winnerAnnounced.hidden = true
        playAgainButtonLabel.hidden = true
    }
    
}

