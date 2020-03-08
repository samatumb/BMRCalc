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
    var day: Date
    var weight: Double
}


struct WeeklyDataRow: View {
    var data: WeeklyData
    var dateString: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        formatter.dateStyle = .short
        return formatter.string(from: data.day)
    }
        
    var body: some View {
        
        HStack {
            Text("неделя \(data.week)")
                .font(.body)
                .foregroundColor(Color.customPurpleLight)
            Spacer()
            Text(dateString)
                .font(.body)
                .foregroundColor(Color.customPurpleLight)
            Spacer()
            Text(String(format: "%.1f", data.weight))
                .font(.body)
                .foregroundColor(Color.customPurpleLight)
        }
    }
}

struct Step4: View {
    @EnvironmentObject var userData: UserData
    var listArray: [WeeklyData] {
        var wk = 0
        var day = Date()
        var wg = userData.weight
        var arr = [WeeklyData(week: wk, day: day ,weight: wg)]
        for _ in 1...userData.weeksToFatLose {
            wk += 1
            day = day.addingTimeInterval(86400 * 7)
            wg -= userData.fatLosePerWeek
            arr.append(WeeklyData(week: wk, day: day, weight: wg))
        }
        return arr
    }
    var body: some View {
        
        List(listArray) { element in
            WeeklyDataRow(data: element)
        }
        
    }
}

