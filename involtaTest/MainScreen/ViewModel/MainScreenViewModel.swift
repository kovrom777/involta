//
//  MainScreenViewModel.swift
//  involtaTest
//
//  Created by Роман Ковайкин on 12.03.2021.
//

import Foundation

class MainScreenViewModel{
    
    func fetchExampleImage(complition: @escaping (_ data: Data)->()){
        guard let url = URL(string: MainScreenModel.randomUrlArray[Int.random(in: 0..<MainScreenModel.randomUrlArray.count)]) else {
            return
        }
        
        let queue = DispatchQueue.global(qos: .userInitiated)
        queue.async {
            if let data = try? Data(contentsOf: url){
                DispatchQueue.main.async {
                    complition(data)
                }
            }
        }
    }
    
}
