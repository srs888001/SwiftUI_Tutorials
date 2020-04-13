//
//  FeaturedLandmarks.swift
//  Landmarks
//
//  Created by SRS on 2020/3/23.
//  Copyright © 2020 agora. All rights reserved.
//

import SwiftUI

struct FeaturedLandmarks: View {
    var landmarks: [Landmark]
    var body: some View {
        landmarks[0].image.resizable()
    }
}

struct FeaturedLandmarks_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedLandmarks(landmarks: landmarkData)
    }
}
