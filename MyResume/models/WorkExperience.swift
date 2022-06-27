//
//  WorkExperience.swift
//  MyResume
//
//  Created by Christopher Ruddell on 6/27/22.
//

import Foundation

struct WorkExperience : Codable {
    let _id: Int?
    let position: String
    let companyName: String?
    let dates: String?
    let description: String?
}
