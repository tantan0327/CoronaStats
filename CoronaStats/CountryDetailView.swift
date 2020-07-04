//
//  CountryDetailView.swift
//  CoronaStats
//
//  Created by Atsuya Tange on 2020/07/03.
//  Copyright © 2020 Atsuya Tange. All rights reserved.
//

import SwiftUI

struct CountryDetailView: View {
    
    @ObservedObject var countryStatisticsFetchRequest = CountryStatisticsFetchRequest()
    var countryName: String
    
    var body: some View {
        
        VStack {
            
            VStack {
                CountryDetailRow(number: countryStatisticsFetchRequest.detailedCountryData?.confirmedCases.formatNumber() ?? "Err" , name: "Confirmed")
                    .padding(.top)
                CountryDetailRow(number: countryStatisticsFetchRequest.detailedCountryData?.activeCases.formatNumber() ?? "Err", name: "ActiveCases")
                CountryDetailRow(number: "+" + (countryStatisticsFetchRequest.detailedCountryData?.newCases.formatNumber() ?? "Err"), name: "New Cases")
                CountryDetailRow(number: countryStatisticsFetchRequest.detailedCountryData?.recoveredCases.formatNumber() ?? "Err", name: "Recovered Cases", color: .green)
                CountryDetailRow(number: countryStatisticsFetchRequest.detailedCountryData?.criticalCases.formatNumber() ?? "Err", name: "Critical Cases", color: .yellow)
                CountryDetailRow(number: countryStatisticsFetchRequest.detailedCountryData?.deaths.formatNumber() ?? "Err", name: "Deaths", color: .red)
                CountryDetailRow(number: countryStatisticsFetchRequest.detailedCountryData?.newCases.formatNumber() ?? "Err", name: "New Deaths", color: .red)
                CountryDetailRow(number: countryStatisticsFetchRequest.detailedCountryData?.testsDone.formatNumber() ?? "Err", name: "Tests Done", color: .yellow)
                CountryDetailRow(number: String(format: "%.2f", countryStatisticsFetchRequest.detailedCountryData?.fatalityRate ?? 0.0) + "%", name: "Fatality Rate", color: .red)
                CountryDetailRow(number: String(format: "%.2f", countryStatisticsFetchRequest.detailedCountryData?.recoveredRate ?? 0.0) + "%", name: "Recovery Rate", color: .green)

                
            }
            .background(Color("cardBackgroundGray"))
            .cornerRadius(8)
            .padding()
            
            Spacer()
        }
        .padding(.top, 25)
        .navigationBarTitle(countryName)
        .onAppear() {
            self.getStatistics()
        }
    }
    
    private func getStatistics() {
        countryStatisticsFetchRequest.getStatsFor(country: self.countryName.replacingOccurrences(of: " ", with: "-"))
    }
}
