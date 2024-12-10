//
//  ContentView.swift
//  camera
//
//  Created by Vishnu Varma on 10/12/24.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    
    @StateObject private var cameraAccess = CameraAccess();
    
    
    var body: some View {
        Text("Camera App")
    }
}


#Preview {
    ContentView()
}


