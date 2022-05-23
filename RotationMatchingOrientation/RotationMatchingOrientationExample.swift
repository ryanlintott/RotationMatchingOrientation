//
//  RotationMatchingOrientationExample.swift
//  FrameUpExample
//
//  Created by Ryan Lintott on 2022-04-05.
//

import SwiftUI

struct RotationMatchingOrientationExample: View {
    @State private var portrait: Bool = true
    @State private var landscapeLeft: Bool = true
    @State private var landscapeRight: Bool = true
    @State private var portraitUpsideDown: Bool = true
    
    var allowedOrientations: [InterfaceOrientation] {
        zip(
            [
                portrait,
                landscapeLeft,
                landscapeRight,
                portraitUpsideDown
            ],
            [
                InterfaceOrientation.portrait,
                InterfaceOrientation.landscapeLeft,
                InterfaceOrientation.landscapeRight,
                InterfaceOrientation.portraitUpsideDown
            ]
        )
        .compactMap { $0 ? $1 : nil }
    }
    
    func face(text: String) -> some View {
        VStack {
            Image(systemName: "face.smiling")
                .resizable()
                .scaledToFit()
                .frame(height: 40)
            Button {
                print("clicked")
            } label: {
                Text(text)
            }
        }
    }
    
    var body: some View {
        VStack {
            VStack {
                Image(systemName: "face.smiling")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 40)
                
                Text("Control this view's orientation with the settings below")
            }
            .foregroundColor(.white)
            .padding()
            .background(.blue)
            .cornerRadius(20)
                .rotationMatchingOrientation(allowedOrientations)
            
            VStack {
                Toggle("Portrait", isOn: $portrait)
                Toggle("LandscapeLeft", isOn: $landscapeLeft)
                Toggle("LandscapeRight", isOn: $landscapeRight)
                Toggle("PortraitUpsideDown", isOn: $portraitUpsideDown)
            }
            .padding()
        }
    }
}

struct RotationMatchingOrientationExample_Previews: PreviewProvider {
    static var previews: some View {
        RotationMatchingOrientationExample()
            .previewInterfaceOrientation(.portrait)
    }
}
