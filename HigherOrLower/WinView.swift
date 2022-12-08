//
//  WinView.swift
//  HigherOrLower
//
//  Created by Chris Markiewicz on 12/7/22.
//

import SwiftUI

struct InstructionsView: View {
    var body: some View {
        ZStack {
            Color.gray.opacity(0.7).ignoresSafeArea()
            VStack {
                VStack (alignment: .leading) {
                    Text("Higher Or Lower")
                        .font(Font.custom("Arial", size: 48))
                        .colorInvert()
                        .shadow(color: .red, radius: 10)
                        .padding()
                    HStack {
                        Spacer()
                        Image("red_back")
                            .resizable()
                            .frame(width: 196)
                            .padding()
                        Spacer()
                    }
                    Text("In the game of Higher Or Lower a player has to decide if the next card is higher or lower than the card that is currently being shown.")
                        .colorInvert()
                        .padding()
                    Text("If a player selects the correct option they will be rewarded a point; otherwise the game will end.")
                        .colorInvert()
                        .padding()
                    Text("A player wins by getting through the whole deck of cards without error.")
                        .colorInvert()
                        .padding()
                    
                }
                Spacer()
            }
        }
    }
}

struct WinView_Previews: PreviewProvider {
    static var previews: some View {
        InstructionsView()
    }
}
