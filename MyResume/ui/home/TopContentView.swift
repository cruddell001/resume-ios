//
//  TopContentView.swift
//  MyResume
//
//  Created by Christopher Ruddell on 6/26/22.
//

import SwiftUI

struct TopContentView: View {
    let geo: GeometryProxy
    let onClick: (Details) -> Void
    
    init (_ geo: GeometryProxy, _ onClick: @escaping (Details) -> Void) {
        self.onClick = onClick
        self.geo = geo
    }
    
    var body: some View {
        ZStack {
            VStack {
                VStack {
                    HStack {
                        Spacer()
                        Text("Chris Ruddell")
                            .fontWeight(.bold)
                            .font(.system(size: 24.0))
                        Spacer()
                    }.padding(.top, 24.0)
                    HStack {
                        ItemButton( .WORK_EXPERIENCE, geo) {
                            onClick(.WORK_EXPERIENCE)
                        }
                        ItemButton(.EDUCATION,geo) {
                            onClick(.EDUCATION)
                        }
                    }
                    HStack {
                        ItemButton(.SKILLS, geo) {
                            onClick(.SKILLS)
                        }
                        ItemButton(.ABOUT, geo) {
                            onClick(.ABOUT)
                        }
                    }.padding(.bottom, 8)
                }.background(.white)
                
            }.padding(.top, 24.0)
            VStack {
                Text("Resume")
                    .padding(8.0)
                    .background(Color(hex: "#29B6FC"))
                    .foregroundColor(.white)
                    .cornerRadius(8.0)
                
            }.offset(y:-1 * geo.size.width / 2 - 54)
        }
    }
}

struct ItemButton: View {
    let detail: Details
    let geo: GeometryProxy
    let onClick: () -> Void
    
    init(_ detail: Details, _ geo: GeometryProxy, _ onClick: @escaping () -> Void) {
        self.detail = detail
        self.geo = geo
        self.onClick = onClick
    }
    
    var body: some View {
        VStack {
            Image(detail.iconName())
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(24.0)
            Text(detail.title())
                .padding(.bottom, 8)
        }.background(detail.backgroundColor())
            .frame(width: geo.size.width / 2 - 12)
            .onTapGesture {
                onClick()
            }
    }
}

struct TopContentView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { geo in
            ZStack {
                TopContentView(geo) {_ in
                }.background(.black)
            }
        }
    }
}
