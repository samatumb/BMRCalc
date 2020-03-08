//
//  GenderView.swift
//  Test 10.02.20
//
//  Created by Samat Umirbekov on 15.02.2020.
//  Copyright © 2020 Samat Umirbekov. All rights reserved.
//

import SwiftUI

struct Step1: View {
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.customPurpleLight ?? Color.blue]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.customPurpleLight ?? Color.blue]
        UINavigationBar.appearance().tintColor = UIColor.customPurpleLight
    }
    
    @EnvironmentObject var userData: UserData
    @State var message =  "Привет, давай рассчитаем твой BMR и сделаем тебе план похудения\n\nВыбери пол"
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                VStack(spacing: 10) {
                    Text(message)
                        .font(.system(size: 16.0, weight: .medium))
                        .lineLimit(nil)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(Color.customPurpleDark)
                }
                Spacer()
                HStack {
                    GenderPicture(imageName: "gm", isFemaleImage: false)
                    GenderPicture(imageName: "gf", isFemaleImage: true)
                }
                NavigationLink(destination: Step2(img: Image("\(self.userData.isGenderFemale ? "f" : "m")\(Int(self.userData.fatPercentageRange))"))) {
                    NextButtonView(text: "NEXT")
                }
            }.padding()
                
                .navigationBarTitle("", displayMode: .inline)
        }
        
    }
}


