//
//  Presenter.swift
//  RepositoryProject
//
//  Created by Rodolfo Samuel Gavilan Muñoz on 29/06/22.
//

import Foundation

class Presenter: PresenterProtocol {
    weak var view: ViewProtocol?
    var router: RouterProtocol?
    var interactor: InteractorProtocol?

    func loadData() {
        view?.datosRecibidos(["manzana", "pera"])
    }
    
    func fetchBeers() {
        //Presenter le pide al interactor una lista de beers.
        interactor?.getBeers()
    }
    func reloadBeers(_ beers: [BeerEntity]) {
        
        if !beers.isEmpty {
            view?.mostrarBeers(beers)
        } else {
            
        }
    }
    func presentarContrato(){
        router?.irAContrato()
    }
    func contratoAceptado(){
        view?.cambiarColorBackground()
    }
}
