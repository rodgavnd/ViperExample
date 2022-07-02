//
//  BeerRepository.swift
//  RepositoryProject
//
//  Created by Rodolfo Samuel Gavilan Muñoz on 30/06/22.
//

import Foundation

protocol BeerRepository {
    func getBeers() -> [Any]?
    
    func fetchBeer(block: @escaping([BeerEntity]?) -> Void)
}
