//
//  EducationContent.swift
//  MyResume
//
//  Created by Christopher Ruddell on 6/27/22.
//

import SwiftUI

struct EducationContent: View {
    let items: [Education]
    @Environment(\.openURL) var openURL
    
    init(items: [Education]) {
        self.items = items
       UITableView.appearance().separatorStyle = .none
       UITableViewCell.appearance().backgroundColor = .clear
       UITableView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        List(items, id: \.self._id) { item in
            EducationItemView(item: item) {
                if let url = item.website {
                    openURL(URL(string: url)!)
                }
            }
        }.listStyle(.plain)
    }
}

private struct EducationItemView: View {
    let item: Education
    let onClick: () -> Void
    
    var body: some View {
        VStack {
            HStack {
                VStack {
                    HStack {
                        Text(item.degreeName ?? "")
                            .foregroundColor(.black)
                            .fontWeight(.medium)
                            .font(.system(size: 18))
                        Spacer()
                    }
                    Text("")
                    HStack {
                        Text(item.schoolName ?? "")
                            .foregroundColor(.black)
                            .italic()
                            .padding(.leading, 8)
                            .font(.system(size: 16))
                        Spacer()
                    }
                }.padding(.leading, 8)
                Spacer()
                VStack(alignment: .trailing) {
                    Text(item.graduationDate ?? "")
                        .multilineTextAlignment(.center)
                    if let gpa = item.gpa, let formatted = String(format: "%.2f", gpa) {
                        Text(formatted)
                    }
                    Spacer()
                }.padding(.trailing, 8)
            }
        }
        .padding(.bottom, 8)
        .padding(.top, 8)
        .background(.white)
        .cornerRadius(8.0)
        .fixedSize(horizontal: false, vertical: true)
        .listRowSeparator(.hidden)
        .listRowBackground(Color.clear)
        .onTapGesture {
            onClick()
        }
    }
}

struct EducationContent_Previews: PreviewProvider {
    static var previews: some View {
        let items: [Education] = [
            Education(_id: 1, schoolName: "Parent Academy", degreeName: "Father of the Year", graduationDate: "June 2012", gpa: nil, website: nil),
            Education(_id: 2, schoolName: "The Ohio State University", degreeName: "Master of Fatherhood and Parenting Nanodegree", graduationDate: "June 29, 2012", gpa: 3.99, website: "https://www.osu.edu")
        ]
        VStack {
            EducationContent(items: items)
            Spacer()
        }.background(Details.EDUCATION.backgroundColor())
    }
}
