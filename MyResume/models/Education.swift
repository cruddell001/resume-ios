//
//  Education.swift
//  MyResume
//
//  Created by Christopher Ruddell on 6/27/22.
//

import Foundation

struct Education : Codable {
    var _id: Int?
    let schoolName: String?
    let degreeName: String?
    let graduationDate: String?
    let gpa: Float?
    let website: String?
}
