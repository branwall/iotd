//
//  Gameplay.swift
//  Island of the Drowned
//
//  Created by Brandon Wallace on 8/12/16.
//  Copyright © 2016 Made On Planes. All rights reserved.
//

import Foundation
//: Playground - noun: a place where people can play
import UIKit

enum PlayerType{
    case Pirate
    case Explorer
    case Drowned
}

enum PlayerVisibleType{
    case Pirate
    case Explorer
}

enum PlayerStatus{
    case Dead
    case Alive
    case Revealed
}

enum GameStatus{
    case Going
    case Ended
}

enum MissionStatus{
    case Success
    case Failure
    case Pending
}

class Player{
    
    var type: PlayerType
    var visible: PlayerVisibleType
    var status: PlayerStatus
    let index: Int
    
    init(type: PlayerType, visible: PlayerVisibleType, index: Int, status: PlayerStatus = .Alive){
        self.type = type
        self.visible = visible
        self.status = status
        self.index = index
    }
}

class Game{
    var playerList: [Player]
    var status: GameStatus
    init(players: [Player]){
        self.playerList = players
        self.status = .Going
    }
}


class Mission{
    var title: String
    var playerList: [Player]
    var result: MissionStatus
    
    init(title: String = "Mission", players: [Player]){
        self.title = title
        self.playerList = players
        self.result = .Pending
    }
}

func generate14() -> [Player]{
    var playerArray: [Player] = []
    for i in (0...4){
        playerArray.append(Player(type: .Pirate, visible: .Pirate, index: i, status: .Alive))
    }
    for i in (5...9){
        playerArray.append(Player(type: .Explorer, visible: .Explorer, index: i, status: .Alive))
    }
    for i in (10...11){
        playerArray.append(Player(type: .Drowned, visible: .Explorer, index: i, status: .Alive))
    }
    for i in (12...13){
        playerArray.append(Player(type: .Drowned, visible: .Pirate, index: i, status: .Alive))
    }
    return playerArray
}

extension Mission{
    
    func revealGood() -> Player? {
        var eligible: [Player] = []
        
        for player in self.playerList{
            if (player.type != .Drowned && player.status == .Alive){
                eligible.append(player)
            }
        }
        if (eligible.count <= 0){
            return nil
        } else{
            let ind = random()%eligible.count
            eligible[ind-1].status = .Revealed
            return eligible[ind-1]
        }
    }
    
    func revealBad() -> Player? {
        var eligible: [Player] = []
        
        for player in self.playerList{
            if (player.type == .Drowned && player.status == .Alive){
                eligible.append(player)
            }
        }
        if (eligible.count <= 0){
            return nil
        } else{
            let ind = random()%eligible.count
            eligible[ind].status = .Revealed
            return eligible[ind]
        }
    }
    
    func killGood() -> Player? { /* Possibly change this so that only the team's disguised gets killed*/
        var eligible: [Player] = []
        
        for player in self.playerList{
            if (player.type != .Drowned && player.status != .Dead){
                eligible.append(player)
            }
        }
        if (eligible.count <= 0){
            return nil
        } else{
            let ind = random()%eligible.count
            eligible[ind].status = .Dead
            return eligible[ind]
        }
    }
    
    func countBad() -> Int {
        var county = 0
        for p in self.playerList{
            if (p.type == .Drowned){
                county += 1
            }
        }
        return county
    }
}

func printgame(p: [Player]){
    for pl in p {
        print(pl.index, pl.status, pl.type, pl.visible)
    }
}

let players = generate14()

/*Game flow:
 
 14 players (5 pirates, 5 explorers, 2 disguised pirates, 2 disguised explorers)
 
 7 missions
 1 - 3 players (gather food) (living members: 14) (max class dead 0)
 2 - 3 players (Gather wood) (living members: 13-14) (max class dead 1)
 3 - 6 players (Fashion tools) (living members: 12-14)(max class dead 2)
 4 - 3 players each class (Create mast / Create Hull) (living members: 11-14) (max class dead 3)
 5 - 3 players (devise government) (living members: 9-14) (max class dead 4)
 6 - 2 players each class (sand wood) (living members: 9-14) (max class dead 4)
 7 - 4 players (join parts) (living members: 7-14) (max class dead 5)
 
 Remaining 6-14 players.
 Then, the boat is filled. Dictactor/Elected leader cannot get on the boat.
 4 spots filled by decided means of election, the last spot (stowaway) is filled by (fate, if not chosen//democracy, if fate chosen)
 
 if two drowned are on the ship, it capsizes. Therefore, drowned's goal is to gain trust by not killing, but kill when strategic. Drowned also win if they compromise 3 missions (4?)
 
 */

/*printgame(players)

let m1 = Mission(players: [players[13],players[1],players[12]])
if (m1.killGood() != nil){ /* If all bad are on a mission, the lack of death won't be suspicious*/
    m1.revealBad()
}

let m2 = Mission(players: [players[13], players[8], players[3]])
m2.revealGood()

let m3 = Mission(players: [players[13],players[8],players[3],players[5],players[10],players[9]])
m3.countBad()

m3.revealBad()
m3.killGood()


let x = random()%15
let y = random()%14*/

