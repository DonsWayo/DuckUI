//
//  D_ActivityController.swift
//  DuckUI
//
//  Created by Alex Nagy on 21/07/2019.
//

import UIKit

struct D_ActivityController {
    
    public static func share(title: String, message: String, image: UIImage) {
        
        let objectsToShare = [
            title,
            message,
            image.withRenderingMode(.alwaysOriginal)
            ] as [Any]
        
        let activityVC: UIActivityViewController = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
        
        activityVC.setValue(title, forKey: "Subject")
        
        if let topVC = UIApplication.getTopMostViewController() {
            // added for iPad
            activityVC.popoverPresentationController?.sourceView = topVC.view
            
            topVC.present(activityVC, animated: true, completion: nil)
        }
        
    }
    
    public static func share(title: String, message: String, url: URL, completion: @escaping () -> ()) {
        
        let formattedMessage = """
        
        \(message)
        """
        
        let objectsToShare = [
            title,
            formattedMessage,
            url
            ] as [Any]
        
        let activityVC: UIActivityViewController = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
        
        activityVC.setValue(title, forKey: "Subject")
        
        if let topVC = UIApplication.getTopMostViewController() {
            // added for iPad
            activityVC.popoverPresentationController?.sourceView = topVC.view
            
            topVC.present(activityVC, animated: true) {
                completion()
            }
        }
        
    }
    
}

