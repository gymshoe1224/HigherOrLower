//
//  ContentView.swift
//  HigherOrLower
//
//  Created by Chris Markiewicz on 11/14/22.
//

import SwiftUI

struct ContentView: View {
    @State private var cards = Dictionary<Int, String>()
    @State private var shuffledCards = [Int]()
    @State private var score = 0
    @State private var currentCard = "red_back"
    var body: some View {
        ZStack {
            VStack {
                Text("Higher Or Lower")
                    .padding()
                    .font(.largeTitle)
                Image("\(currentCard)")
                    .resizable()
                    .frame(width: 256, height: 391)
                Button("Play"){
                    if let files = try? FileManager.default.contentsOfDirectory(atPath: "/Users/cmarkiewicz/Desktop/HigherOrLower/HigherOrLower/Assets.xcassets/PNG") {
                        for var file in 0..<files.count {
                            if files[file] == ".DS_Store" {
                                file -= 1
                            }
                            else {
                                cards[file] = files[file]
                            }
                         }
                        print(cards.values)
                     }
                    
                    shuffledCards = cards.keys.shuffled()
                   var nextCard = shuffledCards.makeIterator()
                    currentCard = String(cards[nextCard.next()!]!.dropLast(9))
                }
                Button("Higher"){
                    print("Hello")
                }
                Button("Lower"){
                    
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
