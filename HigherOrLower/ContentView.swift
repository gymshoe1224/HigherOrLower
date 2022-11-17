//
//  ContentView.swift
//  HigherOrLower
//
//  Created by Chris Markiewicz on 11/14/22.
//

import SwiftUI

struct ContentView: View {
    @State private var cards = Array<Card>()
    @State private var shuffledCards = Array<String>()
    @State private var values = Array<Int>()
    @State private var score = 0
    @State private var currentCard = "red_back"
    @State private var previousCard = ""
    @State private var gameOver = false
    var body: some View {
        ZStack {
            Color.gray.opacity(0.7)
            VStack{
                Text("Higher Or Lower")
                    .padding()
                    .font(.largeTitle)
                Image("\(currentCard)")
                    .resizable()
                    .frame(width: 256, height: 391)
                Text("Score: \(score)")
                Button("Play"){
                    let names = ["2S", "2C", "2H", "2D", "3S", "3C", "3H", "3D", "4S", "4C", "4H", "4D", "5S", "5C", "5H", "5D", "6S", "6C", "6H", "6D", "7S", "7C", "7H", "7D", "8S", "8C", "8H", "8D", "9S", "9C", "9H", "9D", "10S", "10C", "10H", "10D", "11S", "11C", "11H", "11D", "12S", "12C", "12H", "12D", "13S", "13C", "13H", "13D", "14S", "14C", "14H", "14D"]
                    for name in names {
                        cards.append(Card(value: Int(name.dropLast())!, name: name))
                    }
                    
                }
                Button("Higher"){
                    if previousCard <= currentCard {
                        score += 1
                    }
                    else {
                        end()
                    }
                }
                Button("Lower"){
                    if previousCard >= currentCard {
                        score += 1
                    }
                    else {
                        end()
                    }
                }
            }
            if gameOver {
                Color.white.opacity(0.5)
            }
        }
    }
    func end() {
        score = 0
    }
    func getValues(cards: Array<Card>) -> Array<Int> {
        var values = Array<Int>()
        for card in 0..<cards.count {
            values.append(cards[card].getValue())
        }
        return values
    }
}
struct Card {
    var value = 0;
    var name = ""
    func getValue() -> Int {
        return value
    }
    func getName() -> String {
        return name
    }
    func compareCards(card0: Card, card1: Card) -> Int {
        if card0.getValue() > card1.getValue() {
            return 1
        }
        else if card0.getValue() < card1.getValue() {
            return -1
        }
        else {
            return 0
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
