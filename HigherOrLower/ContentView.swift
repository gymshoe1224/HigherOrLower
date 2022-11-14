//
//  ContentView.swift
//  HigherOrLower
//
//  Created by Chris Markiewicz on 11/14/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Higher Or Lower")
                .padding()
                .font(.largeTitle)
            Image("red_back")
                .resizable()
                .frame(width: 256, height: 391)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
