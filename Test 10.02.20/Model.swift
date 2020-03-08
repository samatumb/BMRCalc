//
//  Model.swift
//  Test 10.02.20
//
//  Created by Samat Umirbekov on 12.02.2020.
//  Copyright © 2020 Samat Umirbekov. All rights reserved.
//

import Foundation
import SwiftUI



class UserData: ObservableObject {
    @Published var isGenderFemale = false

    @Published var ageText = String() {
        didSet {
            let charLimit = 2
            if (ageText.count > charLimit && oldValue.count <= charLimit) || ageText.first == "0" {
                ageText = oldValue
            }
            if ageText.count == charLimit {
                dismissKeyboard()
            }
        }
    }

    @Published var heightText = String() {
        didSet {
            let charLimit = 3
            if (heightText.count > charLimit && oldValue.count <= charLimit) || (heightText.count >= 1 && heightText.first != "1") {
                heightText = oldValue
            }
            if heightText.count == charLimit {
                dismissKeyboard()
            }

        }
    }
    
    
    @Published var weightText = String() {
        didSet {
            let charLimit = 3
            if (weightText.count > charLimit && oldValue.count <= charLimit) || weightText.first == "0" || (weightText.count >= charLimit && weightText.first != "1") {
                weightText = oldValue
                dismissKeyboard()
            }
            if (weightText.count == charLimit - 1 && weightText.first != "1") || weightText.count == charLimit {
                dismissKeyboard()
            }
        }
    }
    
    @Published var weightTargetText = String() {
        didSet {
            let charLimit = 3
            if (weightTargetText.count > charLimit && oldValue.count <= charLimit) || weightTargetText.first == "0" || (weightTargetText.count >= charLimit && weightTargetText.first != "1") {
                weightTargetText = oldValue
                dismissKeyboard()
            }
            if (weightTargetText.count == charLimit - 1 && weightTargetText.first != "1") || weightTargetText.count == charLimit {
                dismissKeyboard()
            }
        }
    }
    
    @Published var fatPercentageRange = 5.0
    var fatPNow: Double {
        var fatPArray = [[4,5],[6,7],[8,10],[11,12],[13,15],[16,19],[20,24],[25,30],[31,34],[35,40]]
        if isGenderFemale {
            fatPArray = [[12,14],[15,17],[18,20],[21,23],[24,26],[27,29],[30,35],[36,40],[41,49],[50,55]]
        }
        let range = Int(fatPercentageRange)
        return Double((fatPArray[range][0] + fatPArray[range][1])) / 200
    }
    
    
    
    private var age: Double {
        if let a = Double(ageText) {
            return a
        }
        print("age is not set")
        return 25
    }
    var height: Double {
        if let h = Double(heightText) {
            return h
        }
        print("height is not set")
        return 175
    }
    
    var weight: Double {
        if let w = Double(weightText) {
            return w
        }
        print("weight is not set")
        return 85
    }
    
    var weightTarget: Double {
        if let w = Double(weightTargetText) {
            return w
        }
        print("weightTarget is not set")
        return 70
    }

    
    let bodyActivityArray = [1.2, 1.375, 1.55, 1.725, 1.9]
    private let calorieDeficit = 0.25
    private var bodyActivity: Double {
        return bodyActivityArray[2]
    }
    
    var BMR: Double {
        var BMRnumbers = [88.632, 13.397, 4.799, 5.677]
        if isGenderFemale {
            BMRnumbers = [447.593, 9.247, 3.098, 4.33]
        }
        let bmr1 = BMRnumbers[0]
        let bmr2 = BMRnumbers[1] * weight * (1 - fatPNow)
        let bmr3 = BMRnumbers[2] * height
        let bmr4 = BMRnumbers[3] * age
        return bmr1 + bmr2 + bmr3 - bmr4
    }
    
    
    private var fatLose: Double {
        return weight - weightTarget
    }
    
    var weeksToFatLose: Int {
        let w1 = 7716.0 * fatLose
        let w2 = BMR * bodyActivity * calorieDeficit
        return Int((w1 / w2) / 7.0)
    }
    
    var fatLosePerWeek: Double {
        return fatLose / Double(weeksToFatLose)
    }
}

