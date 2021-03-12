//
//  ManyJokesTableViewCell.swift
//  involtaTest
//
//  Created by Роман Ковайкин on 12.03.2021.
//

import UIKit
import PinLayout

class ManyJokesTableViewCell: UITableViewCell {
    
    static let cellId = "ManyJokesId"
    
    let idLabel = UILabel()
    let typeLabel = UILabel()
    let setupLabel = UILabel()
    let punchlineLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
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
    
    func setupCell(id: Int, type: String, setup: String, punchline: String){
        idLabel.text = String(id)
        typeLabel.text = type
        setupLabel.text = setup
        punchlineLabel.text = punchline
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        idLabel.pin
            .top(4)
            .left(4)
            .bottom(4)
            .width(12%)
        
        typeLabel.pin
            .top(to: idLabel.edge.top)
            .left(to: idLabel.edge.right)
            .marginLeft(4)
            .bottom(to: idLabel.edge.bottom)
            .width(20%)
        
        setupLabel.pin
            .top(to: typeLabel.edge.top)
            .left(to: typeLabel.edge.right)
            .marginLeft(4)
            .bottom(to: edge.vCenter)
            .right(4)
        
        punchlineLabel.pin
            .top(to: setupLabel.edge.bottom)
            .left(to: setupLabel.edge.left)
            .bottom(to: typeLabel.edge.bottom)
            .right(to: setupLabel.edge.right)
        
    }
    
}
