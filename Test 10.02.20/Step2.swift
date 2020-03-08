//
//  AgeView.swift
//  Test 10.02.20
//
//  Created by Samat Umirbekov on 17.02.2020.
//  Copyright © 2020 Samat Umirbekov. All rights reserved.
//

import SwiftUI

struct Step2: View {
    
    @EnvironmentObject var userData: UserData
    @State var message1 =  "Введи свой возраст, рост и вес"
    @State var message2 =  "Выбери Процент жира своего тела по фото"
    @State var img: Image
    
    var body: some View {
    ScrollView {
        VStack (spacing: 30) {
            HStack {
            Text(message1)
                .font(.system(size: 16.0, weight: .medium))
                .foregroundColor(Color.customPurpleDark)
                .lineLimit(nil)
                .multilineTextAlignment(.leading)
            Spacer()
            }
            VStack {
                HStack {
                    Text("ВОЗРАСТ")
                        .font(.system(size: 14.0, weight: .medium, design: .rounded))
                        .foregroundColor(Color.customPurpleLight)
                    
                    Spacer()
                    
                    TextField(userData.ageText, text: $userData.ageText)
                        .keyboardType(.numberPad)
                        .foregroundColor(Color.white)
                        .frame(width: 50, height: 50, alignment: .center)
                        .multilineTextAlignment(.center)
                        .background(Color.customPurpleLight)
                        .cornerRadius(25)
                        .font(.system(size: 16.0, weight: .medium, design: .rounded))
                    Text("ЛЕТ")
                        .frame(width: 30, height: 50, alignment: .leading)
                        .font(.system(size: 14.0, weight: .medium, design: .rounded))
                        .foregroundColor(Color.customPurpleLight)
                    
                }
                HStack {
                    Text("РОСТ")
                        .font(.system(size: 14.0, weight: .medium, design: .rounded))
                        .foregroundColor(Color.customPurpleLight)
                    Spacer()
                    
                    TextField(userData.heightText, text: $userData.heightText)
                        .keyboardType(.numberPad)
                        .foregroundColor(Color.white)
                        .frame(width: 50, height: 50, alignment: .center)
                        .multilineTextAlignment(.center)
                        .background(Color.customPurpleLight)
                        .cornerRadius(25)
                        .font(.system(size: 16.0, weight: .medium, design: .rounded))
                    Text("СМ")
                        .frame(width: 30, height: 50, alignment: .leading)
                        .font(.system(size: 14.0, weight: .medium, design: .rounded))
                        .foregroundColor(Color.customPurpleLight)
                    
                }
                HStack {
                    Text("ВЕС")
                        .font(.system(size: 14.0, weight: .medium, design: .rounded))
                        .foregroundColor(Color.customPurpleLight)
                    Spacer()
                    
                    TextField(userData.weightText, text: $userData.weightText)
                        .keyboardType(.numberPad)
                        .foregroundColor(Color.white)
                        .frame(width: 50, height: 50, alignment: .center)
                        .multilineTextAlignment(.center)
                        .background(Color.customPurpleLight)
                        .cornerRadius(25)
                        .font(.system(size: 16.0, weight: .medium, design: .rounded))
                    Text("КГ")
                        .frame(width: 30, height: 50, alignment: .leading)
                        .font(.system(size: 14.0, weight: .medium, design: .rounded))
                        .foregroundColor(Color.customPurpleLight)
                    
                }
            }

            VStack {
                HStack {
                Text(message2)
                    .font(.system(size: 16.0, weight: .medium))
                    .foregroundColor(Color.customPurpleDark)
                    .lineLimit(nil)
                    .multilineTextAlignment(.leading)
                Spacer()
                }
                Spacer()
                img
                    .resizable()
                    .aspectRatio(1.0, contentMode: .fit)
                    .background(Color.customPurpleDark)
                    .clipped()
                    .cornerRadius(20)
                    .overlay(RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.customPurpleLight, lineWidth: 2))
                Spacer()
                HStack {
                    Text("% ЖИРА")
                        .font(.system(size: 14.0, weight: .medium, design: .rounded))
                        .foregroundColor(Color.customPurpleLight)
                    
                    Slider(value: $userData.fatPercentageRange, in: 0.0...9.0, step: 1.0) {_ in
                        let imageNamePrefix = self.userData.isGenderFemale ? "f" : "m"
                        self.img = Image("\(imageNamePrefix)\(Int(self.userData.fatPercentageRange))")
                    }
                    .accentColor(Color.customPurpleLight)
                    Text("\(String(format: "%.1f",userData.fatPNow * 100))%")
                        .font(.system(size: 18.0, weight: .medium, design: .rounded))
                        .foregroundColor(Color.customPurpleLight)
                }
            }
            Spacer()
            if userData.ageText != "" && userData.heightText != "" && userData.weightText != "" {
                NavigationLink(destination: Step3()) {
                    NextButtonView(text: "ДАЛЕЕ")
                }
            }
        }.padding()
    }
    }
}









