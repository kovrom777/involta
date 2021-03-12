//
//  OneJokeView.swift
//  involtaTest
//
//  Created by Роман Ковайкин on 11.03.2021.
//

import UIKit
import PinLayout

class OneJokeView: UIView {

    let idLabel = UILabel()
    let typeLabel = UILabel()
    let setupLabel = UILabel()
    let punchlineLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        let labels = [idLabel, typeLabel, setupLabel, punchlineLabel]
        labels.forEach {
            $0.textColor = .black
            $0.adjustsFontSizeToFitWidth = true
            $0.lineBreakMode = .byWordWrapping
            $0.numberOfLines = 0
            $0.textAlignment = .center
            addSubview($0)
        }
    }
    
    func setup(id: Int, type: String, setup: String, puchline: String){
        idLabel.text = "id = \(id)"
        typeLabel.text = type
        setupLabel.text = setup
        punchlineLabel.text = puchline
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        idLabel.pin
            .bottom(50)
            .left(12)
            .width(40%)
            .height(50)

        typeLabel.pin
            .top(to: idLabel.edge.top)
            .right(12)
            .height(50)
            .width(40%)
        
        setupLabel.pin
            .top(50)
            .left(12)
            .right(12)
            .height(50)
        
        punchlineLabel.pin
            .top(to: setupLabel.edge.bottom)
            .marginTop(12)
            .left(12)
            .right(12)
            .height(50)
            
        
    }
    
}
