//
//  ViewController.swift
//  OAuth2Sample
//
//  Created by Michael Bass on 12/17/18.
//  Copyright © 2018 mss. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    private let http = Http(baseURL: "https://www.googleapis.com")

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       
        

        let googleConfig = GoogleConfig(
            clientId: "183257623569-agdm3f7fegk53q6buds11p8312cgnvdg.apps.googleusercontent.com",
            scopes:["https://www.googleapis.com/auth/drive"])
        
        
       // let campfireConfig = CampfireConfig(
       //     clientId: "nih_toolbox",clientSecret: "clientSecret goes here",
       //     scopes:["https://www.googleapis.com/auth/drive"])
        
        
        let gdModule = AccountManager.addGoogleAccount(config: googleConfig)
       // let gdModule2 = AccountManager.addCampfireAccount(config: campfireConfig)
        
        http.authzModule = gdModule
        // http.authzModule = gdModule2
        
        if let image = UIImage(named:"sample.png") {
            if let data = image.pngData() as Data?  {
                
                    let multipartData = MultiPartData(data: data,
                                                          name: "image",
                                                          filename: "incognito_photo",
                                                          mimeType: "image/png")
                    let multipartArray =  ["file": multipartData]
                
                    http.request(method: .post, path: "/upload/drive/v2/files",  parameters: multipartArray) {
                            (response, error) in
                            if (error != nil) {
                                NSLog(error!.localizedDescription) //self.presentAlert("Error", message: error!.localizedDescription)
                            } else {
                               NSLog("Successfully uploaded") // self.presentAlert("Success", message: "Successfully uploaded!")
                            }
                    }
            }
        }
        
    }


}

