//
//  PeopleRepository.swift
//  RepositoryProject
//
//  Created by Rodolfo Samuel Gavilan Muñoz on 29/06/22.
//

import Foundation

protocol PeopleRepository {
    func fetchPeople() -> PeopleResponse?
}
//Para hacer opcional los metodos del protocolo
//@objc protocol y @optional func
//extension PeopleRepository, implementar func fetchPeople()

/*
extension PeopleRepository {
    func fetchPeople()-> PeopleResponse?{
        fatalError("No implementado")
    }
}
*/

class PeopleLocalRepository: PeopleRepository {
    func fetchPeople() -> PeopleResponse? {
        guard let data = loadJSON("people_success_response") else {
            print("error")
            return nil
        }
        let decoder = JSONDecoder()
         return try? decoder.decode(PeopleResponse.self, from: data)
    }
}

extension PeopleRepository {
    func loadJSON(_ name: String) -> Data? {
      guard let url =  Bundle.main.url(forResource: name, withExtension: "json")
        else {
          return nil
      }
        return try? Data(contentsOf: url)
    }
}

class PeopleRemoteRepository: PeopleRepository {
    func fetchPeople() -> PeopleResponse? {
        fatalError("No implementado")
    }
}
