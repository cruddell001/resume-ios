//
//  ContentRepository.swift
//  MyResume
//
//  Created by Christopher Ruddell on 6/27/22.
//

import Foundation

class ContentRepository {
    static let shared = ContentRepository()
    private var workItems: [WorkExperience] = []
    private var educationItems: [Education] = []
    private var skillItems: [Skills] = []
    
    private init() { }
    
    func getWorkItems() -> [WorkExperience] {
        return workItems
    }
    func getEducationItems() -> [Education] {
        return educationItems
    }
    func getSkillItems() -> [Skills] {
        return skillItems
    }
    func deleteAll() {
        workItems = []
        educationItems = []
        skillItems = []
    }
    
    func addWorkItem(item: WorkExperience) {
        workItems = workItems + [item]
    }
    func addEducationItem(item: Education) {
        educationItems = educationItems + [item]
    }
    func addSkillItem(item: Skills) {
        skillItems = skillItems + [item]
    }
    
}
