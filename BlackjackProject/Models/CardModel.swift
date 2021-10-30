//
//  CardModel.swift
//  BlackjackProject
//
//  Created by Yann Christophe Maertens on 19/06/2021.
//

import Foundation

struct Card: Codable, Hashable {
    let image: String
    var value: Int
}

extension Card {
    
    // Get information from the "CardData" json.
    static var data: [Card] {
        if
            let url = Bundle.main.url(forResource: "CardData", withExtension: "json"),
            let data = try? Data(contentsOf: url),
            let decodedData =  try? JSONDecoder().decode([Card].self, from: data) {
            return decodedData
        }
        return []
    }
    
    // Example for previews purpose
    static let example = Card(image: "AH", value: 11)
}
