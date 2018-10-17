//
//  V_WebViewController.swift
//  VCommon
//
//  Created by Gokhan Gultekin on 17.10.2018.
//

import UIKit
import WebKit

public class V_WebViewController: UIViewController, WKUIDelegate, WKNavigationDelegate {
    
    @IBOutlet private weak var webViewContainer: UIView!
    private var webView: WKWebView!
    public var url: URL?
    
    @IBOutlet public weak var activityIndicatorView: UIActivityIndicatorView!

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        
        let containingBundle = Bundle(for: V_WebViewController.self)
        let bundleURL = containingBundle.url(forResource: "VCommon", withExtension: "bundle")
        let bundle = Bundle(url: bundleURL!)
        
        super.init(nibName: "V_WebViewController", bundle: bundle)
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Example title"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Close", style: .plain, target: self, action: #selector(dismissButtonTapped))
        
        setupWebView()
        setupConstraints()
        
        webView.load(URLRequest(url: url!))
        self.activityIndicatorView.startAnimating()
    }

    private func setupWebView() {
        let webConfiguration = WKWebViewConfiguration()
        let customFrame = CGRect.init(origin: CGPoint.zero, size: CGSize.init(width: 0.0, height: self.webViewContainer.frame.size.height))
        self.webView = WKWebView (frame: customFrame , configuration: webConfiguration)
        webView.translatesAutoresizingMaskIntoConstraints = false
        self.webViewContainer.addSubview(webView)
        webView.uiDelegate = self
        webView.navigationDelegate = self
    }
    
    private func setupConstraints() {
        webView.topAnchor.constraint(equalTo: webViewContainer.topAnchor).isActive = true
        webView.rightAnchor.constraint(equalTo: webViewContainer.rightAnchor).isActive = true
        webView.leftAnchor.constraint(equalTo: webViewContainer.leftAnchor).isActive = true
        webView.bottomAnchor.constraint(equalTo: webViewContainer.bottomAnchor).isActive = true
        webView.heightAnchor.constraint(equalTo: webViewContainer.heightAnchor).isActive = true
    }
    
    public func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        self.activityIndicatorView.startAnimating()
        /* MARK: You can use here if you want to navigate anywhere according to the value returned from url string.
        if let urlString = navigationAction.request.url?.absoluteString {
        }
        */
        decisionHandler(.allow)
    }
 
    public func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.activityIndicatorView.stopAnimating()
    }
    
    public func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        self.activityIndicatorView.stopAnimating()
    }
    
    @objc func dismissButtonTapped() {
        dismiss(animated: true, completion: nil)
    }

}
