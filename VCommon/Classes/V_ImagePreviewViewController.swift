//
//  V_ImagePreviewViewController.swift
//  VCommon
//
//  Created by Gokhan Gultekin on 16.10.2018.
//

import UIKit

@objc public protocol V_ImagePreviewDelegate {

    @objc optional func closeButtonTapped()
}

public class V_ImagePreviewViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet public weak var scrollView: UIScrollView!
    @IBOutlet public weak var imageView: UIImageView!
    @IBOutlet public weak var closeButton: UIButton!

    public var delegate: V_ImagePreviewDelegate?
    public var imageToShow: UIImage?
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        imageView?.image = imageToShow
        
        scrollView.minimumZoomScale = 1.0
        scrollView.maximumZoomScale = 5.0
    }
    
    override public var prefersStatusBarHidden: Bool {
        return true
    }
    
    public func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    @IBAction func dismissButtonTapped(_ sender: Any) {
        dismiss(animated: true) {
            self.delegate?.closeButtonTapped?()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
       
        let containingBundle = Bundle(for: V_ImagePreviewViewController.self)
        let bundleURL = containingBundle.url(forResource: "VCommon", withExtension: "bundle")
        let bundle = Bundle(url: bundleURL!)
        
        super.init(nibName: "V_ImagePreviewViewController", bundle: bundle)
        
    }
}

public extension UIViewController {
    
    func presentImagePreviewController() {
        
//        let containingBundle = Bundle(for: V_ImagePreviewViewController.self)
//        let bundleURL = containingBundle.url(forResource: "VCommon", withExtension: "bundle")
//        let bundle = Bundle(url: bundleURL!)
//        let imagePreviewVC = V_ImagePreviewViewController(nibName: "V_ImagePreviewViewController", bundle: bundle)
//        imagePreviewVC.imageToShow = UIImage(named: "spacex-example")
//        imagePreviewVC.delegate = self
//        present(imagePreviewVC, animated: true, completion: nil)
//
    }
}
