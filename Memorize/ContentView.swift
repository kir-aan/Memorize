//
//  ContentView.swift
//  Memorize
//
//  Created by Sai Kiran Reddy B on 7/21/24.
//

import SwiftUI

struct ContentView: View {
    let emojis = ["🚙","😎","👂🏻","🕷️","💍","🐸","🔥","⚽️"]
    @State var cardCount: Int = 3
    var body: some View {
        VStack{
            cards
            cardCountAdjusters
        }
        .padding()
    }
    
    var cardCountAdjusters: some View{
        HStack{
            cardRemover
            Spacer()
            cardAdder
        }.imageScale(.large)
    }
    
    var cards: some View {
        HStack{
            ForEach(0..<cardCount, id:\.self) { index in
                CardView(content: emojis[index])
            }
        }.foregroundColor(.green)
    }
    var cardRemover: some View {
        Button(action: {
            cardCount -= 1
        }, label: {
            Image(systemName: "rectangle.stack.badge.minus")
        })
    }
    
    var cardAdder: some View {
        Button(action: {
            cardCount += 1
        }, label: {
            Image(systemName: "rectangle.stack.badge.plus")
        })
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp = true

    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 15)
            if isFaceUp{
                base.foregroundColor(.white)
                base.strokeBorder(lineWidth: 5)
                Text(content)
                    .font(.largeTitle)
            } else {
                RoundedRectangle(cornerRadius: 15)
            }
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}
