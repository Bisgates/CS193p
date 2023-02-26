//
//  ContentView.swift
//  Memorize
//
//  Created by Han on 2023/2/24.
//

import SwiftUI

struct ContentView: View {
    @State var vehicleEmojis = ["🚗", "🚕", "🚙", "🚌", "🚎", "🏎", "🚓", "🚑", "🚒", "🚐", "🚚", "🚛", "🚜", "🛴", "🚲", "🛵", "🏍", "🛺", "🚍", "🚘", "🚖", "🛻", "🚔", "🚂"]
    @State var animalEmojis = ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🐨", "🐯", "🦁", "🐮", "🐷", "🐸", "🐵", "🦄", "🐴", "🦓", "🦌", "🐺", "🦥", "🦦", "🦩", "🐗"]
    @State var foodEmojis = ["🍔", "🍟", "🌭", "🍕", "🍱", "🍜", "🍝", "🥟", "🥙", "🌮", "🌯", "🥪", "🍗", "🍖", "🍣", "🍤", "🍦", "🍩", "🍪", "🎂", "🍰", "🍫", "🍬", "🍭"]

    @State var emojiCount = 12
    @State var emojis = ["🍔", "🍟", "🌭", "🍕", "🍱", "🍜", "🍝", "🥟", "🥙", "🌮", "🌯", "🥪", "🍗", "🍖", "🍣", "🍤", "🍦", "🍩", "🍪", "🎂", "🍰", "🍫", "🍬", "🍭"]
    

    var body: some View {
        NavigationView {
            VStack {
                ScrollView{
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 75))]) {
                        ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                            CardView(content: emoji)
                        }
                        .aspectRatio(2/3, contentMode: .fit)
                    }
                }
                .foregroundColor(.red)
                Spacer()
                HStack{
                    vehicleTheme
                        .frame(maxWidth: .infinity)
                    foodTheme
                        .frame(maxWidth: .infinity)
                    animalTheme
                        .frame(maxWidth: .infinity)
                }
                .font(.largeTitle)
                .padding(.horizontal)
            }
            .padding(.horizontal)
            .navigationBarTitle("Memorize")
            .navigationBarTitleDisplayMode(.inline)
        }
        
    }
        var vehicleTheme: some View {
            Button {
                emojis = vehicleEmojis.shuffled()
            } label: {
                VStack{
                    Image(systemName: "car.side")
                    Text("Vehicles").font(.caption)
                }
            }
        }
        
        var foodTheme: some View{
            Button {
                emojis = foodEmojis.shuffled()
            } label: {
                VStack{
                    Image(systemName: "cup.and.saucer")
                    Text("Food").font(.caption)
                }
            }
        }
        var animalTheme: some View{
            Button {
                emojis = animalEmojis.shuffled()
            } label: {
                VStack{
                    Image(systemName: "pawprint")
                    Text("Animal").font(.caption)
                }
            }
        }
}


struct CardView: View {
    @State var isFaceUp: Bool = true
    var content: String
    
    var body: some View{
        ZStack{
            let shape = RoundedRectangle(cornerRadius: 12)
            if isFaceUp{
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth:3)
                Text(content).font(.largeTitle)
                    .foregroundColor(.orange)
            }
            else{
                shape.fill().foregroundColor(Color(red: 0.005, green: 0.669, blue: 0.999))

            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}






































struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
