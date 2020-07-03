//
//  CountryDetailView.swift
//  CoronaStats
//
//  Created by Atsuya Tange on 2020/07/03.
//  Copyright © 2020 Atsuya Tange. All rights reserved.
//

import SwiftUI

struct CountryDetailView: View {
    
    var countryData: CountryData
    
    var body: some View {
        
        VStack {
            
            VStack {
                CountryDetailRow(number: "1000", name: "Confirmed")
                    .padding(.top)
                CountryDetailRow(number: "100", name: "Critical", color: .yellow)
                CountryDetailRow(number: "100", name: "Deaths", color: .red)
                CountryDetailRow(number: "42", name: "Death %", color: .red)
                CountryDetailRow(number: "10", name: "Recovered", color: .green)
                CountryDetailRow(number: "11", name: "Recovered %", color: .green)
    //            CountryDetailRow(number: countryData.deaths.formatNumber(), name: "Recovered %", color: .green)

    //            CountryDetailRow(number: String(format: "%.2f", countryData.recoveredRate), name: "Recovered %", color: .green)

                
            }
            .background(Color("cardBackgroundGray"))
            .cornerRadius(8)
            .padding()
            
            Spacer()
        }
        .padding(.top, 50)
        .navigationBarTitle(countryData.name)
    }
}

struct CountryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CountryDetailView(countryData: testCountryData)
    }
}
