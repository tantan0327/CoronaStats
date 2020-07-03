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
                    ForEach(covidFetch.allCountries.filter{
                        self.searchText.isEmpty ? true : $0.name.lowercased().contains(self.searchText.lowercased())
                    }, id: \.name) { countryData in
                        
                        NavigationLink(destination: CountryDetailView(countryData: countryData)) {
                            CountryDataRowView(countryData: countryData)
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
