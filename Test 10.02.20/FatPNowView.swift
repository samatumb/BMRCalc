//
//  ContentView.swift
//  Test 10.02.20
//
//  Created by Samat Umirbekov on 11.02.2020.
//  Copyright © 2020 Samat Umirbekov. All rights reserved.
//

import SwiftUI

struct FatPNowView: View {
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
                        Slider(value: $userData.fatPNow, in: userData.minFatPNow...userData.maxFatPNow) {_ in
                            self.img = Image(self.userData.getImageName(self.userData.fatPNow))
                        }
                            .accentColor(Color.newPrimary)
                        Text("\(Int(userData.fatPNow * 100.0))%")
                            .font(.title)
                            .foregroundColor(Color.newFontColor)
                    }
                }
                Spacer()
                NavigationLink(destination: FatPTargetView()) {
                    NextButtonView()
                }
                
            }
                
            .padding()
        }
        .navigationBarTitle("Процент жира сейчас", displayMode: .inline)
    }
}

struct FatPNowView_Previews: PreviewProvider {
    static var previews: some View {
        FatPNowView()
    }
}

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
