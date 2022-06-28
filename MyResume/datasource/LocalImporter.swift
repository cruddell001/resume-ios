//
//  LocalImporter.swift
//  MyResume
//
//  Created by Christopher Ruddell on 6/27/22.
//

import Foundation

class LocalImporter {
    static let shared = LocalImporter()
    private init() {}
    private var counter: Int = 0
    
    func importData() {
        if let data = readJsonFile(fileName: "initialcontent")?.data(using: .utf8), let resume: Resume = try? JSONDecoder().decode(Resume.self, from: data) {
            ContentRepository.shared.deleteAll()
            
            for item in resume.workExperience {
                var newItem = item
                newItem._id = counter
                counter += 1
                ContentRepository.shared.addWorkItem(item: newItem)
            }
            for item in resume.education {
                var newItem = item
                newItem._id = counter
                counter += 1
                ContentRepository.shared.addEducationItem(item: newItem)
            }
            for item in resume.skills {
                var newItem = item
                newItem._id = counter
                counter += 1
                ContentRepository.shared.addSkillItem(item: newItem)
            }
        }
    }
}
