//
//  ContentView.swift
//  ChooseYourBingo
//
//  Created by Jesse Anderson on 6/28/20.
//

import SwiftUI

struct GameBoardView: View {
    @Environment(\.presentationMode) var presentationMode
    let gameManager = BingoGameManager()
    var gameBoard: BingoItemElement
    
    @State private var boardItems = [BingoButton]()
    @State private var hasWon = false
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        VStack {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(boardItems) { item in
                    ZStack {
                        RoundedRectangle(cornerRadius: 20, style: .continuous)
                            .foregroundColor(item.isTapped ? .black : .white)
                            .rotation3DEffect(item.isTapped ? Angle(degrees: 180): Angle(degrees: 0), axis: (x: CGFloat(0), y: CGFloat(10), z: CGFloat(0)))
                            .animation(.default)
                            .shadow(radius: 5)
                        
                        if !item.isTapped {
                            Text(item.title)
                                .font(.subheadline)
                                .lineLimit(nil)
                        } else {
                            Text(item.title)
                                .font(.subheadline)
                                .foregroundColor(.white)
                                .lineLimit(nil)
                                .opacity(0.4)
                                .transition((AnyTransition.opacity.animation(.easeInOut(duration: 1.0))))
                        }
                    }
                        .multilineTextAlignment(.center)
                        .frame(width: 75, height: 75)
                            .onTapGesture {
                                updateBingo(item: item)
                            }
                }
            }
            .padding()
        }
        .navigationBarTitle(Text(gameBoard.category), displayMode: .inline)
        .onAppear {
            setupBoard()
        }
        .alert(isPresented: $hasWon) {
            Alert(title: Text("You Won"), message: Text("Well, you did it"), dismissButton: .default(Text("OK")) {
                presentationMode.wrappedValue.dismiss()
            })
        }
    }
    
    func setupBoard() {
        if !gameBoard.bingoItems.isEmpty {
            boardItems = gameManager.createGameBoard(from: gameBoard.bingoItems)
        }
    }
    
    func updateBingo(item: BingoButton) {
        let index = boardItems.firstIndex(where: {$0.id == item.id})
        boardItems[index ?? 0].isTapped.toggle()
        if !boardItems[index ?? 0].isTapped {
            boardItems[index ?? 0].cellNumber = index ?? 0
        } else {
            boardItems[index ?? 0].cellNumber = 42
        }
        checkAnswer()
    }
    
    func checkAnswer() {
        hasWon = gameManager.checkingForAnswers(from: boardItems.map { $0.cellNumber })
    }
}

struct GameBoardView_Previews: PreviewProvider {
    static var previews: some View {
        GameBoardView(gameBoard: Category().categories[3])
    }
}
