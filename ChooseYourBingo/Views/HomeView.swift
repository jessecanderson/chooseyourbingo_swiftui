//
//  HomeView.swift
//  ChooseYourBingo
//
//  Created by Jesse Anderson on 6/28/20.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var categories = Category()
    @State private var multiplayer = false
    
    let columns = [
        GridItem(.flexible(minimum: 100, maximum: 100)),
        GridItem(.flexible(minimum: 100, maximum: 100)),
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Select Your Category")
                    .font(.title)
                    .padding()
                if categories.categories.isEmpty {
                    Text("Loading animation will go here")
                } else {
                    ScrollView(.vertical) {
                        LazyVGrid(columns: columns, spacing: 20) {
                            ForEach(categories.categories) { item in
                                NavigationLink(destination: GameBoardView(gameBoard: item)) {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 20, style: .continuous)
                                            .foregroundColor(.white)
                                        Text(item.category)
                                    }
                                    .shadow(radius: 10)
                                    .frame(width: 100, height: 100)
                                    .padding()
                                    .multilineTextAlignment(.center)
                                }
                            }
                        }
                    }
                }
                Spacer()
                // Toggle("Multiplayer", isOn: $multiplayer)
            }
            .padding(.top, 20)
            .padding()
            .navigationTitle(Text("Choose Your Bingo"))
        }
        .sheet(isPresented: $multiplayer){
            Text("Add Multiplayer methods here.")
            Button("Cancel", action: {
                multiplayer = false
            })
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
