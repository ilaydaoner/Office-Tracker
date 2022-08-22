//
//  WebViewViewController.swift
//  Office Tracker
//
//  Created by Mac on 21.08.2022.
//

import UIKit
import WebKit

class WebViewViewController: UIViewController, WKNavigationDelegate{

    @IBOutlet weak var indicator: UIActivityIndicatorView!
    @IBOutlet weak var webView: WKWebView!
    
    var progressView: UIProgressView!
    var websites = ["mobven.com", "google.com"]
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.navigationDelegate = self
        let url = URL(string: "https://www.mobven.com/")!
        let urlRequest = URLRequest(url: url)
        webView.load(urlRequest)
        webView.allowsBackForwardNavigationGestures = true
        
        
        let refresh = UIBarButtonItem(barButtonSystemItem: .refresh, target: webView, action: #selector(webView.reload))
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action:nil)
        let backButton = UIBarButtonItem(image: UIImage(systemName: "arrow.backward"), style: .done, target: webView, action: #selector(webView.goBack))
        let forwardButton = UIBarButtonItem(image: UIImage(systemName: "arrow.forward"), style: .done, target: webView, action: #selector(webView.goForward))
        progressView = UIProgressView(progressViewStyle: .default)
        progressView.sizeToFit()
        let progressItem = UIBarButtonItem(customView: progressView)

        
        toolbarItems = [refresh, backButton, spacer,forwardButton]
        navigationController?.isToolbarHidden = false
        webView.addObserver(self, forKeyPath: #keyPath(WKWebView.estimatedProgress), options: .new, context: nil)
  
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "estimatedProgress" {
            progressView.progress = Float(webView.estimatedProgress)
        }
    }

    func webView(_ webView: WKWebView, didStartProvisionalNavigation: WKNavigation!){
        indicate(show: true)
}
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        indicate(show: false)
    }

    
    func indicate (show:Bool) {
        
        if show {
            indicator.startAnimating()
        } else {
            indicator.stopAnimating()
        }
    
    }
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        let url = navigationAction.request.url
        if let host = url?.host {
            for website in websites {
                if host.contains(website) {
                    decisionHandler(.allow)
                    return
                }
            }
        }
            decisionHandler(.cancel)
    
    }
        }

