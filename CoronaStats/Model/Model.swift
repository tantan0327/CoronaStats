//
//  Model.swift
//  CoronaStats
//
//  Created by Atsuya Tange on 2020/07/01.
//  Copyright © 2020 Atsuya Tange. All rights reserved.
//

import Foundation

struct TotalData {
    
    let confirmed: Int
    let critical: Int
    let deaths: Int
    let recovered: Int
    
    var fatalityRate: Double {
        return (100.00 * Double(deaths) / Double(confirmed))
    }
    
    var recoveredRate: Double {
        return (100.00 * Double(recovered) / Double(confirmed))
    }

}

struct CountryData {
    
    let name: String
    let longitude: Double
    let latitude: Double

}

struct DetailedCountryData {
    
    let country: String
    let confirmedCases: Int
    let newCases: Int
    let recoveredCases: Int
    let criticalCases: Int
    let activeCases: Int
    let deaths: Int
    let newDeaths: Int
    let testsDone: Int
    
    var fatalityRate: Double {
        return (100.00 * Double(deaths) / Double(confirmedCases))
    }

    var recoveredRate: Double {
        return (100.00 * Double(recoveredCases) / Double(confirmedCases))
    }

}

let testTotalData = TotalData(confirmed: 200, critical: 100, deaths: 20, recovered: 50)
let testDetailedCountryData = DetailedCountryData(country: "Japan", confirmedCases: 100, newCases: 200, recoveredCases: 300, criticalCases: 400, activeCases: 500, deaths: 600, newDeaths: 700, testsDone: 800)
