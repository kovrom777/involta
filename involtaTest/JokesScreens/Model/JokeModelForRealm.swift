//
//  JokeModelForRealm.swift
//  involtaTest
//
//  Created by Роман Ковайкин on 12.03.2021.
//

import Foundation
import RealmSwift

class JokeModelForRealm: Object{
    
    @objc dynamic var id: Int = 0
    @objc dynamic var type: String = ""
    @objc dynamic var setup: String = ""
    @objc dynamic var punchline: String = ""
    
    convenience init(id: Int, type: String, setup: String, punchline: String) {
        self.init()
        self.id = id
        self.type = type
        self.setup = setup
        self.punchline = punchline
    }
    
}
