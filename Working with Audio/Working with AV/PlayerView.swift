//
//  PlayerView.swift
//  Working with AV
//
//  Created by Chaitanya Soni on 21/10/24.
//

import UIKit
import AVKit

class PlayerView: UIView {
    override class var layerClass: AnyClass {
        AVPlayerLayer.self
    }
}
