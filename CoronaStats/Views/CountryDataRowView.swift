//
//  CountryDataRowView.swift
//  CoronaStats
//
//  Created by Atsuya Tange on 2020/07/03.
//  Copyright © 2020 Atsuya Tange. All rights reserved.
//

import SwiftUI

struct CountryDataRowView: View {
    
    var detailedCountryData: DetailedCountryData
    
    var body: some View {
        
        HStack {
            Text(detailedCountryData.country)
                .fontWeight(.medium)
                .font(.subheadline)
                .lineLimit(2)
                .frame(width: 110, alignment: .leading)
            
            Spacer()

            // TODO: changeData
            // conf
            Text(String(detailedCountryData.confirmedCases))
                .lineLimit(1)
                .minimumScaleFactor(0.7)
                .frame(width: 50, height: 40, alignment: .center)
                .font(.subheadline)
                .padding(.leading, 5)
            
            Spacer()
            
            // death
            Text(String(detailedCountryData.deaths))
                .lineLimit(1)
                .minimumScaleFactor(0.7)
                .frame(width: 50, height: 40, alignment: .center)
                .font(.subheadline)
                .foregroundColor(.red)
                .padding(.leading, 5)
            
            Spacer()
            
            // recover
            Text(String(detailedCountryData.recoveredCases))
                .lineLimit(1)
                .minimumScaleFactor(0.7)
                .frame(width: 50, height: 40, alignment: .center)
                .font(.subheadline)
                .foregroundColor(.green)
                .padding(.leading, 5)
        }
    }
}

struct CountryDataRowView_Previews: PreviewProvider {
    static var previews: some View {
        CountryDataRowView(detailedCountryData: testDetailedCountryData)
    }
}
