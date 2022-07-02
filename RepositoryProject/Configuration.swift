//
//  Configuration.swift
//  RepositoryProject
//
//  Created by Rodolfo Samuel Gavilan Muñoz on 29/06/22.
//

import Foundation
import UIKit

class FeatureX {
    class func make() -> UIViewController  {
        let router = Router()
        //let repository = BeerRemoteRepository()
        let repository = BeerLocalRepository()
        let interactor = Interactor(repository: repository)
       
        //let viewController = CustomViewController()
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        guard let viewController = storyBoard.instantiateViewController(withIdentifier: "CustomViewController") as? CustomViewController else {
            fatalError("no hay view controller")
        }
         
        let presenter = Presenter()
        interactor.presenter = presenter
        presenter.router = router
        presenter.interactor = interactor
        presenter.view = viewController
        router.viewController = viewController
        router.presenter = presenter
        
        viewController.presenter = presenter
        
        return viewController
    }
}
