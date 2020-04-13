//
//  ProfileHost.swift
//  Landmarks
//
//  Created by SRS on 2020/3/30.
//  Copyright © 2020 agora. All rights reserved.
//

import SwiftUI

struct ProfileHost: View {
    @Environment(\.editMode) var mode
    @EnvironmentObject var userData: UserData
    @State var draftProfile = Profile.default
    
//  for system present
//    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    // for fullScreen present
    @Environment(\.viewController) private var viewControllerHolder: ViewControllerHolder
    private var viewController: UIViewController? {
        self.viewControllerHolder.value
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                if self.mode?.wrappedValue == .active {
                    Button("Cancel") {
                        self.draftProfile = self.userData.profile
                        self.mode?.animation().wrappedValue = .inactive
                    }
                }
                
                Spacer()
                
                Button(action: {
                    //  for system present
                    // self.presentationMode.wrappedValue.dismiss()

                    // for fullScreen present
                    self.viewController?.dismiss()
                }) {
                  Text("Dismiss")
                }
                
                EditButton()
            }
            
            if self.mode?.wrappedValue == .inactive {
                ProfileSummary(profile: userData.profile)
            } else {
                ProfileEditor(profile: $draftProfile)
                .onAppear {
                    self.draftProfile = self.userData.profile
                }
                .onDisappear {
                    self.userData.profile = self.draftProfile
                }
            }
        }
        .padding()
    }
}

struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
         ProfileHost().environmentObject(UserData())
    }
}
