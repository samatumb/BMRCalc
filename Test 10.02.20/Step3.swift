//
//  WeightView.swift
//  Test 10.02.20
//
//  Created by Samat Umirbekov on 17.02.2020.
//  Copyright © 2020 Samat Umirbekov. All rights reserved.
//

import SwiftUI

struct Step3: View {
    @EnvironmentObject var userData: UserData
    @State var message =  "Выбери свой целевой вес"
    
    var body: some View {
        VStack (spacing: 30) {
            VStack (spacing: 10) {
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Text("Твой BMI (ИМТ):")
                        .font(.system(size: 14.0, weight: .medium, design: .rounded))
                        .foregroundColor(Color.white)
                    Spacer()
                    Spacer()
                }
                VStack {
                    
                    Text("\(String(format: "%.1f",userData.weight / ((userData.height / 100) * (userData.height / 100))))")
                        .font(.system(size: 26.0, weight: .medium, design: .rounded))
                        .foregroundColor(Color.white)
                }
                Spacer()
            }.frame(minWidth: 300, idealWidth: 300, maxWidth: 300, minHeight: 100, idealHeight: 100, maxHeight: 100, alignment: .center)
                .background(Color.customPurpleLight)
                .cornerRadius(18)
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Text("Твой BMR:")
                        .font(.system(size: 14.0, weight: .medium, design: .rounded))
                        .foregroundColor(Color.white)
                    Spacer()
                    Spacer()
                }
                VStack {
                    Text("\(Int(userData.BMR))")
                        .font(.system(size: 26.0, weight: .medium, design: .rounded))
                        .foregroundColor(Color.white)
                }
                Text("ккал/день")
                    .font(.system(size: 14.0, weight: .medium, design: .rounded))
                    .foregroundColor(Color.white)
                Spacer()
            }.frame(minWidth: 300, idealWidth: 300, maxWidth: 300, minHeight: 100, idealHeight: 100, maxHeight: 100, alignment: .center)
                .background(Color.customPurpleLight)
                .cornerRadius(18)
            }
            VStack {
                HStack {
                    Text(message)
                        .font(.system(size: 16.0, weight: .medium))
                        .foregroundColor(Color.customPurpleDark)
                        .lineLimit(nil)
                        .multilineTextAlignment(.leading)
                    Spacer()
                }
                HStack {
                    Text("ВЕС")
                        .font(.system(size: 14.0, weight: .medium, design: .rounded))
                        .foregroundColor(Color.customPurpleLight)
                    Spacer()
                    
                    TextField(userData.weightTargetText, text: $userData.weightTargetText)
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
            Spacer()
            if userData.weightTargetText != "" {
                NavigationLink(destination: Step4()) {
                    NextButtonView(text: "ДАЛЕЕ")
                }
            }
            
        }.padding()
        
    }
}

