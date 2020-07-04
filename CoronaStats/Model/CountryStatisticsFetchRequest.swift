//
//  CountryStatisticsFetchRequest.swift
//  CoronaStats
//
//  Created by Atsuya Tange on 2020/07/04.
//  Copyright © 2020 Atsuya Tange. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class CountryStatisticsFetchRequest: ObservableObject {

    @Published var allCountries: [DetailedCountryData] = []
    @Published var detailedCountryData: DetailedCountryData?
    
    let headers: HTTPHeaders = [
        "x-rapidapi-host": "covid-193.p.rapidapi.com",
        "x-rapidapi-key": "5142dd158bmshaf048e9888d4501p1b0000jsn5f21ac36a157"
    ]
    
    init() {
        getAllCountriesStats()
    }
    
    func getStatsFor(country: String) {
        
        AF.request("https://covid-193.p.rapidapi.com/statistics?country=\(country)", headers: headers).responseJSON { response in
            
            let result = response.data
            
            if result != nil {
                
                let json = JSON(result!)
                
                let country = json["response"][0]["country"].stringValue
                let deaths = json["response"][0]["deaths"]["total"].intValue
                let newDeaths = json["response"][0]["deaths"]["new"].intValue
                let tests = json["response"][0]["tests"]["total"].intValue
                let criticalCases = json["response"][0]["cases"]["critical"].intValue
                let totalCases = json["response"][0]["cases"]["total"].intValue
                let activeCases = json["response"][0]["cases"]["active"].intValue
                let newCases = json["response"][0]["cases"]["new"].intValue
                let recoveredCases = json["response"][0]["cases"]["recovered"].intValue
                
                self.detailedCountryData = DetailedCountryData(country: country, confirmedCases: totalCases, newCases: newCases, recoveredCases: recoveredCases, criticalCases: criticalCases, activeCases: activeCases, deaths: deaths, newDeaths: newDeaths, testsDone: tests)
                
            }
            
        }
    }
    
    func getAllCountriesStats() {
        
        AF.request("https://covid-193.p.rapidapi.com/statistics", headers: headers).responseJSON { response in
            
            let result = response.data
            var allCount: [DetailedCountryData] = []
                        
            if result != nil {
                let jsonObj = JSON(result!)
                if let dataArray = jsonObj ["response"].array {
                    for countryData in dataArray {
                        let country = countryData["country"].string
                        let deaths = countryData["deaths"]["total"].intValue
                        let totalCases = countryData["cases"]["total"].intValue
                        let recoveredCases = countryData["cases"]["recovered"].intValue
                        
                        let countryObject = DetailedCountryData(country: country!, confirmedCases: totalCases, newCases: 0, recoveredCases: recoveredCases, criticalCases: 0, activeCases: 0, deaths: deaths, newDeaths: 0, testsDone: 0)
                        allCount.append(countryObject)
                    }
                }
                
            }
            
            // TODO: ソート順
            self.allCountries = allCount
        }
        
    }

    
}

