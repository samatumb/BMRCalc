//
//  NextButtonView.swift
//  Test 10.02.20
//
//  Created by Samat Umirbekov on 19.02.2020.
//  Copyright © 2020 Samat Umirbekov. All rights reserved.
//

import SwiftUI

struct NextButtonView: View {
    @State var height: CGFloat = 40
    @State var width: CGFloat = .infinity
    var body: some View {
        Text("ДАЛЕЕ")
            .frame(minWidth: 0, idealWidth: 0, maxWidth: width, minHeight: height, idealHeight: height, maxHeight: height, alignment: .center)
            .background(Color.newPrimary)
            .cornerRadius(5.0)
            .font(.body)
            .foregroundColor(Color.newFontPrimaryColor)    }
}

struct NextButtonView_Previews: PreviewProvider {
    static var previews: some View {
        NextButtonView()
    }
}
