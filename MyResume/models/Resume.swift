//
//  Resume.swift
//  MyResume
//
//  Created by Christopher Ruddell on 6/27/22.
//

import Foundation

struct Resume : Codable {
    let workExperience: [WorkExperience]
    let skills: [Skills]
    let education: [Education]
}
