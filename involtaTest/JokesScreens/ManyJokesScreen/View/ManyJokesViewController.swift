//
//  ManyJokesViewController.swift
//  involtaTest
//
//  Created by Роман Ковайкин on 12.03.2021.
//

import UIKit

class ManyJokesViewController: UIViewController {
    
    let contentView = ManyJokesView()
    let network = Network()
    var dataArrayForNetwork = [JokeModel]()
    var dataArrayForDB = [JokeModelForRealm]()
    var dataBase = DataBase()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTable()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        //checkInteret
        if !network.isConnectedToNetwork(){
            AlertService.showAlert(vc: self)
            contentView.hideIndicator()
            dataArrayForDB.append(contentsOf: dataBase.readData())
        }else{
            
            fetchJokes()
            
        }
        
    }
    
    func fetchJokes(){
        network.getJokes(url: "https://official-joke-api.appspot.com/random_ten") { (jokes) in
            self.dataArrayForNetwork.append(contentsOf: jokes)
            self.contentView.table.reloadData()
            self.contentView.hideIndicator()
        }
    }
    
    func configureTable(){
        contentView.table.delegate = self
        contentView.table.dataSource = self
        contentView.table.register(ManyJokesTableViewCell.self, forCellReuseIdentifier: ManyJokesTableViewCell.cellId)
    }
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        
        writeData()
        
    }
    
    func writeData(){
        if network.isConnectedToNetwork(){
            var i = 10
            dataBase.clearAllData()
            while i > 0{
                let data = dataArrayForNetwork[dataArrayForNetwork.count - i]
                dataBase.witeData(data: JokeModelForRealm(id: data.id, type: data.type, setup: data.setup, punchline: data.punchline))
                i -= 1
                
            }
        }else{
            return
        }
    }
    
}

extension ManyJokesViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if dataArrayForNetwork.count > 0 {
            return dataArrayForNetwork.count
        }else if dataArrayForDB.count > 0{
            return dataArrayForDB.count
        }else{
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ManyJokesTableViewCell.cellId, for: indexPath) as? ManyJokesTableViewCell else{
            return UITableViewCell()
        }
        
        if dataArrayForNetwork.count > 0{
            let data = dataArrayForNetwork[indexPath.row]
            cell.setupCell(id: data.id, type: data.type, setup: data.setup, punchline: data.punchline)
        }else if dataArrayForDB.count > 0{
            let data = dataArrayForDB[indexPath.row]
            cell.setupCell(id: data.id, type: data.type, setup: data.setup, punchline: data.punchline)
        }
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastElem = dataArrayForNetwork.count - 1
        if network.isConnectedToNetwork(){
            if tableView.indexPathsForVisibleRows?.last?.row == lastElem{
                self.contentView.showIndicator()
                fetchJokes()
                return
            }
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
}
