//
//  Theme.swift
//  Concentration
//
//  Created by Abdul Wahab on 18/02/2020.
//  Copyright © 2020 Abdul Wahab. All rights reserved.
//

import Foundation
import UIKit


class Theme {
    var emojis = [[String]]()
    var background = [UIColor]()
    var buttonColor = [UIColor]()
    var index1=0
    var index2=0
    var index3=0
    
    init(){
        emojis.append(["👻","🎃","🦅","🍷","🍎","🍭","🍬","🦹🏻‍♂️"])
        emojis.append(["🦓","🦖","🦩","🦚","🐁","🦢","🐍","🐒"])
        emojis.append(["😄","😅","😂","😍","😘","😜","🥶","😡"])
        emojis.append(["🎾","🎿","🏀","🏈","🏓","⛳️","🏎","🏹"])
        background.append(#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1))
        background.append(#colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1))
        background.append(#colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1))
        background.append(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))
        buttonColor.append(#colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1))
        buttonColor.append(#colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1))
        buttonColor.append(#colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1))
        buttonColor.append(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1))
        index1=Int(arc4random_uniform(UInt32(emojis.count)))
        index2=Int(arc4random_uniform(UInt32(background.count)))
        index3=Int(arc4random_uniform(UInt32(buttonColor.count)))
    }
    
    func getEmojis() -> [String]{
        return emojis[index1]
    }
    func getBackgroud() -> UIColor{
        return background[index2]
    }
    func getButtonColor() -> UIColor{
        return buttonColor[index3]
    }
    func randomize(){
        index1=Int(arc4random_uniform(UInt32(emojis.count)))
        index2=Int(arc4random_uniform(UInt32(background.count)))
        index3=Int(arc4random_uniform(UInt32(buttonColor.count)))
    }
}
