//
//  Network.swift
//  involtaTest
//
//  Created by Роман Ковайкин on 11.03.2021.
//

import Foundation
import SystemConfiguration

class Network: Decodable{

    func getJokes(url: String, complition: @escaping (([JokeModel]) -> ())){
        guard let url = URL(string: url) else {return}
        let session = URLSession.shared
        let task = session.dataTask(with: url) { (data, response, error) in
            if let error = error{
                print(error.localizedDescription)
                return
            }
            guard let data = data else {
                print("data is empty")
                return
            }
            
            do{
                let result = try JSONDecoder().decode([JokeModel].self, from: data)
                DispatchQueue.main.async {
                    complition(result)
                }
    
            }catch let jsonError{
                print("Error while decoding JSON: \(jsonError.localizedDescription)")
            }
        }
        task.resume()
    }
    
    func getSingleJoke(url: String, complition: @escaping (JokeModel) -> ()){
        guard let url = URL(string: url) else {return}
        let session = URLSession.shared
        let task = session.dataTask(with: url) { (data, response, error) in
            if let error = error{
                print(error.localizedDescription)
                return
            }
            guard let data = data else {
                print("data is empty")
                return
            }
            
            do{
                let result = try JSONDecoder().decode(JokeModel.self, from: data)
                DispatchQueue.main.async {
                    complition(result)
                }
    
            }catch let jsonError{
                print("Error while decoding JSON: \(jsonError.localizedDescription)")
            }
        }
        task.resume()
    }
    
    func isConnectedToNetwork() -> Bool {
            
            var zeroAddress = sockaddr_in()
            zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
            zeroAddress.sin_family = sa_family_t(AF_INET)
     
            let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
                $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {zeroSockAddress in
                    SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
                }
            }
     
            var flags = SCNetworkReachabilityFlags()
            if !SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) {
                return false
            }
            let isReachable = (flags.rawValue & UInt32(kSCNetworkFlagsReachable)) != 0
            let needsConnection = (flags.rawValue & UInt32(kSCNetworkFlagsConnectionRequired)) != 0
            return (isReachable && !needsConnection)
     
        }
        
}
