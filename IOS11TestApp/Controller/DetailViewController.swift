//
//  DetailViewController.swift
//  IOS11TestApp
//
//  Created by Tanveer Bashir on 6/11/17.
//  Copyright © 2017 Tanveer Bashir. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    private var color: ColorPalette!
    func configure(color: ColorPalette) {
        self.color = color
    }

    @IBOutlet private weak var hexHueLabel: UILabel!
    @IBOutlet private weak var colorNameLabel: UILabel!
    @IBOutlet private weak var colorImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()
    }

    private func setUI() {
        colorImageView.layer.borderWidth = 0.5
        colorImageView.layer.borderColor = UIColor.black.cgColor
        colorImageView.layer.cornerRadius = colorImageView.frame.size.width / 2
        colorImageView.backgroundColor = kColor()
        colorImageView.clipsToBounds = true
        colorNameLabel.text = color.name
        hexHueLabel.text = "RGB \(Int(color.rgb.red), Int(color.rgb.green), Int(color.rgb.blue))\nHSL \(Int(color.hsl.hue), Int(color.hsl.saturation), Int(color.hsl.lightness))"
    }

    private func kColor() -> UIColor {
        return UIColor(red: CGFloat(color.rgb.red)/255, green: CGFloat(color.rgb
            .green)/255, blue: CGFloat(color.rgb.blue)/255, alpha: 1)
    }
}
