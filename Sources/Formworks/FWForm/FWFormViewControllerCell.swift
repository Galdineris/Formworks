//
//  FWFormViewControllerCell.swift
//  
//
//  Created by Victor Falcetta do Nascimento on 30/09/20.
//

import UIKit
/**
 Representation of a component. It should **only** be
 instantiated as part of `UICollectionView` inside a
 `FWFormViewController`.
 */
final class FWFormViewControllerCell: UICollectionViewCell {
    
    static var identifier: String {
        return String(describing: self)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpContentView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    /// Use this function to make all needed visual set up for the cell.
    private func setUpContentView() {
        // Add corner radius to the cell
        contentView.backgroundColor = .fwComponentBackground
        contentView.layer.cornerRadius = contentView.frame.height * FormSpec.Cell.cornerRadius
        contentView.clipsToBounds = true
        // Add shadow drop to the cell
        contentView.layer.shadowColor = UIColor.fwComponentShadow.cgColor
        contentView.layer.shadowOffset = CGSize(width: FormSpec.Cell.cellShadowOffSetX,
                                                height: FormSpec.Cell.cellShadowOffSetY)
        contentView.layer.shadowRadius = FormSpec.Cell.cellShadowBlur
        contentView.layer.shadowOpacity = FormSpec.Cell.cellShadowOppacity
        contentView.layer.masksToBounds = false
        contentView.layer.shadowPath = UIBezierPath(roundedRect: contentView.bounds,
                                                    cornerRadius: contentView.layer.cornerRadius).cgPath
    }
}
