//
//  Player.swift
//  rpgoop
//
//  Created by R. Maia on 5/18/16.
//  Copyright © 2016 RM. All rights reserved.
//

import Foundation

class Player: Character {
    private var _name = "Player"
    
    var name: String {
        get {
            return _name
        }
    }
    
    private var _inventory = [String]()
    
    var inventory: [String] {
        return _inventory
    }
    
    convenience init(name: String, hp: Int, attackPwr: Int) {
        self.init(startingHp: hp, attackPower: attackPwr)
        _name = name;
    }
    
    func addItemToInventory(item: String) {
        _inventory.append(item)
    }
}