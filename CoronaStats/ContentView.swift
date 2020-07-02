//
//  ContentView.swift
//  CoronaStats
//
//  Created by Atsuya Tange on 2020/07/01.
//  Copyright © 2020 Atsuya Tange. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView {
            RecentView()
                .tabItem {
                    Tab(imageName: "chart.bar", text: "Recent")
            }
            .tag(0)
            
            //map
        }
        
    }
}

private struct Tab: View {
    
    let imageName: String
    let text: String
    
    var body: some View {
        VStack {
            Image(systemName: imageName)
            Text(text)
        }
    }
}
