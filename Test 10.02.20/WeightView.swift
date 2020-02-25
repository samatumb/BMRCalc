//
//  WeightView.swift
//  Test 10.02.20
//
//  Created by Samat Umirbekov on 17.02.2020.
//  Copyright © 2020 Samat Umirbekov. All rights reserved.
//

import SwiftUI

struct WeightView: View {
    @EnvironmentObject var userData: UserData
     var body: some View {
         
         ZStack {
             Color.newBackground
            .edgesIgnoringSafeArea(.all)
             VStack {
                 Spacer()
                 Picker("", selection: $userData.chosedWeight) {
                    ForEach(self.userData.minWeight..<self.userData.maxWeight) {
                         Text("\($0) кг")
                             .font(.title)
                        .foregroundColor(Color.newFontColor)
                         Spacer()
                     }
                 }
                 .labelsHidden()
                 
                 Spacer()
                 
                 NavigationLink(destination: HeightView()) {
                     NextButtonView()
                 }
                 
             }.padding()
         }
         .navigationBarTitle("Вес", displayMode: .inline)
     }
}

struct WeightView_Previews: PreviewProvider {
    static var previews: some View {
        WeightView()
    }
}
