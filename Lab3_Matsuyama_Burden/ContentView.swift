//
//  Lab3
//  Parner4
//  Norika Matsuyama, Jesse Burden
//  11/04/2023
//
//  ContentView.swift
// ContentView


import SwiftUI


struct ContentView: View {
    @ObservedObject var viewModel: CatMemoryGame
    
    var gridItems = [GridItem(.flexible()),
                     GridItem(.flexible()),
                     GridItem(.flexible())
    ]
    var body: some View{
        
        VStack{
            Text("Cat Memory Game")
                .font(.title)
            
            LazyVGrid(columns: gridItems, spacing: 5) {
                ForEach(viewModel.cards){ card in
                    CatContent(card: card, viewModel: viewModel)
                }
            }.padding(50)
                .background(Color(red: 0.98, green: 0.937, blue: 0.89))
        }
    }
    
    struct CatContent: View {
        var card: MemoryGame.Card
        var viewModel: CatMemoryGame

        var body: some View {
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.yellow)
                    .opacity(card.isFaceUp ? 0 : 1)
                
                Image(card.content)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100.0)
                    .opacity(card.isFaceUp ? 1 : 0)
            }
            .onTapGesture {
                withAnimation(.spring(response: 1, dampingFraction: 0.6)){
            viewModel.choose(card: card)
            }
        }
            .rotation3DEffect(Angle.degrees(card.isFaceUp ? 0 : 180),
                              axis: (x: 0, y: 1, z: 0))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: CatMemoryGame())
        
    }
}
