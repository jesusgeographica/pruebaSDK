//
//  FloorView.swift
//  Tempo_ios_sdk
//
//  Created by Jesus Victorio on 26/11/2018.
//

import UIKit

class FloorView: UICollectionViewCell {
    
    @IBOutlet var viewClose: UIView!
    @IBOutlet var viewOpen: UIView!
    
    //Open
    @IBOutlet var lbFloor: UILabel!
    @IBOutlet var viewSelected: UIView!
    @IBOutlet var viewCircleSelected: UIView!
    @IBOutlet var lineSeparator: UIView!
    //Close
    @IBOutlet var lbFloorNumber: UILabel!
    @IBOutlet var lbFloorTitle: UILabel!
    
    
    var floor : String?
    var select : Bool = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        viewCircleSelected.layer.cornerRadius = viewCircleSelected.frame.size.width/2
        viewCircleSelected.clipsToBounds = true
        viewCircleSelected.backgroundColor = TempoConstant.color.cell.bluePoint
        viewCircleSelected.layer.borderColor = UIColor.white.cgColor
        viewCircleSelected.layer.borderWidth = 2.0
        
        viewSelected.backgroundColor = TempoConstant.color.cell.grayBackground
        viewSelected.layer.cornerRadius = 2
        viewCircleSelected.isHidden = true
        
        lbFloorTitle.font = UIFont(name: "ECIFont-Medium", size: 10)
        lbFloor.font = UIFont(name: "ECIFont-Medium", size: 17)
        lbFloorNumber.font = UIFont(name: "ECIFont-Medium", size: 17)
        
        lbFloor.textColor = TempoConstant.color.cell.greenECI
        
        lineSeparator.backgroundColor = TempoConstant.color.cell.graySeparator
    }
    
    func setupCellOpen(){
        viewOpen.isHidden = false
        viewClose.isHidden = true
        lbFloor.text = floor ?? "0"
        if select == true{
            lbFloor.textColor = UIColor.black
            viewSelected.isHidden = false
            //viewCircleSelected.isHidden = false
        }else{
            lbFloor.textColor = TempoConstant.color.cell.greenECI
            viewSelected.isHidden = true
            //viewCircleSelected.isHidden = true
        }
    }
    func setupCellClose(){
        viewOpen.isHidden = true
        viewClose.isHidden = false
        lbFloorNumber.text = floor ?? "0"
        lbFloorNumber.textColor = UIColor.black
    }
}
