//
//  BeerLocalRepository.swift
//  RepositoryProject
//
//  Created by Rodolfo Samuel Gavilan Muñoz on 30/06/22.
//

import Foundation

class BeerLocalRepository: BeerRepository {
    func fetchBeer(block: @escaping([BeerEntity]?) -> Void) {
        guard let data = loadJSONfile("people_success_response") else {
            block(nil)
            return
        }
        let decoder = JSONDecoder()
        let beers = try? decoder.decode([BeerEntity].self,from: data)
        block(beers)
    }
    
    func getBeers() -> [Any]? {
        guard let data = loadJSONfile("") else {
            return nil
        }
        let decoder = JSONDecoder()
        return try? decoder.decode([BeerEntity].self,from: data)
    }
}

fileprivate extension BeerLocalRepository {
    func loadJSONfile (_ name: String) -> Data? {
        if let url = Bundle.main.url(forResource: name,
            withExtension: "json") {
            let data = try? Data(contentsOf: url)
            return data
        }
        return nil
    }
}
