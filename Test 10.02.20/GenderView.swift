//
//  GenderView.swift
//  Test 10.02.20
//
//  Created by Samat Umirbekov on 15.02.2020.
//  Copyright © 2020 Samat Umirbekov. All rights reserved.
//

import SwiftUI



struct GenderView: View {

    
    
    
    @EnvironmentObject var userData: UserData
    var body: some View {
        NavigationView {
            ZStack {
                Color.newBackground
                .edgesIgnoringSafeArea(.all)
                VStack {
                    
                    Spacer()
                    
                    HStack {
                        VStack {
                            
                            HStack {
                                Spacer()
                                Text("👨🏻")
                                    .font(.system(size: 50.0))
                                    .frame(width: 100.0, height: 100.0, alignment: .center)
                                    .gesture(TapGesture()
                                        .onEnded {
                                            self.userData.isGenderFemale.toggle()
                                    })
                                    .background(userData.isGenderFemale ? Color.newBackground : Color.newPrimary)
                                    .cornerRadius(50.0)
                                Spacer()
                                Text("👩🏻‍🦱")
                                    .font(.system(size: 50.0))
                                    .frame(width: 100.0, height: 100.0, alignment: .center)
                                    .gesture(TapGesture()
                                        .onEnded {
                                            self.userData.isGenderFemale.toggle()
                                    })
                                    .background(userData.isGenderFemale ? Color.newPrimary : Color.newBackground)
                                    .cornerRadius(50.0)
                                Spacer()
                            }
                        }
                        .frame(minWidth: 0, maxWidth: .infinity)
                    }
                    
                    Spacer()
                    
                    NavigationLink(destination: AgeView()) {
                        NextButtonView()
                    }
                    
                }.padding()
                }
            .navigationBarTitle("Пол", displayMode: .inline)
            .background(NavigationConfigurator { nc in
                nc.navigationBar.barTintColor = UIColor.newPrimary
                nc.navigationBar.titleTextAttributes = [.foregroundColor : UIColor.newBackground]
                nc.navigationBar.tintColor = UIColor.newBackground
            })
            }
                
            
        
    }
}

struct GenderView_Previews: PreviewProvider {
    static var previews: some View {
        GenderView()
    }
}

