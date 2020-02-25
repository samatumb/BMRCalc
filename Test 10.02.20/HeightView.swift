//
//   HeightView.swift
//  Test 10.02.20
//
//  Created by Samat Umirbekov on 19.02.2020.
//  Copyright © 2020 Samat Umirbekov. All rights reserved.
//

import SwiftUI

struct HeightView: View {
    @EnvironmentObject var userData: UserData
     var body: some View {
         
         ZStack {
             Color.newBackground
            .edgesIgnoringSafeArea(.all)
             VStack {
                 Spacer()
                 Picker("", selection: $userData.chosedHeight) {
                    ForEach(self.userData.minHeight..<self.userData.maxHeight) {
                         Text("\($0) см")
                             .font(.title)
                        .foregroundColor(Color.newFontColor)
                     }
                 }
                 .labelsHidden()
                 
                 Spacer()
                 
                 NavigationLink(destination: FatPNowView()) {
                     NextButtonView()
                 }
                 
             }.padding()
         }
    .navigationBarTitle("Рост", displayMode: .inline)
     }
}

struct HeightView_Previews: PreviewProvider {
    static var previews: some View {
        HeightView()
    }
}
