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
                    .onTapGesture {
                        if currentCard == "red_back" {
                            addCards()
                            
                        }
                    }
                Button("Reset") {
                    shuffledCards = cards.keys.shuffled()
                }
            }
        }
    }
    func addCards()
    {
        if  let directory = Bundle.main.path(forResource: "PNG", ofType: ""),
             let files = try? FileManager.default.contentsOfDirectory(atPath: directory) {
             for file in files {
                 var i = 0
                 cards[i] = file
                 i+=1
             }
         }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
