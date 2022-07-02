//
//  VIPERLayers.swift
//  RepositoryProject
//
//  Created by Rodolfo Samuel Gavilan Muñoz on 29/06/22.
//

import Foundation

protocol ViewProtocol: AnyObject {
    func datosRecibidos(_ datos: [String])
    func mostrarBeers(_ beers: [BeerEntity])
    func cambiarColorBackground()
}

protocol InteractorProtocol {
    func getBeers()
}

protocol RouterProtocol {
   func irAContrato()
}

protocol PresenterProtocol: AnyObject {
    func loadData()
    func fetchBeers()
    
    func reloadBeers(_ beers: [BeerEntity])
    func presentarContrato()
    func contratoAceptado()
}

