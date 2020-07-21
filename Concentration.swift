//
//  Concentration.swift
//  Concentration
//
//  Created by Abdul Wahab on 18/02/2020.
//  Copyright © 2020 Abdul Wahab. All rights reserved.
//

import Foundation

class Concentration
{
    var cards = [Card]()
    var indexOfOneAndOnlyFaceUpCard: Int?
    var score=0
    var flips=0
    
    // this is a comment
    
    // this is feature1
    
    func chooseCard(at index: Int) {
        flips+=1
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched=true
                    cards[index].isMatched=true
                    score+=2
                }
                cards[index].isFaceUp=true
                cards[index].isSeen+=1
                indexOfOneAndOnlyFaceUpCard=nil
            } else {
                var deduct=false
                for flipDownIndex in cards.indices {
                    if cards[flipDownIndex].isFaceUp, cards[flipDownIndex].isSeen>1,cards[flipDownIndex].isMatched==false {
                        deduct=true
                    }
                    cards[flipDownIndex].isFaceUp = false
                }
                if deduct {
                    score-=1
                }
                cards[index].isFaceUp = true
                cards[index].isSeen+=1
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    init(numberOfPairOfCards: Int) {
        for _ in 0..<numberOfPairOfCards {
            let card = Card()
            cards += [card,card]
        }
        for _ in 0...(cards.count*10) {
            let randomIndex1 = Int(arc4random_uniform(UInt32(cards.count)))
            let randomIndex2 = Int(arc4random_uniform(UInt32(cards.count)))
            let cardTemp=cards[randomIndex1]
            cards[randomIndex1]=cards[randomIndex2]
            cards[randomIndex2]=cardTemp
        }
    }
    
    func reload(numberOfPairOfCards: Int){
        score=0
        flips=0
        cards.removeAll()
        for _ in 0..<numberOfPairOfCards {
            let card = Card()
            cards += [card,card]
        }
        for _ in 0...(cards.count*10) {
            let randomIndex1 = Int(arc4random_uniform(UInt32(cards.count)))
            let randomIndex2 = Int(arc4random_uniform(UInt32(cards.count)))
            let cardTemp=cards[randomIndex1]
            cards[randomIndex1]=cards[randomIndex2]
            cards[randomIndex2]=cardTemp
        }
    }
}
