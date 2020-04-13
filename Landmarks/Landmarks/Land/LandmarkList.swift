//
//  LandmarkList.swift
//  Landmarks
//
//  Created by SRS on 2020/3/20.
//  Copyright © 2020 agora. All rights reserved.
//

import SwiftUI

struct LandmarkList<DetailView: View>: View {
    
    //    @State var showFavoritesOnly = false
    @EnvironmentObject var userData: UserData
    
    let detailViewProducer: (Landmark) -> DetailView
    
    var body: some View {
        //        NavigationView {
        //
        //            List {
        //
        //                Toggle(isOn: self.$userData.showFavoritesOnly) {
        //                    Text("Favorites only")
        //                }
        //
        //                ForEach(userData.landmarks) { landmark in
        //                    if !self.userData.showFavoritesOnly || landmark.isFavorite {
        //
        //                        NavigationLink(destination: LandmarkDetail(landmark: landmark ).environmentObject(self.userData)) {
        //                            LandmarkRow(landmark: landmark)
        //                        }
        //
        //                    }
        //                }
        //            }.navigationBarTitle(Text("Landmarks"))
        
        
        List {
            Toggle(isOn: self.$userData.showFavoritesOnly) {
                Text("Favorites only")
            }
            
            ForEach(userData.landmarks) { landmark in
                if !self.userData.showFavoritesOnly || landmark.isFavorite {
                    NavigationLink(
                    destination: self.detailViewProducer(landmark).environmentObject(self.userData)) {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
        }
        .navigationBarTitle(Text("Landmarks"))
    }
}

#if os(watchOS)
typealias PreviewDetailView = WatchLandmarkDetail
#else
typealias PreviewDetailView = LandmarkDetail
#endif

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone XS Max"], id: \.self) { deviceName in
            
            LandmarkList { (landmark) -> PreviewDetailView in
                PreviewDetailView(landmark: landmark)
            }
            .previewDevice(PreviewDevice(rawValue: deviceName))
            .previewDisplayName(deviceName)
        }
        .environmentObject(UserData())
    }
}
