//
//  PeopleResponse.swift
//  RepositoryProject
//
//  Created by Rodolfo Samuel Gavilan Muñoz on 29/06/22.
//

import Foundation

struct PeopleResponse: Codable {
    let success: Bool
    let people: [People]
}
