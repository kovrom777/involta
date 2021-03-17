//
//  OneJokeModel.swift
//  involtaTest
//
//  Created by Роман Ковайкин on 12.03.2021.
//

import Foundation
import RealmSwift

class JokeModel: Decodable{
    let id: Int
    let type: String
    let setup: String
    let punchline: String
    
    init(id: Int, type: String, setup: String, punchline: String) {
        self.id = id
        self.type = type
        self.setup = setup
        self.punchline = punchline
    }
    
    enum CodingKeys: CodingKey{
        case id
        case type
        case setup
        case punchline
    }
    
    
    
}
