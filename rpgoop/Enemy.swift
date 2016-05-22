//
//  Enemy.swift
//  rpgoop
//
//  Created by R. Maia on 5/18/16.
//  Copyright © 2016 RM. All rights reserved.
//

import Foundation

class Enemy: Character {
    var loot: [String] {
        return ["Rusty Dagger", "Cracked Buckler"]
    }
    
    var type: String {
        return "Grunt"
    }
    
    func dropLoot() -> String? {
        if !isAlive {
            //Random number
            let rand = Int(arc4random_uniform(UInt32(loot.count)))
            return loot[rand]
        }
        
        return nil
    }
}