//
//  TableView.swift
//  Test 10.02.20
//
//  Created by Samat Umirbekov on 11.02.2020.
//  Copyright © 2020 Samat Umirbekov. All rights reserved.
//

import SwiftUI

struct WeeklyData: Identifiable {
    var id = UUID()
    var week: Int
    var weight: Double
    var fatPerc: Double
}


struct WeeklyDataRow: View {
    var data: WeeklyData
    var body: some View {
 
            HStack {
                Text("неделя \(data.week)")
                    .font(.body)
                    .foregroundColor(Color.newFontColor)
                Spacer()
                Text(String(format: "%.1f", data.weight))
                    .font(.body)
                    .foregroundColor(Color.newFontColor)
                Spacer()
                Text("\(Int(data.fatPerc * 100.0))%")
                    .font(.body)
                    .foregroundColor(Color.newFontColor)
            }
        }
    }
    
    
    struct TableView: View {
        @EnvironmentObject var userData: UserData
        var listArray: [WeeklyData] {
            var wk = 0
            var wg = userData.weight
            var fp = userData.fatPNow
            var arr = [WeeklyData(week: wk, weight: wg, fatPerc: fp)]
            for _ in 1...userData.weeksToFatLose {
                wk += 1
                wg -= userData.fatLosePerWeek
                fp = (wg - userData.weight * (1 - userData.fatPNow)) / wg
                arr.append(WeeklyData(week: wk, weight: wg, fatPerc: fp))
            }
            return arr
        }
        var body: some View {
            List(listArray, rowContent: WeeklyDataRow.init)
        }
    }
    
    struct TableView_Previews: PreviewProvider {
        static var previews: some View {
            TableView()
        }
}
