//
//  SkillsContent.swift
//  MyResume
//
//  Created by Christopher Ruddell on 6/27/22.
//

import SwiftUI

struct SkillsContent: View {
    let items: [Skills]
    @State var selectedItem: Skills? = nil
    
    init(items: [Skills]) {
        self.items = items
       UITableView.appearance().separatorStyle = .none
       UITableViewCell.appearance().backgroundColor = .clear
       UITableView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        List(items, id: \.self._id) { item in
            SkillItemView(item: item, expanded: selectedItem?._id == item._id) {
                if (selectedItem?._id == item._id) {
                    selectedItem = nil
                } else {
                    selectedItem = item
                }
            }
        }.listStyle(.plain)
    }
}

private struct SkillItemView: View {
    let item: Skills
    let expanded: Bool
    let onClick: () -> Void
    
    var body: some View {
        HStack {
            VStack(alignment:.leading) {
                Text(item.categoryName)
                    .foregroundColor(.black)
                    .fontWeight(.medium)
                    .font(.system(size: 18))
                    .padding(.leading, 8)
                if (expanded) {
                    VStack(alignment:.leading) {
                        ForEach(item.itemNames, id:\.self) { name in
                            Text(name)
                        }
                    }
                    .padding(.leading, 8)
                    .padding(.trailing, 8)
                }
            }
            Spacer()
        }
        .padding(.bottom, 8)
        .padding(.top, 8)
        .background(.white)
        .cornerRadius(8.0)
        .fixedSize(horizontal: false, vertical: true)
        .listRowSeparator(.hidden)
        .listRowBackground(Color.clear)
        .animation(.easeInOut, value: expanded)
        .onTapGesture {
            onClick()
        }
    }
}

struct SkillsContent_Previews: PreviewProvider {
    static var previews: some View {
        let items: [Skills] = [
            Skills(_id: 1, categoryName: "Languages & Frameworks", itemNames: [
                "English",
                "Daddy Speak",
                "Parental Smackdown"
            ]),
            Skills(_id: 2, categoryName: "Languages & Frameworks", itemNames: [
                "English",
                "Daddy Speak",
                "Parental Smackdown"
            ])
        ]
        VStack {
            SkillsContent(items: items)
            Spacer()
        }.background(Details.WORK_EXPERIENCE.backgroundColor())
    }
}
