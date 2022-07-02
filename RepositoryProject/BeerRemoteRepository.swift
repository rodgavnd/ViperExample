//
//  BeerRemoteRepository.swift
//  RepositoryProject
//
//  Created by Rodolfo Samuel Gavilan Muñoz on 30/06/22.
//

import Foundation

class BeerRemoteRepository: BeerRepository {
    let session = URLSession.shared
    func getBeers() -> [Any]? {
       
        guard let url = URL(string: "https://api.punkapi.com/v2/beers") else { return nil}
        let request = URLRequest(url: url)
        let task = session.dataTask(with: request) { data, response, error in
            if let data = data {
                let decoder = JSONDecoder()
                let beerResponse = try? decoder.decode([BeerEntity].self, from: data)
                
            } else {
                print(error?.localizedDescription)
            }
        }
        task.resume()
        return nil
    }
    
    func fetchBeer(block: @escaping( [BeerEntity]?) -> Void) {
        guard let url = URL(string: "https://api.punkapi.com/v2/beers") else {
            block(nil)
            return
        }
        let request = URLRequest(url: url)
        let task = session.dataTask(with: request) { data, response, error in
            if let data = data {
                let decoder = JSONDecoder()
                let beerResponse = try? decoder.decode([BeerEntity].self, from: data)
                block(beerResponse)
            } else {
                print(error?.localizedDescription)
                block(nil)
            }
        }
        task.resume()
    }
}

class BeerEntity: Codable {
    let name :String
}
