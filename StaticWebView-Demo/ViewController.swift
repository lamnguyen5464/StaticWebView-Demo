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
        
        
        //        let url = Bundle.main.url(forResource: "index", withExtension: "html", subdirectory: "web")!
        
        
        let documentDirUrl = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)

        let file = documentDirUrl.appendingPathComponent("index.html")
        
        if FileManager().fileExists(atPath: file.path) {
            
            print("@@ read " + file.absoluteString)
            
            webView.loadFileURL(file, allowingReadAccessTo: documentDirUrl)
//            let request = URLRequest(url: file)
//            webView.load(request)
            
        } else{
            print("Kill app mo lai di")
            let assets = [
                "https://img.mservice.com.vn/app/html/test/index.html",
                "https://img.mservice.com.vn/app/html/test/index.js",
                "https://img.mservice.com.vn/app/html/test/img.png"
            ]
            
            assets.forEach({url in
                loadFileSync(url: URL(string:url)!, completion: {(rootUrl, e) -> Void in
                    if (e != nil) {
                        print("@@ error")
                        print(e!.localizedDescription)
                    }
                })
            })
            
        }
    }
    
    func loadFileSync(url: URL, completion: @escaping (String?, Error?) -> Void)
    {
        let documentsUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        
        
        let destinationUrl = documentsUrl.appendingPathComponent(url.lastPathComponent)
        
        if FileManager().fileExists(atPath: destinationUrl.path)
        {
            print("File already exists [\(destinationUrl.absoluteString)]")
            completion(destinationUrl.absoluteString, nil)
        }
        else if let dataFromURL = NSData(contentsOf: url)
        {
            if dataFromURL.write(to: destinationUrl, atomically: true)
            {
                print("file saved [\(destinationUrl.path)]")
                completion(destinationUrl.path, nil)
            }
            else
            {
                print("error saving file")
                let error = NSError(domain:"Error saving file", code:1001, userInfo:nil)
                completion(destinationUrl.path, error)
            }
        }
        else
        {
            let error = NSError(domain:"Error downloading file", code:1002, userInfo:nil)
            completion(destinationUrl.path, error)
        }
    }
    
    
}

