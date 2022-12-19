//
//  ContentView.swift
//  Memorize
//
//  Created by 陈敏 on 12/18/22.
//

import SwiftUI

struct ContentView: View {
    var emojis = ["🚖","🚝","🚆","✈️","🚲","🛵","🛻","🛳","🛴","🚚","🚉","⌚️","📱","📲","💻","⌨️","🖨","💾","💿","🎥","📽","🎞","📞","☎️","🕰","⏰","📡","⏳"]
    @State var emojiCount = 18
    var body: some View {
        VStack{
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 105))]) {
                    ForEach(emojis[0..<emojiCount], id: \.self, content: {emoji in CardView(content: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                        })
                }
            }
            Spacer()
            HStack {
                remove
                Spacer()
                add
            }
            .font(.largeTitle)
            .padding(.horizontal)
            .foregroundColor(.blue)
        }
        .padding(.horizontal)
        .foregroundColor(/*@START_MENU_TOKEN@*/.red/*@END_MENU_TOKEN@*/)//default color
    }
    var remove: some View {
        Button {
            if emojiCount > 1 {
                emojiCount -= 1
            }
        } label: {
            Image(systemName: "minus.circle")
        }
    }
    var add: some View {
        Button(action: {
            emojiCount += 1
        }, label: {
            Image(systemName: "plus.circle")
            
        })
        
    }
    
}



struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = false
        
    var body: some View {
        ZStack {
            let shape =                 RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content)
                    .font(.largeTitle)
            } else {
                shape.fill()
            }
        }.onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
.previewInterfaceOrientation(.portraitUpsideDown)
            
    }
}
