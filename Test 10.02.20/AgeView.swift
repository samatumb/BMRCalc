//
//  AgeView.swift
//  Test 10.02.20
//
//  Created by Samat Umirbekov on 17.02.2020.
//  Copyright © 2020 Samat Umirbekov. All rights reserved.
//

import SwiftUI

struct AgeView: View {
    @EnvironmentObject var userData: UserData
    var body: some View {
        
        ZStack {
            Color.newBackground
            .edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                Picker("", selection: $userData.chosedAge) {
                    ForEach(self.userData.minAge..<self.userData.maxAge) {
                        Text("\($0)")
                            .font(.title)
                            .foregroundColor(Color.newFontColor)
                        Spacer()
                    }
                
                }
                .labelsHidden()
                Spacer()
                
                NavigationLink(destination: WeightView()) {
                    NextButtonView()
                }
            }.padding()
            }
        
        .navigationBarTitle("Возраст", displayMode: .inline)
    }
}

struct AgeView_Previews: PreviewProvider {
    static var previews: some View {
        AgeView()
    }
}



