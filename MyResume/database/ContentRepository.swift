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
    private var counter: Int = 0
    
    private init() { }
    
    func loadData() {
        if let localResume = LocalImporter().importData() {
            self.loadResume(resume: localResume)
        }
        Task.detached {
            do {
                let resume = try await ApiImporter().downloadData()
                self.loadResume(resume: resume)
            } catch {
                print("ERROR", error)
            }
        }
    }
    
    func loadResume(resume: Resume) {
        deleteAll()
        
        for item in resume.workExperience {
            var newItem = item
            newItem._id = counter
            counter += 1
            addWorkItem(item: newItem)
        }
        for item in resume.education {
            var newItem = item
            newItem._id = counter
            counter += 1
            addEducationItem(item: newItem)
        }
        for item in resume.skills {
            var newItem = item
            newItem._id = counter
            counter += 1
            addSkillItem(item: newItem)
        }
    }
    
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
