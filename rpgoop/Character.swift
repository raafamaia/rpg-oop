//
//  Character.swift
//  rpgoop
//
//  Created by R. Maia on 5/18/16.
//  Copyright © 2016 RM. All rights reserved.
//

import Foundation

class Character {
    private var _hp: Int = 100
    private var _attackPwr = 10
    
    var attackPwr: Int {
        get {
            return _attackPwr
        }
    }
    
    var hp: Int {
        get {
            return _hp
        }
    }
    
    var isAlive: Bool {
        get {
            if hp <= 0 {
                return false
            } else {
                return true
            }
        }
    }
    
    init(startingHp: Int, attackPower: Int) {
        self._hp = startingHp
        self._attackPwr = attackPower
    }
    
    func attemptAttack(attackPwr: Int) -> Bool {
        self._hp -= attackPwr
        return true
    }
    
    
}