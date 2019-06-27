//
//  LandmarkDetail.swift
//  05-Animating-Views-and-Transitions
//
//  Created by swae on 2019/6/15.
//  Copyright © 2019 xiaoyuan. All rights reserved.
//

import SwiftUI

struct LandmarkDetail : View {
    
    @EnvironmentObject var userData: UserData
    
    var landmark: Landmark
    
    var landmarkIndex: Int {
        userData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }
    
    var body: some View {
        
        VStack {
            
            MapView(coordinate: landmark.locationCoordinate)
                .edgesIgnoringSafeArea(.top)
                .frame(height: 300)
            
            CircleImage(image: landmark.image(forSize: 250))
                .offset(x: 0,  y: -130)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading) {
                
                
                HStack {
                    Text(verbatim: landmark.name)
                        .font(.title)
                    
                        Button(action: {
                            self.userData.landmarks[self.landmarkIndex].isFavorite.toggle()
                        }) {
                            if self.userData.landmarks[landmarkIndex].isFavorite {
                                Image(systemName: "star.fill")
                                    .foregroundColor(.yellow)
                            }
                            else {
                                Image(systemName: "star")
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                
                    HStack(alignment: .top) {
                        Text(verbatim: landmark.park)
                            .font(.subheadline)
                            Text(verbatim: landmark.state)
                                .font(.subheadline)
                        }
                    }
                    .padding()
                    Spacer()
            }
    }
}

#if DEBUG
struct LandmarkDetail_Previews : PreviewProvider {
    static var previews: some View {
        LandmarkDetail(landmark: landmarkData[0])
            .environmentObject(UserData())
    }
}
#endif
