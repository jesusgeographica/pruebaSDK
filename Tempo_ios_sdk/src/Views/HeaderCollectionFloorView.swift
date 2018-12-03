//
//  HeaderCollectionFloorView.swift
//  Tempo_ios_sdk
//
//  Created by Jesus Victorio on 28/11/2018.
//

import UIKit

class HeaderCollectionFloorView: UICollectionReusableView {
    @IBOutlet weak var lbFloor: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.backgroundColor = TempoConstant.color.cell.grayBackground
        
        lbFloor.font = UIFont(name: "ECIFont-Medium", size: 10)
        
    }
}
