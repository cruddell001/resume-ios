//
//  AboutContent.swift
//  MyResume
//
//  Created by Christopher Ruddell on 6/27/22.
//

import SwiftUI

enum ItemType {
    case UNSET, LICENSES, APP_DEVELOPMENT, CONTACT_INFO
}

struct AboutContent: View {
    @State var selectedItem: ItemType = .CONTACT_INFO
    
    var body: some View {
        ScrollView {
            VStack {
                AboutButton(title: "Third-Party Licenses") {
                    selectedItem = .LICENSES
                }
                AboutButton(title: "App Development") {
                    selectedItem = .APP_DEVELOPMENT
                }
                AboutButton(title: "Contact Info") {
                    selectedItem = .CONTACT_INFO
                }
                Spacer()
                ZStack {
                    switch selectedItem {
                    case .UNSET:
                        EmptyView()
                    case .LICENSES:
                        ThirdPartyLicenseView()
                    case .APP_DEVELOPMENT:
                        AppDevelopmentView()
                    case .CONTACT_INFO:
                        ContactInfoView()
                    }
                }.animation(.easeInOut, value: selectedItem)
            }
        }
    }
}

struct EmptyView: View {
    var body: some View {
        ZStack {}
    }
}

struct ThirdPartyLicenseView: View {
    var body: some View {
        VStack {
            Text("Icons in this app were made by Freepik and obtained from www.flaticon.com\n\nLicenses used by third-party libraries in this app:\n\nApache 2.0")
        }.padding().background(.white).padding()
    }
}

struct AppDevelopmentView: View {
    var body: some View {
        VStack {
            Text("This app was developed by Chris Ruddell from scratch using Xcode and SwiftUI. It incorporates elements from Material Design and Apple User Interface Guidelines. Data is loaded at runtime and updated dynamically from an AWS server instance using async/await.").padding()
        }.background(.white).padding()
    }
}

struct ContactInfoView: View {
    var body: some View {
        VStack(alignment:.leading) {
            Text("Chris Ruddell")
            Text("Lead Mobile Engineer")
            Text("512–806-RESU(ME)").padding(.top, 8)
            Text("chris.ruddell@gmail.com")
            Text("Austin, TX")
            Text("I have been developing mobile apps for iOS and Android since 2012. For the past three years I have worked as a mobile engineer for BigCommerce, and am current serving as the lead engineer on the mobile team there.").padding(.top, 8)
        }.padding().background(.white).padding()
    }
}

struct AboutButton: View {
    let title: String
    let onClick: () -> Void
    
    var body: some View {
        HStack {
            Text(title).padding()
            Spacer()
        }
        .background(.white)
        .cornerRadius(8.0)
        .padding(.top, 4)
        .padding(.bottom, 4)
        .padding(.leading, 8)
        .padding(.trailing, 8)
        .onTapGesture {
            onClick()
        }
    }
}

struct AboutContent_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            AboutContent()
            Spacer()
        }.background(Details.ABOUT.backgroundColor())
    }
}
