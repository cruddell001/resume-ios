//
//  WorkExperienceContent.swift
//  MyResume
//
//  Created by Christopher Ruddell on 6/27/22.
//

import SwiftUI

struct WorkExperienceContent: View {
    let items: [WorkExperience]
    @State var selectedItem: WorkExperience? = nil
    
    init(items: [WorkExperience]) {
        self.items = items
       UITableView.appearance().separatorStyle = .none
       UITableViewCell.appearance().backgroundColor = .clear
       UITableView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        List(items, id: \.self._id) { item in
            WorkItemView(item: item, expanded: selectedItem?._id == item._id) {
                if (selectedItem?._id == item._id) {
                    selectedItem = nil
                } else {
                    selectedItem = item
                }
            }
        }.listStyle(.plain)
    }
}

private struct WorkItemView: View {
    let item: WorkExperience
    let expanded: Bool
    let onClick: () -> Void
    
    var body: some View {
        VStack {
            HStack {
                VStack {
                    HStack {
                        Text(item.companyName ?? "")
                            .foregroundColor(.black)
                            .fontWeight(.medium)
                            .font(.system(size: 16))
                            .padding(.top, 4)
                        Spacer()
                    }
                    HStack {
                        Text(item.position)
                            .foregroundColor(.black)
                            .italic()
                            .padding(.leading, 4)
                            .padding(.bottom, 4)
                            .padding(.top, 4)
                            .font(.system(size: 14))
                        Spacer()
                    }
                }.padding(.leading, 8)
                Spacer()
                Text(item.dates ?? "")
                    .multilineTextAlignment(.center)
                    .padding(.trailing, 8)
                    .padding(.top, 4)
                    .padding(.bottom, 4)
            }
            if (expanded) {
                HStack {
                    Text(item.description ?? "")
                        .padding(8)
                    Spacer()
                }
            }
        }
        .background(.white)
        .cornerRadius(4.0)
        .fixedSize(horizontal: false, vertical: true)
        .animation(.easeInOut, value: expanded)
        .listRowSeparator(.hidden)
        .listRowBackground(Color.clear)
        .listRowInsets(EdgeInsets(top: 0.0, leading: 00, bottom: 0.0, trailing: 0.0))
        .padding(4)
        .onTapGesture {
            onClick()
        }
    }
}

struct WorkExperienceContent_Previews: PreviewProvider {
    static var previews: some View {
        let items: [WorkExperience] = [
        WorkExperience(_id: 1, position: "Chief Engineer Officer", companyName: "My House, LLC", dates: "May 2022\n-\nPresent", description: "• Chief engineer for my household\n• Setup technology for all household members\n• Troubleshoot as required"),
        WorkExperience(_id: 2, position: "Chief Engineer Officer", companyName: "My House, LLC", dates: "May 2022\n-\nPresent", description: "• Chief engineer for my household\n• Setup technology for all household members\n• Troubleshoot as required")
        ]
        VStack {
            WorkExperienceContent(items: items)
            Spacer()
        }.background(Details.WORK_EXPERIENCE.backgroundColor())
    }
}
