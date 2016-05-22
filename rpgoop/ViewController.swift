//
//  ViewController.swift
//  rpgoop
//
//  Created by R. Maia on 5/18/16.
//  Copyright © 2016 RM. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var printLbl: UILabel!
    @IBOutlet weak var playerHpLbl: UILabel!
    @IBOutlet weak var EnemyHpLbl: UILabel!
    @IBOutlet weak var enemyImg: UIImageView!
    @IBOutlet weak var chectBtn: UIButton!
    
    var player: Player!
    var enemy: Enemy!
    var chestMessage: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        player = Player(name: "DirtyLaundry21", hp: 110, attackPwr: 20)
        generateRandomEnemy()
        playerHpLbl.text = "\(player.hp) HP"
        
        
    }
    
    func generateRandomEnemy() {
        let rand = Int(arc4random_uniform(UInt32(2)))
        
        if rand == 0 {
            enemy = Kimara(startingHp: 50, attackPower: 12)
        } else {
            enemy = DevilWizard(startingHp: 60, attackPower: 15)
        }
        
        enemyImg.hidden = false
        EnemyHpLbl.text = "\(enemy.hp) HP"
    }
    
    

    @IBAction func onChestTapped(sender: AnyObject) {
        chectBtn.hidden = true
        printLbl.text = chestMessage
        
        NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: #selector(ViewController.generateRandomEnemy), userInfo: nil, repeats: false)
        
    }

    @IBAction func onAttackTapped(sender: AnyObject) {
        if enemy.attemptAttack(player.attackPwr) {
            printLbl.text = "Attacked \(enemy.type) for \(player.attackPwr) HP"
            EnemyHpLbl.text = "\(enemy.hp) HP"
        } else {
            printLbl.text = "Attacked was unsuccessful!"
        }
        
        if let loot = enemy.dropLoot() {
            player.addItemToInventory(loot)
            
            chestMessage = "\(player.name) found \(loot)"
            chectBtn.hidden = false
        }
        
        if !enemy.isAlive {
            EnemyHpLbl.text = ""
            printLbl.text = "Killed \(enemy.type)"
            enemyImg.hidden = true
        }
    }
    
    
}

