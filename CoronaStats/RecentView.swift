//
//  RecentView.swift
//  CoronaStats
//
//  Created by Atsuya Tange on 2020/07/03.
//  Copyright © 2020 Atsuya Tange. All rights reserved.
//

import SwiftUI

struct RecentView: View {
    
    @ObservedObject var covidFetch = CovidFetchRequest()
    @State var searchText = ""
    
    var body: some View {
        NavigationView {
            VStack {
                ListHeaderView()
                List {
                    ForEach(covidFetch.allCountries.filter{
                        self.searchText.isEmpty ? true : $0.name.lowercased().contains(self.searchText.lowercased())
                    }, id: \.name) { countryData in
                        CountryDataRowView(countryData: countryData)
                    }
                }
            }
        }
    }
}

struct RecentView_Previews: PreviewProvider {
    static var previews: some View {
        RecentView()
    }
}
