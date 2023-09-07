//
//  MukChiBbaGame.swift
//  mukjjibba
//
//  Created by Lee minyeol on 2023/09/06.
//

import Foundation

struct MukJjiBbaGame {
    
    mutating func compareUserPickAndComputerPick(_ userChoice: MukJjiBbaChoice, _ computerChoice: MukJjiBbaChoice) {
        switch (userChoice, computerChoice) {
        case (.muk,.bba), (.jji,.muk), (.bba,.jji):
            turn = "컴퓨터"
            print("\(turn)의 턴입니다.")
            playMukChiBbaGame()
        case (.muk,.jji), (.jji,.bba), (.bba,.muk):
            turn = "사용자"
            print("\(turn)의 턴입니다.")
            playMukChiBbaGame()
        default:
            print("\(turn)의 승리!")
        }
    }
    
    mutating func selectMenu() -> MukJjiBbaChoice? {
        while true {
            print("[\(turn)턴]묵(1), 찌(2), 빠(3)! :", terminator: " ")
            guard let input = readLine(), let userChoice = MukJjiBbaChoice(rawValue: Int(input) ?? -1) else {
                print("잘못된 입력입니다. 컴퓨터의 턴으로 넘깁니다.")
                let computerChoice = MukJjiBbaChoice(rawValue: getRandomNumber()) ?? .muk
                turn = "컴퓨터"
                return selectMenu()
            }
            return userChoice
        }
    }
    
    mutating func playMukChiBbaGame() {
        let isRunning = true
        
        while isRunning {
            let computerChoice = MukJjiBbaChoice(rawValue: getRandomNumber()) ?? .muk
            if let userChoice = selectMenu() {
                if userChoice == .quit {
                    print("게임종료")
                    break
                }
                let result = compareUserPickAndComputerPick(userChoice, computerChoice)
                break
            }
        }
    }
}
