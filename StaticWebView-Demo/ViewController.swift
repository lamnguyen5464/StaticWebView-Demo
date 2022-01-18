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

        
        let url = URL(string: "https://www.hackingwithswift.com")!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
    }


}

