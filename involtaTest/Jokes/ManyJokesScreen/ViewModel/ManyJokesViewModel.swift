//
//  ManyJokesViewModel.swift
//  involtaTest
//
//  Created by Роман Ковайкин on 12.03.2021.
//

import Foundation

class ManyJokesViewModel{
    let network = Network()
    
    func fetchJokes(complition: @escaping ([JokeModel])->()){
        network.getTenJokes(complition: complition)
    }
    
    
    
    
}
