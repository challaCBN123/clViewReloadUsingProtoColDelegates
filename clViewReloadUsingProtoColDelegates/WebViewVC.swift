//
//  WebViewVC.swift
//  clViewReloadUsingProtoColDelegates
//
//  Created by Bhargava on 14/08/20.
//  Copyright © 2020 Bhargava. All rights reserved.
//

import UIKit
import WebKit
class WebViewVC: UIViewController {
let url = URL(string: "https://www.youtube.com/")
    @IBOutlet weak var webKitView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()

        webView()
    }
    
    func webView(){
        let urlRequests = URLRequest(url: url!)
        DispatchQueue.main.async {
            self.webKitView.load(urlRequests)
        }
        
    }

}
