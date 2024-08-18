//
//  ContentView.swift
//  Memorize
//
//  Created by Sai Kiran Reddy B on 8/11/24.
//

import SwiftUI

struct ContentView: View {
    let emojiThemes: [String: [String]] = ["Food":["🍕","🥩","🥨","🍗","🥩","🍗","🥨","🍕"],
                                           "Sport":["🏀","🏈","⛳️","🏓","🏏","🏈","🏓","🏀","🏏","⛳️"],
                                           "Animal":["🐶","🦁","🦋","🐶","🪱","🐒","🦆","🦁","🐒","🦋","🦆","🪱"]]
    let symbolMap: [String:String] = ["Food":"fork.knife", "Sport":"sportscourt", "Animal":"pawprint"]
    @State var currentEmojis: [String] = ["🐸", "🎲", "⚽️","🔥", "🔥","⚽️", "🎲", "🐸"]
    @State var cardCount: Int = 3
    var body: some View {
        VStack{
            Text("Memorize!").font(.largeTitle).bold()
            ScrollView {
                cards
            }
            bottomActionBar

        }
        .padding()
    }
    
    
    var themeChoosers: some View {
        HStack{
            ForEach(Array(emojiThemes.keys).sorted(), id:\.self){ key in
                Button(action: {
                    let selectedTheme = emojiThemes[key] ?? currentEmojis
                    if(cardCount > selectedTheme.count){
                        cardCount = 3
                    }
                    currentEmojis = selectedTheme.shuffled()
                }, label: {
                    VStack {
                        let symbol = symbolMap[key] ?? ""
                        Image(systemName: symbol)
                        Text(key)
                    }
                })
                //.buttonStyle(.borderedProminent)
            }
        }
    }
    
    var bottomActionBar: some View {
        HStack {
            cardRemover
            Spacer()
            themeChoosers
            Spacer()
            cardAdder
        }
        .imageScale(.large)
    }
    
    func cardAdjuster(by offset: Int, symbol: String) -> some View {
        Button(action: {
            cardCount += offset
        }, label: {
            Image(systemName: symbol)
        })
        .disabled(cardCount+offset<1 || cardCount+offset>currentEmojis.count)
    }
    
    var cardRemover: some View{
        cardAdjuster(by: -1, symbol: "rectangle.stack.fill.badge.minus")
    }
    
    var cardAdder: some View{
        cardAdjuster(by: 1, symbol: "rectangle.stack.fill.badge.plus")
    }
    
    var cards: some View{
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 130))]){
            ForEach(0..<cardCount, id:\.self){ index in
                cardView(selectedEmoji: currentEmojis[index])
                    .aspectRatio(2/3,contentMode: .fit)
            }
        }
        .foregroundColor(.blue)

    }
}

struct cardView: View {
    @State var isFaceUp: Bool = true
    let selectedEmoji: String
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 15)
            Group{
                base.foregroundColor(.white)
                base.strokeBorder(lineWidth: 3)
                Text(selectedEmoji).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1)
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}
