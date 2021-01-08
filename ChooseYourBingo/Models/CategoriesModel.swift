//
//  CategoriesModel.swift
//  ChooseYourBingo
//
//  Created by Jesse Anderson on 6/28/20.
//

import Foundation

class Category: ObservableObject, Identifiable {
    let id = UUID()
    @Published var categories = [BingoItemElement]()
    
    init() {
        loadBingoGame()
    }
    
    func loadBingoGame() {
        categories = Bundle.main.decode("BingoInfo.json")
    }

}

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let bingoItem = try? newJSONDecoder().decode(BingoItem.self, from: jsonData)


// MARK: - BingoItemElement
struct BingoItemElement: Identifiable, Codable {
    let id: Int
    let category: String
    let bingoItems: [BingoButton]
}

typealias BingoItem = [BingoItemElement]


