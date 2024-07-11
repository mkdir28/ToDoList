//
//  Font+Ext.swift
//  ToDoList
//
//  Created by Marina on 11.07.2024.
//

import SwiftUI

extension Font{
    static func setFont(size: CGFloat, weight: Font.Weight = .semibold) -> Font{
        system(size: size, weight: weight, design: Design.monospaced)
    }
}
