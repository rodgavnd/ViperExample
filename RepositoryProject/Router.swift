//
//  Router.swift
//  RepositoryProject
//
//  Created by Rodolfo Samuel Gavilan Muñoz on 29/06/22.
//

import Foundation
import UIKit

class Router: RouterProtocol {
    weak var presenter: PresenterProtocol?
    var viewController: UIViewController?
    
    func irAContrato(){
        presentAlertController()
    }
}

extension Router {
    func presentAlertController() {
        let alert = UIAlertController(title: "Contrato", message: "Deseas firmar el contrato", preferredStyle: .alert)
        let yesAction = UIAlertAction(title: "Si",
        style: .default) { _ in
            //notificar al presenter
            self.presenter?.contratoAceptado()
        }
        let noAction = UIAlertAction(title: "No", style: .cancel)
        alert.addAction(yesAction)
        alert.addAction(noAction)
        viewController?.present(alert, animated: true)
    }
}
