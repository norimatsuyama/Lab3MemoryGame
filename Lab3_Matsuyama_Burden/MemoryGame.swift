//
//  ContentView.swift
//  Lab3
//  Parner4
//  Norika Matsuyama, Jesse Burden
//  11/04/2023
//
// MemoryGame.swift
// Model

import Foundation

struct MemoryGame {
    
    private(set) var cards: Array<Card>
    private(set) var numberOfPairs: Int
    
    struct Card: Identifiable, Hashable{
        var content: String
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var id: Int
        var animationAmount: Double = 0.0
        
    }
    
    mutating func chooseCard(card: Card){
        for index in cards.indices{
            if cards[index].id == card.id{
                cards[index].isFaceUp.toggle()
            }
        }
    }
    
    
    
    init(numberOfPairsOfCards: Int, contentFactory: (Int) -> String) {
        cards = []
        numberOfPairs = numberOfPairsOfCards
        
        for index in 0..<numberOfPairsOfCards{
            let content = contentFactory(index)
            cards.append(Card(content: content, id: index * 2))
            cards.append(Card(content: content, id: index * 2 + 1))
        }
        cards.shuffle()
    }
    
}
