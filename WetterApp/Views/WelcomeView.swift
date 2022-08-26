//
//  WelcomeView.swift
//  WetterApp
//
//  Created by Domenic Moran on 26.08.22.
//

import SwiftUI
import CoreLocationUI

struct WelcomeView: View {
    
    @EnvironmentObject var locationManager: LocationManager
    
    var body: some View {
        VStack {
            VStack(spacing: 20) {
                Text("Willkommen zur Wetter App")
                    .bold()
                    .font(.title)
                
                Text("Bitte geben Sie Ihren Standort ein, um das Wetter in ihres Standortes zu erhalten")
                    .padding()
            }
            .multilineTextAlignment(.center)
            .padding()
                        
            LocationButton(.shareCurrentLocation) {
                locationManager.requestLocation()
                
            }
            .labelStyle(.iconOnly)
            .cornerRadius(30)
            .symbolVariant(.fill)
            .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
