//
//  ColorPalette.swift
//  IOS11TestApp
//
//  Created by Tanveer Bashir on 6/11/17.
//  Copyright © 2017 Tanveer Bashir. All rights reserved.
//

import Foundation

struct ColorPalette: Codable {
    let id: Int
    let name: String
    let hex: String
    // RGB
    struct RGB: Codable {
        let red: Double
        let green: Double
        let blue: Double
    }
    // Hue
    struct HSL: Codable {
        let hue: Double
        let saturation: Double
        let lightness: Double
    }
    let rgb: RGB
    let hsl: HSL
}

