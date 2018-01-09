//
//  ViewController.swift
//  Rabbit_Web_browser
//
//  Created by abdul hanan mahmood on 07/08/2017.
//  Copyright © 2017 abdul hanan mahmood. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController ,UITextFieldDelegate{
    
    @IBOutlet weak var SearchText: UITextField!
    var webview : WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webview = WKWebView()
        view.addSubview(webview)
        
        
        webview.translatesAutoresizingMaskIntoConstraints = false
        let width = NSLayoutConstraint(item: webview, attribute: .width, relatedBy: .equal , toItem: view, attribute: .width, multiplier: 1.0, constant: 0)
        
        let height = NSLayoutConstraint(item: webview, attribute: .height, relatedBy: .equal , toItem: view, attribute: .height, multiplier: 1.0, constant: -60)
        
        let top = NSLayoutConstraint(item: webview, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1.0, constant: 75)
    
        view.addConstraint(width)
        view.addConstraint(height)
        view.addConstraint(top)
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
         if (textField.text == nil || textField.text == "")
         {
            textField.text = "https://www.google.com"
         }
            let myurl : URL = URL(string: textField.text!)!
            let req : URLRequest = URLRequest(url: myurl)
            webview.load(req)
            textField.resignFirstResponder()
            return false
    }
    
    @IBAction func Goback(_ sender: Any)
    {
        webview.goBack()
    }

}

