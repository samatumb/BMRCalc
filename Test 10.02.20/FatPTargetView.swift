//
//  FatPTargetView.swift
//  Test 10.02.20
//
//  Created by Samat Umirbekov on 19.02.2020.
//  Copyright © 2020 Samat Umirbekov. All rights reserved.
//

import SwiftUI

struct FatPTargetView: View {
    @EnvironmentObject var userData: UserData
    @State var img = Image("d")
    var body: some View {
        ZStack {
            Color.newBackground
            .edgesIgnoringSafeArea(.all)
            VStack {
                img
                .resizable()
                .aspectRatio(1.0, contentMode: .fit)
                .clipped()
                VStack (alignment: .leading) {
                    HStack {
                        Spacer()
                        Slider(value: $userData.fatPTarget, in: userData.minFatPTarget...userData.maxFatPTarget) {_ in
                            self.img = Image(self.userData.getImageName(self.userData.fatPTarget))
                        }
                            .accentColor(Color.newPrimary)
                        Text("\(Int(userData.fatPTarget * 100.0))%")
                            .font(.title)
                            .foregroundColor(Color.newFontColor)
                    }
                }
                Spacer()
                NavigationLink(destination: TableView()) {
                    NextButtonView()
                }
                
            }.padding()
            
            
        }
        .navigationBarTitle("Процент жира цель", displayMode: .inline)
    }
}

struct FatPTargetView_Previews: PreviewProvider {
    static var previews: some View {
        FatPTargetView()
    }
}
