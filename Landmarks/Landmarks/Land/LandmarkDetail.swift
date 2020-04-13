//
//  ContentView.swift
//  Landmarks
//
//  Created by SRS on 2020/3/19.
//  Copyright © 2020 agora. All rights reserved.
//

import SwiftUI

struct LandmarkDetail: View {
    
    @EnvironmentObject var userData: UserData
    var landmark: Landmark
    
    var landmarkIndex: Int {
        userData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }
    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: true) {
            
            VStack {
                HikeView(hike: hikeData[0])
                .padding()
                
                MapView(coordinate: landmark.locationCoordinate)
                    .edgesIgnoringSafeArea(.top)
                    .frame(height: 300)
                                
                CircleImage(image: landmark.image)
                    .offset(y: -130)
                    .padding(.bottom, -130)
                    .onTapGesture {
                        print("onTapGesture")
                }
                
                VStack(alignment: .leading, spacing: 1) {
                    
                    HStack {
                        
                        Text(landmark.name)
                            .font(.title)
                        
                        Button(action: {
                            self.userData.landmarks[self.landmarkIndex].isFavorite.toggle()
                        }) {
                            if self.userData.landmarks[self.landmarkIndex].isFavorite {
                                Image(systemName: "star.fill")
                                    .foregroundColor(Color.yellow)
                            } else {
                                Image(systemName: "star")
                                    .foregroundColor(Color.gray)
                            }
                        }
                    }
                    
                    HStack {
                        Text(landmark.park)
                            .font(.subheadline)
                        Spacer()
                        Text(landmark.state)
                            .font(.subheadline)
                        
                    }
                }
                .padding()
            }
        }
        .navigationBarTitle(Text(landmark.name), displayMode: .inline)
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkDetail(landmark: landmarkData[0])
            .environmentObject(UserData())
    }
}
