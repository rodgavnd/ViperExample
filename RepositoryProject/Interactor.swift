//
//  Interactor.swift
//  RepositoryProject
//
//  Created by Rodolfo Samuel Gavilan Muñoz on 29/06/22.
//

import Foundation

class Interactor {
    let beerRepository: BeerRepository
    var presenter: PresenterProtocol?
    
    required init(repository: BeerRepository){
        self.beerRepository = repository
    }
}

extension Interactor: InteractorProtocol {
    func getBeers() {
        //beerRepository?.getBeers()
        beerRepository.fetchBeer(block: { beers in
            print(beers)
            if let _ =  beers {
                self.presenter?.reloadBeers(beers!)
            } else {
                
            }
        })
    }
}
