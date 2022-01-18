//
//  ViewController.swift
//  StaticWebView-Demo
//
//  Created by lam.nguyen5 on 1/18/22.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        var webView: WKWebView!
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
        
        
        let url = Bundle.main.url(forResource: "game", withExtension: "html", subdirectory: "web")!
        webView.loadFileURL(url, allowingReadAccessTo: url)
        let request = URLRequest(url: url)
        webView.load(request)
    }
    
    
}

