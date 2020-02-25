//
//  Model.swift
//  Test 10.02.20
//
//  Created by Samat Umirbekov on 12.02.2020.
//  Copyright © 2020 Samat Umirbekov. All rights reserved.
//

import Foundation

class UserData: ObservableObject {
    @Published var isGenderFemale = false
    
    @Published var chosedAge = 0
    var minAge = 16
    var maxAge = 60
    
    
    @Published var chosedWeight = 0
    var minWeight = 45
    var maxWeight = 160
    
    @Published var chosedHeight = 0
    var minHeight = 145
    var maxHeight = 205
    
    
    
    @Published var fatPNow = 0.35
    var minFatPNow: Double {
        let min = minFatPTarget + 0.01
        return min
    }
    var maxFatPNow: Double {
        let max = isGenderFemale ? 0.50 : 0.40
        return max
    }
    
    @Published var fatPTarget = 0.15
    var minFatPTarget: Double {
        let min = isGenderFemale ? 0.12 : 0.04
        return min
    }
    var maxFatPTarget: Double {
            let max = maxFatPNow - 0.01
            return max
        }
    
    public func getImageName (_ fatP: Double) -> String {
        let gender = isGenderFemale ? "f" : "m"
        let FParr = isGenderFemale ? [0.15, 0.18, 0.21, 0.24, 0.27, 0.30, 0.36, 0.41] : [0.06, 0.08, 0.11, 0.13, 0.16, 0.20, 0.25, 0.31]
        switch fatP {
            case minFatPTarget..<FParr[0]:
                return "\(gender)\(1)"
            case ..<FParr[1]:
                return "\(gender)\(2)"
            case ..<FParr[2]:
                return "\(gender)\(3)"
            case ..<FParr[3]:
                return "\(gender)\(4)"
            case ..<FParr[4]:
                return "\(gender)\(5)"
            case ..<FParr[5]:
                return "\(gender)\(6)"
            case ..<FParr[6]:
                return "\(gender)\(7)"
            case ..<FParr[7]:
                return "\(gender)\(8)"
            case ...maxFatPNow:
                return "\(gender)\(9)"
            default:
                return "\(gender)\(7)"
        }
    }
    
    var age: Double {
        return Double(chosedAge + minAge)
    }
    var weight: Double {
        return Double(chosedWeight + minWeight)
    }
    var height: Double {
        return Double(chosedHeight + minHeight)
    }
    
    
    let bodyActivityArray = [1.2, 1.375, 1.55, 1.725, 1.9]
    private let calorieDeficit = 0.25
    
    private var bodyActivity: Double {
        return bodyActivityArray[2]
    }
    
    
    private var BMR: Double {
        var BMRnumbers = [447.593, 9.247, 3.098, 4.33]
        if isGenderFemale {
            BMRnumbers = [88.632, 13.397, 4.799, 5.677]
        }
        let bmr1 = BMRnumbers[0]
        let bmr2 = BMRnumbers[1] * weight * (1 - fatPNow)
        let bmr3 = BMRnumbers[2] * height
        let bmr4 = BMRnumbers[3] * age
        return bmr1 + bmr2 + bmr3 - bmr4
    }
    
    
    private var fatLose: Double {
        let f1 = weight * fatPNow
        let f2 = weight * (1 - fatPNow)
        let f3 = 1 - (fatPNow - fatPTarget)
        let f4 = fatPTarget
        return f1 - f2 / f3 * f4
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

