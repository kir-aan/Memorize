//
//  ContentView.swift
//  Memorize
//
//  Created by Sai Kiran Reddy B on 8/11/24.
//

import SwiftUI

struct ContentView: View {
    let emojiThemes: [String: [String]] = ["Food":["🍕","🍕","🥩","🥩","🥨","🥨","🍗","🍗"],
                                           "Sport":["🏀","🏀","🏈","🏈","⛳️","⛳️","🏓","🏓","🏏","🏏"],
                                           "Animal":["🐶","🐶","🦁","🦁","🦋","🦋","🪱","🪱","🐒","🐒","🦆","🦆"]]
    let symbolMap: [String:String] = ["Food":"fork.knife", "Sport":"sportscourt", "Animal":"pawprint"]
    @State var currentEmojis: [String] = ["🐸", "🐸", "🎲", "🎲", "⚽️", "⚽️","🔥", "🔥"]

    var body: some View {
        VStack{
            Text("Memorize!").font(.largeTitle).bold()
            ScrollView {
                cards
            }
            themeChoosers

        }
        .padding()
    }
    
    
    var themeChoosers: some View {
        HStack{
            ForEach(Array(emojiThemes.keys).sorted(), id:\.self){ key in
                Button(action: {
                    let selectedTheme = emojiThemes[key] ?? currentEmojis
                    currentEmojis = selectedTheme.shuffled()
                }, label: {
                    let symbol = symbolMap[key] ?? ""
                    VStack {
                        Image(systemName: symbol)
                            .imageScale(.large)
                        
                        Text(key)
                            .font(.caption2)
                    }
                })
            }
        }
    }

    
    var cards: some View{
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]){
            ForEach(currentEmojis.indices, id:\.self){ index in
                return cardView(selectedEmoji: currentEmojis[index])
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
