//
//  ViewController.swift
//  SimonSaysLab
//
//  Created by James Campagno on 5/31/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func red(sender: AnyObject) {
        buttonsClicked += 1
        print("hey red is being clicked")
        simonSaysGame.guessRed()
        playedGame ()

        }
    
    @IBAction func green(sender: AnyObject) {
        buttonsClicked += 1
        print("hey green is being clicked")
        simonSaysGame.guessGreen()
        playedGame ()

    }
    
    @IBAction func yellow(sender: AnyObject) {
        buttonsClicked += 1
        print("hey yellow is being clicked")
        simonSaysGame.guessYellow()
        playedGame ()

    }
    
    @IBAction func blue(sender: AnyObject) {
        buttonsClicked += 1
        print("hey blue is being clicked")
        simonSaysGame.guessBlue()
        playedGame ()

    }
    
    @IBOutlet weak var youWon: UILabel!
    
    @IBOutlet weak var tryAgain: UILabel!
    
    @IBOutlet weak var displayColorView: UIView!
    @IBOutlet weak var startGameButton: UIButton!
    @IBOutlet weak var winLabel: UILabel!
    
    var simonSaysGame = SimonSays()
    var buttonsClicked = 0
    

    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        winLabel.hidden = true
        youWon.hidden = true
        tryAgain.hidden = true

    }
}

// MARK: - SimonSays Game Methods
extension ViewController {
    
    @IBAction func startGameTapped(sender: UIButton) {
        UIView.transitionWithView(startGameButton, duration: 0.9, options: .TransitionFlipFromBottom , animations: {
            self.startGameButton.hidden = true
            }, completion: nil)
        
        displayTheColors()
    }
    
    private func displayTheColors() {
        self.view.userInteractionEnabled = false
        UIView.transitionWithView(displayColorView, duration: 1.5, options: .TransitionCurlUp, animations: {
            self.displayColorView.backgroundColor = self.simonSaysGame.nextColor()?.colorToDisplay
            self.displayColorView.alpha = 0.0
            self.displayColorView.alpha = 1.0
            }, completion: { _ in
                if !self.simonSaysGame.sequenceFinished() {
                    self.displayTheColors()
                } else {
                    self.view.userInteractionEnabled = true
                    print("Pattern to match: \(self.simonSaysGame.patternToMatch)")
                }
        })
    }
    
    func playedGame () {
        if buttonsClicked == 5 && simonSaysGame.chosenColors == simonSaysGame.patternToMatch {
            youWon.hidden = false

        } else if
            buttonsClicked == 5 && simonSaysGame.chosenColors != simonSaysGame.patternToMatch  {
            tryAgain.hidden = false
        }
    
}
}
