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
    var body: some View {
        NavigationView {
            ZStack {
                NavigationLink(destination: DetailView(detail: selectedDetail) {
                    showDetail = false
                }.navigationBarHidden(true)
                               , isActive: $showDetail) {
                    EmptyView()
                }.hidden()
                HomeView() { detail in
                    selectedDetail = detail
                    showDetail = true
                }.navigationBarHidden(true)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
