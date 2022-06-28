//
//  LocalImporter.swift
//  MyResume
//
//  Created by Christopher Ruddell on 6/27/22.
//

import Foundation

class LocalImporter {
    private var counter: Int = 0
    
    func importData() -> Resume? {
        if let data = readJsonFile(fileName: "initialcontent")?.data(using: .utf8), let resume: Resume = try? JSONDecoder().decode(Resume.self, from: data) {
            return resume
        } else {
            return nil
        }
    }
}
