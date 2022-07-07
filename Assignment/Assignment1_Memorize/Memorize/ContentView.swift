//
//  ContentView.swift
//  Memorize
//
//  Created by AvA on 2022/7/5.
//

import SwiftUI


struct ContentView: View {
    @State var emojis = ["🚗","🚕","🚌","🚎","🏎","🚓","🚑","🚒","🚐","🛻"]
    
    var body: some View {
        VStack{
            Text("Memorize!").font(.largeTitle) //This is for task 3
            Spacer()
            ScrollView{
                LazyVGrid(columns: [GridItem(),GridItem(),GridItem(),GridItem()]) {
                    ForEach(emojis, id: \.self) { emoji in
                        Card(content: emoji).aspectRatio(2/3,contentMode: .fit)
                    }

                }.foregroundColor(.red)
            }
            Spacer()
            HStack{ //This is for task 4. Add at least 3 “theme choosing” buttons to your UI, each of which causes all of the cards to be replaced with new cards that contain emoji that match the chosen theme.
                Button {
                    emojis = ["🚗","🚕","🚌","🚎","🏎","🚓","🚑","🚒","🚐","🛻"]
                    emojis.shuffle()    //This is for task 6, making the emojis to be random order.
                } label: {
                    VStack{ //This is for task 7, each button must have a picture and some words.
                        Image(systemName: "car").font(.largeTitle)
                        Text("Vehicles").font(.body) //This is for task 9,test must be smaller than image.
                    }
                }
                
                Spacer()
                
                Button {
                    emojis = ["🇺🇸","🇮🇪","🇺🇳","🇸🇪","🇳🇴","🇨🇳","🇬🇧","🇦🇺","🇯🇵"]
                    emojis.shuffle()
                } label: {
                    VStack{
                        Image(systemName: "flag").font(.largeTitle)
                        Text("Flags").font(.body)
                    }
                }
                
                Spacer()
                
                Button {
                    emojis = ["⚽️","🏀","🏈","⚾️","🥎","🎾","🏐","🏉"]
                    emojis.shuffle()
                } label: {
                    VStack{
                        Image(systemName: "figure.walk").font(.largeTitle)
                        Text("Sports").font(.body)
                    }
                }.padding(.horizontal)

            }
        }.padding(.horizontal)
    }
}


struct Card: View {
    @State var isFaceUp: Bool = true
    var content: String
    
    var body: some View {
        ZStack{
            let shape = RoundedRectangle(cornerRadius: 20)
        
            if(isFaceUp){
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 4)
                Text(content).font(.largeTitle)
            }
            else{
                shape.fill()
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
            .preferredColorScheme(.dark)
            .previewDevice("iPhone 12 mini") //This is for task 10
        ContentView()
            .previewDevice("iPhone SE (3rd generation)")
        
    }
}
