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
    @ObservedObject var test = CountryStatisticsFetchRequest()
    
    @State var searchText = ""
    @State var isSearchVisible = false
    
    var body: some View {
        
        NavigationView {
            VStack {
                
                if isSearchVisible {
                    SearchView(searchText: $searchText)
                }
                
                TotalDataView(totalData: covidFetch.totalData)
                ListHeaderView()
                List {
                    ForEach(test.allCountries.filter{
                        self.searchText.isEmpty ? true : $0.country.lowercased().contains(self.searchText.lowercased())
                    }, id: \.country) { countryData in
                        NavigationLink(destination: CountryDetailView(countryName: countryData.country)) {
                            CountryDataRowView(detailedCountryData: countryData)
                        }
                    }
                }
            }
            .navigationBarTitle("Recent Data", displayMode: .inline)
            .navigationBarItems(trailing:
                Button(action: {
                    self.isSearchVisible.toggle()
                    
                    if !self.isSearchVisible {
                        self.searchText = ""
                    }
                    
                }, label: {
                    Image(systemName: "magnifyingglass")
                }
                )
            )
        }
    }
}

struct RecentView_Previews: PreviewProvider {
    static var previews: some View {
        RecentView()
    }
}
