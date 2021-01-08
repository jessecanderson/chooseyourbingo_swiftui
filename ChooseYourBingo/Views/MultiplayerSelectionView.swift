//
//  MultiplayerSelectionView.swift
//  ChooseYourBingo
//
//  Created by Jesse Anderson on 6/28/20.
//

import SwiftUI

struct MultiplayerSelectionView: View {
    var selectedCategory: BingoItemElement
    
    var body: some View {
        VStack {
            NavigationLink(destination: GameBoardView(gameBoard: selectedCategory)) {
                Text("Single Player")
            }
                .padding()
            NavigationLink(destination: GameBoardView(gameBoard: selectedCategory)) {
                Text("Multiplayer")
            }
                .padding()
            
        }
            .onAppear {
                print(selectedCategory.id)
            }
    }
}

struct MultiplayerSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        MultiplayerSelectionView(selectedCategory: BingoItemElement(id: 1, category: "testing", bingoItems: [BingoButton(title: "Testing")]))
    }
}
