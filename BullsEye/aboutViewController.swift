//
//  aboutViewController.swift
//  BullsEye
//
//  Created by 戴林 on 2018/7/22.
//  Copyright © 2018年 dailin. All rights reserved.
//

import UIKit

class aboutViewController: UIViewController {
    
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let url = Bundle.main.url(forResource: "BullsEye", withExtension: "html") {
            if let htmlData = try? Data(contentsOf: url) {
                let baseURL = URL(fileURLWithPath: Bundle.main.bundlePath)
                print("url is : \(url)" + "\nBundle path is: \(Bundle.main.bundlePath)" + "\nbase URL is :\(baseURL)")
                webView.load(htmlData, mimeType: "text/html", textEncodingName: "UTF-8", baseURL: baseURL)
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func close() {
        dismiss(animated: true, completion: nil)
    }
    
    

}
