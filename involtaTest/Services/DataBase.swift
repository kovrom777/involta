//
//  DataBase.swift
//  involtaTest
//
//  Created by Роман Ковайкин on 12.03.2021.
//

import Foundation
import RealmSwift

class DataBase{
    
    let realm = try! Realm()
    
    func witeData(data: JokeModelForRealm){
        try! realm.write{
            realm.add(data)
        }
    }
    
    func readData() -> [JokeModelForRealm]{
        
        let _result = try! realm.objects(JokeModelForRealm.self)
        return Array(_result)
        
    }
    
    func clearAllData(){
        try! realm.write({
            realm.deleteAll()
        })
        
    }
}
