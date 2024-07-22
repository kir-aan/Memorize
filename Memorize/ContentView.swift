//
//  ContentView.swift
//  Memorize
//
//  Created by Sai Kiran Reddy B on 7/21/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            HStack{
                CardView(isFaceUp: true)
                CardView()
                CardView()
            }
            HStack{
                CardView()
                CardView()
                CardView()
            }
            HStack{
                CardView()
                CardView(isFaceUp: true)
                CardView()
            }
        }
        .foregroundColor(.green)
        .padding()
        
    }
}

struct CardView: View {
    @State var isFaceUp = false

    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 15)
            if isFaceUp{
                base.foregroundColor(.white)
                base.strokeBorder(lineWidth: 5)
                Text("🚙")
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
