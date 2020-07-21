//
//  ViewController.swift
//  Concentration
//
//  Created by Abdul Wahab on 18/02/2020.
//  Copyright © 2020 Abdul Wahab. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var theme = Theme()
    lazy var game = Concentration(numberOfPairOfCards: (cardButtons.count+1)/2)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor=theme.getBackgroud()
        flipCountLabel.textColor=theme.getButtonColor()
        updateViewFromModel()
        newGameButtonOutlet.setTitleColor(theme.getButtonColor(), for: UIControl.State.normal)
        score.textColor=theme.getButtonColor()
    }
    
    
    var flipCount=0 {
        didSet{
            flipCountLabel.text="Flips: \(flipCount)"
        }
    }
    var scoreCount = 0 {
        didSet{
            score.text="Score: \(scoreCount)"
        }
    }
    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var newGameButtonOutlet: UIButton!
    @IBAction func newGameButton(_ sender: UIButton) {
        theme.randomize()
        self.view.backgroundColor=theme.getBackgroud()
        flipCountLabel.textColor=theme.getButtonColor()
        newGameButtonOutlet.setTitleColor(theme.getButtonColor(), for: UIControl.State.normal)
        score.textColor=theme.getButtonColor()
        game.reload(numberOfPairOfCards: (cardButtons.count+1)/2)
        emoji.removeAll()
        emojiChoices=theme.getEmojis()
        updateViewFromModel()
        flipCount=0
        scoreCount=0
    }
    
    
    @IBOutlet var cardButtons: [UIButton]!
    
    
    
    @IBAction func touchCard(_ sender: UIButton) {
        if let cardNumber = cardButtons.firstIndex(of: sender){
            game.chooseCard(at: cardNumber)
            scoreCount=game.score
            flipCount=game.flips
            updateViewFromModel()
        } else {
            print ("Choosen card was not in array")
        }
    }
    
    func updateViewFromModel() {
        let cardColor: UIColor = theme.getButtonColor()
        let white: UIColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        let transparent: UIColor = #colorLiteral(red: 0.07207091898, green: 0.1041071489, blue: 0.03160434961, alpha: 0.2008142606)
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp{
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = white
            } else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? transparent : cardColor
            }
        }
    }
    
    lazy var emojiChoices = theme.getEmojis()
    var emoji =  [Int:String]()

    func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil, emojiChoices.count>0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        return emoji[card.identifier] ?? "?"
    }

}

