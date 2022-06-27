//
//  HomeView.swift
//  MyResume
//
//  Created by Christopher Ruddell on 6/26/22.
//

import SwiftUI

struct HomeView: View {
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
                        menuShown.toggle()
                    }
                }.offset(y: menuShown ? 0.0 : 600.0 )
                    .animation(.easeInOut, value: menuShown)
            }
            .frame(width: geo.size.width, height: geo.size.height)
                .clipped()
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
