//
//  MapContentViewController.swift
//  Tempo_ios_sdk
//
//  Created by Jesus Victorio on 27/11/2018.
//

import UIKit
import BottomPopup

class MapContentViewController: BottomPopupViewController {

    var height: CGFloat?
    var topCornerRadius: CGFloat?
    var presentDuration: Double?
    var dismissDuration: Double?
    var shouldDismissInteractivelty: Bool?
    var titleLabel: String?
    
    @IBOutlet var lbDescription: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lbDescription.text = titleLabel
    }
    
    @IBAction func dismissButtonTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    // Bottom popup attribute methods
    // You can override the desired method to change appearance
    
    override func getPopupHeight() -> CGFloat {
        return height ?? CGFloat(300)
    }
    
    override func getPopupTopCornerRadius() -> CGFloat {
        return topCornerRadius ?? CGFloat(10)
    }
    
    override func getPopupPresentDuration() -> Double {
        return presentDuration ?? 1.0
    }
    
    override func getPopupDismissDuration() -> Double {
        return dismissDuration ?? 1.0
    }
    
    override func shouldPopupDismissInteractivelty() -> Bool {
        return shouldDismissInteractivelty ?? true
    }


}
