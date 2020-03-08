//
//  NextButtonView.swift
//  Test 10.02.20
//
//  Created by Samat Umirbekov on 19.02.2020.
//  Copyright © 2020 Samat Umirbekov. All rights reserved.
//

import SwiftUI

struct NextButtonView: View {
    @State var text: String
    @State var height: CGFloat = 50
    @State var width: CGFloat = 200
    var body: some View {
        Text(NSLocalizedString(text, comment: ""))
            .font(.system(size: 16.0, weight: .medium, design: .rounded))
            .frame(minWidth: 0, idealWidth: 0, maxWidth: width, minHeight: height, idealHeight: height, maxHeight: height, alignment: .center)
            .background(Color.customPurpleLight)
            .cornerRadius(25)
            .font(.body)
            .foregroundColor(Color.white)
        
    }
}

struct GenderPicture: View {
    @EnvironmentObject var userData: UserData
    @State var imageName: String
    @State var isFemaleImage: Bool
    func getNumberOfImage() -> (Int, Int) {
        if isFemaleImage {
            return (1, 0)
        } else {
            return (0, 1)
        }
    }
    var body: some View {
        Button(action: {
            self.userData.isGenderFemale.toggle()
        }) {
            Image("\(imageName)\(userData.isGenderFemale ? getNumberOfImage().0 : getNumberOfImage().1)")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 300, alignment: .center)
        }.buttonStyle(PlainButtonStyle())
        
    }
}

