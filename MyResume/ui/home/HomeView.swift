//
//  HomeView.swift
//  MyResume
//
//  Created by Christopher Ruddell on 6/26/22.
//

import SwiftUI

struct HomeView: View {
    let automaticMenuDisplayAllowed: Bool
    let onMenuDisplayed: () -> Void
    let onClick: (Details) -> Void
    
    @State private var menuShown = false
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Image("profile")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: geo.size.width)
                    .clipped()
                    
                Rectangle()
                    .fill(.clear)
                    .background(
                            LinearGradient(gradient: Gradient(colors: [.clear, .black]), startPoint: .top, endPoint: .bottom)
                        )
                    .onTapGesture {
                        menuShown.toggle()
                    }
                VStack {
                    Spacer()
                    HStack {
                        Text("Chris\nRuddell")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .font(.system(size: 56.0))
                        Spacer()
                    }
                    HStack {
                        Text("Lead Mobile Engineer")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .font(.system(size: 24.0))
                        Spacer()
                    }
                }.padding(8)
                
                VStack {
                    Spacer()
                    TopContentView(geo) { detail in
                        onClick(detail)
                    }
                }.offset(y: menuShown ? 0.0 : 600.0 )
                    .animation(.easeInOut, value: menuShown)
            }
            
            .frame(width: geo.size.width, height: geo.size.height)
                .clipped()
                .statusBar(hidden: true)
        }.task {
            if (automaticMenuDisplayAllowed) {
                showChoicesAfterDelay()
            }
        }
        
    }
    
    private func showChoicesAfterDelay() {
            // Delay of 1.5 seconds
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            menuShown = true
            onMenuDisplayed()
        }
    }
}




struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(automaticMenuDisplayAllowed: true, onMenuDisplayed: {}, onClick: {_ in })
    }
}
