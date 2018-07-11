//
//  ViewController.swift
//  SVGDemo
//
//  Created by 小林健人 on 2018/07/11.
//  Copyright © 2018年 小林健人. All rights reserved.
//

import UIKit
import SVGKit
import SwiftSVG
import PocketSVG

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imageContainer: UIView!
    @IBOutlet weak var imageContainerPocket: UIView!
    @IBOutlet weak var imageContainerSnowflake: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        let _ = [imageView, imageContainer, imageContainerPocket, imageContainerSnowflake].map { setup($0) }
        applySVGKit(to: imageView)
        applySwiftSVG(to: imageContainer)
        applyPocketSVG(to: imageContainerPocket)
    }

    private func setup(_ view: UIView) {
        view.isHidden = false
        view.backgroundColor = .clear
        view.layer.borderWidth = 4
        view.contentMode = .scaleAspectFit
    }

    private func applySVGKit(to view: UIImageView) {
        let pc = SVGKImage(named: "pc")
        pc?.size = view.bounds.size
        view.image = pc?.uiImage
    }

    private func applySwiftSVG(to view: UIView) {
        let pc = UIView(SVGNamed: "test")
        pc.backgroundColor = .clear
        pc.frame = view.bounds
        view.addSubview(pc)
    }

    private func applyPocketSVG(to view: UIView) {
        let url = Bundle.main.url(forResource: "pc", withExtension: "svg")!
        let svgImageView = SVGImageView(contentsOf: url)
        svgImageView.backgroundColor = .clear
        svgImageView.frame = view.bounds
        svgImageView.contentMode = .scaleAspectFit
        view.addSubview(svgImageView)
    }
}
