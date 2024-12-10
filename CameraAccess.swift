//
//  CameraAccess.swift
//  camera
//
//  Created by Vishnu Varma on 10/12/24.
//

import Foundation
import AVFoundation
import SwiftUI

class CameraAccess:  ObservableObject{
    
    private var captureSession = AVCaptureSession();
    
    init() {
        Task {
            await setUpCaptureSession();
        }
    }
    
    // setting the permissions
    var isAuthorized: Bool {
        get async {
            let status = AVCaptureDevice.authorizationStatus(for: .video)
            
            var isAuthorized = status == .authorized
            
            if status == .notDetermined {
                isAuthorized = await AVCaptureDevice.requestAccess(for: .video)
            }
            
            return isAuthorized
        }
    }
    
    // run the permissions function
    func setUpCaptureSession() async {
        guard await isAuthorized else {return}
    }
    
    
    func setupCaptureSession() {
        captureSession.beginConfiguration()
        let videoDevice = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .unspecified)
        guard
            let videoDeviceInput = try? AVCaptureDeviceInput(device: videoDevice!),
            captureSession.canAddInput(videoDeviceInput)
        else {return}
        captureSession.addInput(videoDeviceInput)
            
    }
    
    
}


class CameraPreview: UIView {
    override class var layerClass: AnyClass {
        return AVCaptureVideoPreviewLayer.self
    }
    
    var videoPreviewLayer: AVCaptureVideoPreviewLayer {
        return layer as! AVCaptureVideoPreviewLayer
    }
}
