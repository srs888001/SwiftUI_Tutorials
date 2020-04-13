//
//  CategoryHome.swift
//  Landmarks
//
//  Created by SRS on 2020/3/23.
//  Copyright © 2020 agora. All rights reserved.
//

import SwiftUI

struct CategoryHome: View {
    
    var categories: [String: [Landmark]] {
        Dictionary(
            grouping: landmarkData,
            by: { $0.category.rawValue }
        )
    }
    
    var featured: [Landmark] {
        landmarkData.filter { $0.isFeatured }
    }
    
    @State var showingProfile = false
    
    @EnvironmentObject var userData: UserData
    
    @State private var navigationSelectionTag: Int? = 0
    
    
    @Environment(\.viewController) private var viewControllerHolder: ViewControllerHolder
    private var viewController: UIViewController? {
        self.viewControllerHolder.value
    }
    
    var profileButton: some View {
        
        Button(action: {
            
            // for fullScreen present
            self.viewController?.present(style: .fullScreen) {
                ProfileHost().environmentObject(self.userData)
            }
            
            //            for system present
            //            self.showingProfile.toggle()
            
            
            //            for push
            //            self.navigationSelectionTag = 1
        }) {
            Image(systemName: "person.crop.circle")
                .imageScale(.large)
                .accessibility(label: Text("User Profile"))
                .padding()
        }
        
    }
    
    var body: some View {
        NavigationView {
            
            VStack {
                NavigationLink(destination:
                ProfileHost().environmentObject(self.userData), tag: 1, selection: self.$navigationSelectionTag) {
                    EmptyView()
                }
                
                List {
                    //                                    FeaturedLandmarks(landmarks: featured)
                    //                                        .scaledToFill()
                    //                                        .frame(height: 200)
                    //                                        .clipped()
                    //                                        .listRowInsets(EdgeInsets())
                    
                    PageView(features.map { FeatureCard(landmark: $0) })
                        .aspectRatio(3/2, contentMode: .fit)
                        .listRowInsets(EdgeInsets())
                    
                    
                    
                    ForEach(categories.keys.sorted(), id: \.self) { key in
                        CategoryRow(categoryName: key, items: self.categories[key]!)
                    }
                    .listRowInsets(EdgeInsets())
                    
                    NavigationLink(destination: LandmarkList(detailViewProducer: { (landmark) -> LandmarkDetail in
                        
                        LandmarkDetail(landmark: landmark)
                        
                    })) {
                        Text("See All")
                    }
                }
                .navigationBarTitle(Text("Featured"))
                .navigationBarItems(trailing: profileButton)
                
                //for system present
                //                .sheet(isPresented: self.$showingProfile, onDismiss: {
                //                    print("onDismiss")
                //                }) {
                //                    ProfileHost().environmentObject(self.userData)
                //                }
            }
        }
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome().environmentObject(UserData())
    }
}
