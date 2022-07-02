//
//  CustomViewController.swift
//  RepositoryProject
//
//  Created by Rodolfo Samuel Gavilan Muñoz on 29/06/22.
//

import UIKit

class CustomViewController: UIViewController {
    
    var presenter: PresenterProtocol?
    private var beers: [BeerEntity] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        presenter?.fetchBeers()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func solicitarDatosButton(_ sender: UIButton) {
        presenter?.presentarContrato()
    }
}

extension CustomViewController: ViewProtocol {
    
    func cambiarColorBackground() {
        view.backgroundColor = .yellow
    }
    
    func mostrarBeers(_ beers: [BeerEntity]) {
        self.beers = beers
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func datosRecibidos(_ datos: [String]) {
        print(datos)
    }
}

extension CustomViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return beers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let beer = beers[indexPath.row]
        cell.textLabel?.text = beer.name
        return cell
    }
    
    
}
