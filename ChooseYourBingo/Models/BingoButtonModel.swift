//
//  BingoButtonModel.swift
//  ChooseYourBingo
//
//  Created by Jesse Anderson on 6/28/20.
//

import Foundation
import SwiftUI

struct BingoButton: Identifiable, Codable {
    let id = UUID()
    let title: String
    var cellNumber = 42
    var isTapped = false
    var backgroundColor = Color.white
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case isTapped
        case backgroundColor
    }
    
    init(title: String) {
        self.title = title
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        // id = try container.decode(Int.self, forKey: .id)
        title = try container.decode(String.self, forKey: .title)
        
        
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(title, forKey: .title)
    }
}


