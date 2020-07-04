//
//  MaoContainerView.swift
//  CoronaStats
//
//  Created by Atsuya Tange on 2020/07/04.
//  Copyright © 2020 Atsuya Tange. All rights reserved.
//

import SwiftUI

struct MapContainerView: View {
    
    @ObservedObject var covidFetch = CovidFetchRequest()
    
    var body: some View {
        MapView(countryData: $covidFetch.allCountries)
    }
}

struct MaoContainerView_Previews: PreviewProvider {
    static var previews: some View {
        MapContainerView()
    }
}
