//
//  ProfileSummary.swift
//  Landmarks
//
//  Created by SRS on 2020/3/30.
//  Copyright © 2020 agora. All rights reserved.
//

import SwiftUI

struct ProfileSummary: View {
    
    var profile: Profile
    
    let goalFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .none
        return formatter
    }()
    
    init(profile: Profile) {
        UITableView.appearance().tableFooterView = UIView()
        UITableView.appearance().separatorStyle = .none
        self.profile = profile
    }
    
    var body: some View {
  
        List() {
            Text(profile.username)
                .bold()
                .font(.title)
            
            Divider()
            
            Text("Notifications: \(self.profile.prefersNotifications ? "On": "Off" )")
            Text("Seasonal Photos: \(self.profile.seasonalPhoto.rawValue)")
            Text("Goal Date: \(self.profile.goalDate, formatter: self.goalFormat)")
            
            Divider()
            
            VStack(alignment: .leading) {
                Text("Completed Badges")
                    .font(.headline)
                ScrollView {
                    HStack {
                        HikeBadge(name: "First Hike")
                        
                        HikeBadge(name: "Earth Day")
                            .hueRotation(Angle(degrees: 90))
                        
                        HikeBadge(name: "Tenth Hike")
                            .grayscale(0.5)
                            .hueRotation(Angle(degrees: 45))
                    }
                }
                .frame(height: 120)
            }
            
            Divider()
            
            VStack(alignment: .leading, spacing: 0) {
                Text("Recent Hikes")
                    .font(.headline)
            
                HikeView(hike: hikeData[0])
            }
        }.listStyle(PlainListStyle())
            //.environment(\.defaultMinListRowHeight, 10)
    }
}

struct ProfileSummary_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSummary(profile: Profile.default)
    }
}
