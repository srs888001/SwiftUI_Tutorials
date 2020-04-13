//
//  UserData.swift
//  Landmarks
//
//  Created by SRS on 2020/3/22.
//  Copyright © 2020 agora. All rights reserved.
//

import SwiftUI
import Combine

final class UserData: ObservableObject  {
    @Published var showFavoritesOnly = false
    @Published var landmarks = landmarkData
    @Published var profile = Profile.default
}
