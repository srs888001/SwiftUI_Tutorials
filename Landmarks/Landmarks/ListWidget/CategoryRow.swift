//
//  CategoryRow.swift
//  Landmarks
//
//  Created by SRS on 2020/3/23.
//  Copyright © 2020 agora. All rights reserved.
//

import SwiftUI

struct CategoryRow: View {
    
    var categoryName: String
    var items: [Landmark]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(self.categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(self.items) { landmark in
                        NavigationLink(
                            destination: LandmarkDetail(
                                landmark: landmark
                            )
                        ) {
                            CategoryItem(landmark: landmark)
                        }
                    }
                }
            }
            .frame(height: 185)
        }
    }
}
    
    struct CategoryRow_Previews: PreviewProvider {
        static var previews: some View {
            CategoryRow(
                categoryName: landmarkData[1].category.rawValue,
                items: Array(landmarkData.prefix(3))
            )
        }
}
