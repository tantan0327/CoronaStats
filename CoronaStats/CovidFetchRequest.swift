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
    
    init() {
        getCurrentTotal()
    }
    
    func getCurrentTotal() {
        
        let headers: HTTPHeaders = [
            "x-rapidapi-host": "covid-19-data.p.rapidapi.com",
            "x-rapidapi-key": "5142dd158bmshaf048e9888d4501p1b0000jsn5f21ac36a157"
        ]
        
        AF.request("https://covid-19-data.p.rapidapi.com/totals?format=json", headers: headers).responseJSON { response in
            
            let result = response.data
            
            if result != nil {
                
                let json = JSON(result!)
//                print(json)
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
}
