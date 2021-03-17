//
//  OneJokeViewController.swift
//  involtaTest
//
//  Created by Роман Ковайкин on 11.03.2021.
//

import UIKit

class OneJokeViewController: UIViewController {
    
    let contentView = OneJokeView()
    let network = Network()
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        if network.isConnectedToNetwork(){
            network.getSingleJoke(url: "https://official-joke-api.appspot.com/random_joke") { (joke) in
                self.contentView.setup(id: joke.id, type: joke.type, setup: joke.setup, puchline: joke.punchline)
            }
            
        }else{
            AlertService.showAlert(vc: self)
        }
    }
    
    override func loadView() {
        view = contentView
    }
}
