//
//  ContentView.swift
//  Memorize
//
//  Created by Sai Kiran Reddy B on 7/21/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack{
            CardView(isFaceUp: true)
            CardView()
            CardView()
            CardView()
        }
        .foregroundColor(.green)
        .padding()
        
    }
}

struct CardView: View {
    var isFaceUp: Bool = false
    
    var body: some View {
        ZStack {
            if isFaceUp{
                RoundedRectangle(cornerRadius: 15)
                    .foregroundColor(.white)
                RoundedRectangle(cornerRadius: 15)
                    .strokeBorder(lineWidth: 5)
                Text("🚙")
                    .font(.largeTitle)
            } else {
                RoundedRectangle(cornerRadius: 15)
            }
        }
    }
}

#Preview {
    ContentView()
}
