//
//  CovidFetchRequest.swift
//  CoronaStats
//
//  Created by Atsuya Tange on 2020/07/01.
//  Copyright © 2020 Atsuya Tange. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON


class CovidFetchRequest: ObservableObject {
    
    @Published var allCountries: [CountryData] = []
    @Published var totalData: TotalData = testTotalData
    
    let headers: HTTPHeaders = [
        "x-rapidapi-host": "hostname",
        "x-rapidapi-key": "key"
    ]
    
    init() {
        getCurrentTotal()
        getAllCountries()
    }
    
    func getCurrentTotal() {
        
        AF.request("https://covid-19-data.p.rapidapi.com/totals?format=json", headers: headers).responseJSON { response in
            
            let result = response.data
            
            if result != nil {
                
                let json = JSON(result!)
                let confirmed = json[0]["confirmed"].intValue
                let deaths = json[0]["deaths"].intValue
                let recovered = json[0]["recovered"].intValue
                let critical = json[0]["critical"].intValue
                
                self.totalData = TotalData(confirmed: confirmed, critical: critical, deaths: deaths, recovered: recovered)

            } else {
                self.totalData = testTotalData
            }
            
        }
    }
    
    
    func getAllCountries() {
        
        // TODO: コロナの感染状況を取得するフリーのREST APIを探す
        AF.request("https://covid-19-data.p.rapidapi.com/help/countries?format=json", headers: headers).responseJSON { response in
            
            let result = response.value
            var allCount: [CountryData] = []
                        
            if result != nil {
                
                let dataDictionary = result as! [Dictionary<String, AnyObject>]
                
                for countryData in dataDictionary {
                    let name = countryData["name"] as? String ?? "Error"
                    let longitude = countryData["longitude"] as? Double ?? 0.0
                    let latitude = countryData["latitude"] as? Double ?? 0.0
                    
                    let countryObject = CountryData(name: name, longitude: longitude, latitude: latitude)
                    allCount.append(countryObject)
                }
                
            }
            
            // TODO: ソート順
            self.allCountries = allCount
        }
        
    }
}
