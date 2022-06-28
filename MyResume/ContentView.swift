//
//  ContentView.swift
//  MyResume
//
//  Created by Christopher Ruddell on 6/26/22.
//

import SwiftUI

struct ContentView: View {
    @State var selectedDetail: Details = .WORK_EXPERIENCE
    @State var showDetail: Bool = false
    @State var automaticMenuShown = false
    var body: some View {
        NavigationView {
            ZStack {
                NavigationLink(destination: DetailView(detail: selectedDetail) {
                    showDetail = false
                }.navigationBarHidden(true)
                               , isActive: $showDetail) {
                    EmptyView()
                }.hidden()
                HomeView(automaticMenuDisplayAllowed: !automaticMenuShown, onMenuDisplayed: { automaticMenuShown = true }, onClick: { detail in
                    selectedDetail = detail
                    showDetail = true
                }).navigationBarHidden(true)
            }
            .background(Color.black)
        }
        .navigationViewStyle(.stack)
        .task {
            ContentRepository.shared.loadData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
