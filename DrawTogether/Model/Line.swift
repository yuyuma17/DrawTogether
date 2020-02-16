//
//  Line.swift
//  DrawTogether
//
//  Created by 黃士軒 on 2020/2/15.
//  Copyright © 2020 Lacie. All rights reserved.
//

import UIKit

struct Line {
    
    let color: UIColor
    let shadow: UIColor
    let width: Float
    let alpha: Float
    let blur: Float
    var points: [CGPoint]
    
}

extension Line: Codable {
    
    init(from decoder: Decoder) throws {
        var container = try decoder.unkeyedContainer()

        width = try container.decode(Float.self)
        alpha = try container.decode(Float.self)
        blur = try container.decode(Float.self)
        points = try container.decode([CGPoint].self)

        let colorData = try container.decode(Data.self)
        let shadowData = try container.decode(Data.self)
        color = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(colorData) as? UIColor ?? UIColor.black
        shadow = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(shadowData) as? UIColor ?? UIColor.black
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.unkeyedContainer()
        
        try container.encode(width)
        try container.encode(alpha)
        try container.encode(blur)
        try container.encode(points)

        let colorData = try NSKeyedArchiver.archivedData(withRootObject: color, requiringSecureCoding: false)
        try container.encode(colorData)
        
        let shadowData = try NSKeyedArchiver.archivedData(withRootObject: shadow, requiringSecureCoding: false)
        try container.encode(shadowData)
    }
}
