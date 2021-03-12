//
//  ViewController.swift
//  involtaTest
//
//  Created by Роман Ковайкин on 11.03.2021.
//

import UIKit

class ViewController: UIViewController {
    
    let contentView = MainView()
    let network = Network()
    let alertService = AlertService()
    let viewModel = MainScreenViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if network.isConnectedToNetwork(){
            viewModel.fetchExampleImage { (data) in
                self.contentView.imageView.image = UIImage(data: data)
            }
        }else{
            AlertService.showAlert(vc: self)
        }
        
        contentView.oneRandomJokeButton.addTarget(self, action: #selector(handleOneJokeButtonTap), for: .touchUpInside)
        contentView.manyRandomJokesButton.addTarget(self, action: #selector(handleManyJokeTap), for: .touchUpInside)
    }
    
    @objc func handleOneJokeButtonTap(){
        present(OneJokeViewController(), animated: true, completion: nil)
    }
    
    @objc func handleManyJokeTap(){
        present(ManyJokesViewController(), animated: true, completion: nil)
    }

    override func loadView() {
        view = contentView
    }

}

