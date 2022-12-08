//
//  ContentView.swift
//  HigherOrLower
//
//  Created by Chris Markiewicz on 11/14/22.
//

import SwiftUI

struct ContentView: View {
    @State private var cards = Array<Card>()
    @State private var shuffledCards = Array<Card>()
    @State private var score = 0
    @State private var nextCard = Card(value: -1, name: "red_back")
    @State private var currentCard = Card(value: -1, name: "red_back")
    @State private var gameOver = true
    @State private var endReached = false
    @State private var degrees = 0.0
    var body: some View {
        NavigationView {
            ZStack {
                Color.gray.opacity(0.7).ignoresSafeArea()
                VStack {
                    Text("Higher Or Lower")
                        .font(Font.custom("Arial", size: 48))
                        .colorInvert()
                        .shadow(color: .red, radius: 10)
                        .padding()
                    NavigationLink("How To Play", destination: InstructionsView())
                        .font(Font.custom("Arial", size: 24))
                        .frame(width: 196, height: 50)
                        .buttonStyle(CustomButtonStyle())
                        .padding()
                    Text(String(score))
                        .font(Font.custom("Arial", size: 48))
                        .colorInvert()
                        .bold()
                        .padding()
                    Image(currentCard.getName())
                        .resizable()
                        .frame(width: 256, height: 391)
                        .rotation3DEffect(Angle(degrees: degrees), axis: (x: 0, y: 1, z: 0))
                    ZStack {
                        Button("Play") {
                            //List of Names
                            let names = ["2S", "2C", "2H", "2D", "3S", "3C", "3H", "3D", "4S", "4C", "4H", "4D", "5S", "5C", "5H", "5D", "6S", "6C", "6H", "6D", "7S", "7C", "7H", "7D", "8S", "8C", "8H", "8D", "9S", "9C", "9H", "9D", "10S", "10C", "10H", "10D", "11S", "11C", "11H", "11D", "12S", "12C", "12H", "12D", "13S", "13C", "13H", "13D", "14S", "14C", "14H", "14D"]
                            for name in names {
                                //create a list of Cards to store value and name
                                cards.append(Card(value: Int(name.dropLast())!, name: name))
                            }
                            shuffledCards = cards.shuffled()
                            currentCard = shuffledCards[0]
                            nextCard = shuffledCards[1]
                            gameOver = false
                            withAnimation(.easeIn(duration: 0.5)) {
                                degrees += 360
                            }
                        }
                        .opacity(gameOver == false ? 0 : 1)
                        .frame(width: 80.95, height: 50)
                        .buttonStyle(CustomButtonStyle())
                        HStack {
                            Button("Higher") { //if previous card is higher than current add a point to score; If not reset the game
                                if currentCard.compareCards(card1: nextCard) <= 0 {
                                    score+=1
                                    getNextCard()
                                    withAnimation(.easeIn(duration: 0.5)) {
                                        degrees += 360
                                    }
                                }
                                else {
                                    end()
                                }
                            }
                            .frame(width: 128, height: 50)
                            .buttonStyle(CustomButtonStyle())
                            .opacity(gameOver == true ? 0 : 1)
                            Button("Lower") { //if previous card is lower than current add a point to score; If not reset the game
                                if currentCard.compareCards(card1: nextCard) >= 0 {
                                    score+=1
                                    getNextCard()
                                    withAnimation(.easeIn(duration: 0.5)) {
                                        degrees += 360
                                    }
                                }
                                else {
                                    end()
                                }
                            }
                            .frame(width: 128, height: 50)
                            .buttonStyle(CustomButtonStyle())
                            .opacity(gameOver == true ? 0 : 1)
                        }
                    }
                }
                .alert(isPresented: $endReached, content: {
                    Alert(title: Text("You won the game!"),
                          dismissButton: .destructive(Text("Play again"),
                          action: {
                            withAnimation(Animation.default) {
                                score = 0
                                currentCard = Card(value: -1, name: "red_back")
                                nextCard = Card(value: -1, name: "red_back")
                                gameOver = true
                                endReached = false
                            }
                        }))
                    })
            }
        }
    }
    
    func end() { //end the game
        gameOver = true
        score = 0
        currentCard = Card(value: -1, name: "red_back")
        nextCard = Card(value: -1, name: "red_back")
    }
    
    func getNextCard() { //go to next card
        currentCard = nextCard
        if score < shuffledCards.count - 1 {
            nextCard = shuffledCards[score+1]
        }
        else if score == shuffledCards.count - 1 {
            endReached = true
        }
    }
    
    struct CustomButtonStyle: ButtonStyle {
        func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .font(Font.custom("Arial", size: 24))
                .padding()
                .background(.red).opacity(configuration.isPressed ? 0.0 : 1.0)
                .foregroundColor(.white)
                .clipShape(RoundedRectangle(cornerRadius: 10))
        }
    }
}

struct Card { //creates a Card object to store value and name
    var value = 0;
    var name = ""
    func getValue() -> Int {
        return value
    }
    func getName() -> String {
        return name
    }
    func compareCards(card1: Card) -> Int {
        if self.getValue() > card1.getValue() {
            return 1
        }
        else if self.getValue() < card1.getValue() {
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
