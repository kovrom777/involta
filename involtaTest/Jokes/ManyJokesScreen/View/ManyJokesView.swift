//
//  ManyJokesView.swift
//  involtaTest
//
//  Created by Роман Ковайкин on 12.03.2021.
//

import UIKit
import PinLayout

class ManyJokesView: UIView {

    let indicator = UIActivityIndicatorView()
    let table = UITableView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        
        table.backgroundColor = .white
        addSubview(table)
        
        indicator.color = .black
        indicator.startAnimating()
        addSubview(indicator)
        
    }
    
    func showIndicator(){
        indicator.startAnimating()
        indicator.isHidden = false
    }
    
    func hideIndicator() {
        indicator.stopAnimating()
        indicator.isHidden = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        table.pin.all()
        
        indicator.pin
            .center()
            .width(50)
            .height(50)
        
    }
    
}
