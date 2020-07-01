//
//  ContentView.swift
//  CoronaStats
//
//  Created by Atsuya Tange on 2020/07/01.
//  Copyright © 2020 Atsuya Tange. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var covidFetch = CovidFetchRequest()
    
    var body: some View {
        Text("\(covidFetch.totalData.confirmed)")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
