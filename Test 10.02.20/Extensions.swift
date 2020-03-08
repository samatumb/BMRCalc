//
//  Extensions.swift
//  Test 10.02.20
//
//  Created by Samat Umirbekov on 19.02.2020.
//  Copyright © 2020 Samat Umirbekov. All rights reserved.
//

import SwiftUI
import UIKit

extension UIColor {
    public static let newPrimary = UIColor(named: "primaryColor")
    public static let newBackground = UIColor.white
    public static let customPurpleLight = UIColor(named: "customPurpleLight")
    public static let customPurpleDark = UIColor(named: "customPurpleDark")
    public static let newFontColor = newPrimary
    public static let newFontPrimaryColor = newBackground
}

extension Color {
    public static let newPrimary = Color("primaryColor")
    public static let newBackground = Color.white
    public static let customPurpleLight = Color("customPurpleLight")
    public static let customPurpleDark = Color("customPurpleDark")
    public static let newFontColor = newPrimary
    public static let newFontPrimaryColor = newBackground
}

func dismissKeyboard() {
    let keyWindow = UIApplication.shared.connectedScenes
                        .filter({$0.activationState == .foregroundActive})
                        .map({$0 as? UIWindowScene})
                        .compactMap({$0})
                        .first?.windows
                        .filter({$0.isKeyWindow}).first
    keyWindow?.endEditing(true)
}

class StringAge {
    var value: String {
        didSet {
            let charLimit = 2
            if (value.count > charLimit && oldValue.count <= charLimit) || value.first == "0" {
                value = oldValue
            }
            if value.count == charLimit {
                dismissKeyboard()
            }
        }
    }
    static let charLimit = 2
    init(newValue: String) {
        self.value = newValue
    }

        


}
