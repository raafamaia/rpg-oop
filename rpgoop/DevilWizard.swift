//
//  DevilWizard.swift
//  rpgoop
//
//  Created by R. Maia on 5/18/16.
//  Copyright © 2016 RM. All rights reserved.
//

import Foundation

class DevilWizard: Enemy {
    override var loot: [String] {
        return ["Magic Wand", "Dark Amulet", "Salted Pork"]
    }
    
    override var type: String {
        return "Devil Wizard"
    }
}