//
//  ContentView.swift
//  WatchLandmarks Extension
//
//  Created by SRS on 2020/4/9.
//  Copyright © 2020 agora. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList { WatchLandmarkDetail(landmark: $0) }
            .environmentObject(UserData())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
