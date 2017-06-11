//
//  MyTableViewCell.swift
//  IOS11TestApp
//
//  Created by Tanveer Bashir on 6/7/17.
//  Copyright © 2017 Tanveer Bashir. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    func configure(_ color: ColorPalette) {
        colorView.backgroundColor =  UIColor(red: CGFloat(color.rgb.red)/255, green: CGFloat(color.rgb.green)/255, blue: CGFloat(color.rgb.blue)/255, alpha: 1)
        let red = color.rgb.red
        let green = color.rgb.green
        let blue = color.rgb.blue
        let _ = "Hex: \(color.hex.uppercased()) RGB: \(Int(red), Int(green), Int(blue))"
        //infoLabel.text = "\(color.name)\n\(info)"
    }
    @IBOutlet weak var colorView: UIView!
}
