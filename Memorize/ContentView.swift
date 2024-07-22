//
//  ContentView.swift
//  Memorize
//
//  Created by Sai Kiran Reddy B on 7/21/24.
//

import SwiftUI

struct ContentView: View {
    let emojis = ["🚙","😎","🚙","😎"]
    var body: some View {
            HStack{
                ForEach(emojis.indices, id:\.self) { index in
                    CardView(content: emojis[index])
                }
            }

    
        .foregroundColor(.green)
        .padding()
        
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp = false

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
