//
//  ViewController.swift
//  RepositoryProject
//
//  Created by Rodolfo Samuel Gavilan Muñoz on 29/06/22.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
  
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let modulo = FeatureX.make()
        
        navigationController?.pushViewController(modulo,
        animated: true)
        
    }
   
    
 
}
