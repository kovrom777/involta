//
//  MainView.swift
//  involtaTest
//
//  Created by Роман Ковайкин on 11.03.2021.
//

import UIKit
import PinLayout
class MainView: UIView {
    
    let oneRandomJokeButton = UIButton()
    let manyRandomJokesButton = UIButton()
    let imageView = UIImageView()
    
 
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        oneRandomJokeButton.setTitle("One Joke", for: .normal)
        oneRandomJokeButton.backgroundColor = .systemGreen
        oneRandomJokeButton.setTitleColor(.white, for: .normal)
        oneRandomJokeButton.layer.cornerRadius = 16
        oneRandomJokeButton.alpha = 0
        addSubview(oneRandomJokeButton)
        
        manyRandomJokesButton.setTitle("Many Jokes", for: .normal)
        manyRandomJokesButton.backgroundColor = .systemGreen
        manyRandomJokesButton.setTitleColor(.white, for: .normal)
        manyRandomJokesButton.layer.cornerRadius = 16
        manyRandomJokesButton.alpha = 0
        addSubview(manyRandomJokesButton)
        
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        
        addSubview(imageView)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func animateButtons(){
        print(#function)
        UIView.animate(withDuration: 1) {
            self.oneRandomJokeButton.alpha = 1
            self.oneRandomJokeButton.pin
                .top(to: self.imageView.edge.bottom)
                .marginTop(20)
                .left(12)
                .width(40%)
            
            self.manyRandomJokesButton.alpha = 1
            self.manyRandomJokesButton.pin
                .top(to: self.imageView.edge.bottom)
                .marginTop(20)
                .right(12)
                .width(40%)
        }
    }
    
        
    override func layoutSubviews() {
        super.layoutSubviews()
        
        imageView.pin
            .vCenter()
            .left(8)
            .right(8)
            .height(40%)
        
        oneRandomJokeButton.pin
            .bottom()
            .left(12)
            .width(40%)
            .height(60)
        
        manyRandomJokesButton.pin
            .bottom()
            .right(12)
            .width(40%)
            .height(60)
        
        animateButtons()
    }

}
