//
//  DetailView.swift
//  MyResume
//
//  Created by Christopher Ruddell on 6/27/22.
//

import SwiftUI

struct DetailView: View {
    let detail: Details
    let onBack: () -> Void
    
    var body: some View {
        VStack {
            HStack(alignment:.center) {
                Image(detail.iconName())
                    .resizable()
                    .frame(width: 48.0, height: 48.0)
                    .onTapGesture {
                        onBack()
                    }
                Text(detail.title())
                Spacer()
            }.padding()
            switch detail {
            case .WORK_EXPERIENCE:
                WorkExperienceContent(items: [])
            case .EDUCATION:
                EducationContent(items: [])
            case .SKILLS:
                SkillsContent(items: [])
            case .ABOUT:
                AboutContent()
            }
        }.background(detail.backgroundColor())
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        let details = Details.ABOUT
        DetailView(detail: details) { }
    }
}
