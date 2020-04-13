//
//  CircleImage.swift
//  Landmarks
//
//  Created by SRS on 2020/3/19.
//  Copyright © 2020 agora. All rights reserved.
//

import SwiftUI

struct CircleImage: View {
    
    var shadowRadius: CGFloat = 10
//    @State var name: String = "turtlerock"
//
//    var body: some View {
//        Image(name)
//        .clipShape(Circle())
//            .overlay(Circle().stroke(Color.gray, lineWidth: 4))
//        .shadow(radius: 10)
//    }
    
    var image: Image

    var body: some View {
        image
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: shadowRadius)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: Image("turtlerock"))
    }
}
