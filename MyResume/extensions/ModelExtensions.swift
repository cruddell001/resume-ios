//
//  ModelExtensions.swift
//  MyResume
//
//  Created by Christopher Ruddell on 6/26/22.
//

import Foundation
import SwiftUI

extension Details {
    func backgroundColor() -> Color {
        switch self {
        case .WORK_EXPERIENCE:
            return Color(hex: "#BBDEFB")
        case .EDUCATION:
            return Color(hex: "#EF5350")
        case .SKILLS:
            return Color(hex: "#C8E6C9")
        case .ABOUT:
            return Color(hex: "#FFD54F")
        }
    }
    
    func iconName() -> String {
        switch self {
        case .WORK_EXPERIENCE:
            return "work_icon"
        case .EDUCATION:
            return "education_icon"
        case .SKILLS:
            return "skills_icon"
        case .ABOUT:
            return "info_icon"
        }
    }
    
    func title() -> String {
        switch self {
        case .WORK_EXPERIENCE:
            return "Work Experience"
        case .EDUCATION:
            return "Academics"
        case .SKILLS:
            return "Skills"
        case .ABOUT:
            return "About App"
        }
    }
}
