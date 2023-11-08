//
//  ContentView.swift
//  Lab3
//  Parner4
//  Norika Matsuyama, Jesse Burden
//  11/04/2023
//
// CatMemoryGame.swift
// View Model

import SwiftUI

class CatMemoryGame: ObservableObject {
    
    @Published private var model: MemoryGame = CreateMemoryGame()
    
    static func CreateMemoryGame() -> MemoryGame{
        return MemoryGame(numberOfPairsOfCards: 6, contentFactory: makeContent)
    }
    
    static func makeContent(index: Int) -> String{
        let images = ["cat1", "cat2", "cat3", "cat4", "cat5", "cat6", "cat7", "cat8", "cat9",
        ]
        return images[index]
    }
    
    var cards: Array<MemoryGame.Card> {
        return model.cards
    }
    
    var pairs: Int{
        model.numberOfPairs
    }
    
    func choose(card: MemoryGame.Card){
        model.chooseCard(card: card)
    }
    

}
