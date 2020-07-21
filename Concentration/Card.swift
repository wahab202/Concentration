//
//  Card.swift
//  Concentration
//
//  Created by Abdul Wahab on 18/02/2020.
//  Copyright © 2020 Abdul Wahab. All rights reserved.
//

import Foundation

struct Card
{
    var isFaceUp = false
    var isMatched = false
    var isSeen = 0
    var identifier: Int
    
    
    static var identifierFactory = 0
    
    static func getUniqueIdentifier() -> Int {
        identifierFactory+=1
        return Card.identifierFactory
    }
    
    init(){
        self.identifier=Card.getUniqueIdentifier()
    }
}
