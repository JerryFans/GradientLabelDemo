//
//  GradientLayerLabelView.swift
//  GradientLabelDemo
//
//  Created by 逸风 on 2022/1/1.
//

import UIKit

@objc class GradientLayerLabelConfig: NSObject {
    
    var text: String = ""
    var font: UIFont = UIFont.systemFont(ofSize: 15)
    var textColor: UIColor = .clear
    var startColor: UIColor = .clear
    var endColor: UIColor = .clear
    
    convenience init(text: String, font: UIFont, textColor: UIColor, startColor: UIColor, endColor: UIColor) {
        self.init()
        self.text = text
        self.font = font
        self.textColor = textColor
        self.startColor = startColor
        self.endColor = endColor
    }
    
    @objc class func defaultLabelConfig(with text: String, textColor: UIColor, font: UIFont) -> GradientLayerLabelConfig {
        return GradientLayerLabelConfig(text: text, font: font, textColor: textColor, startColor: .red, endColor: .green)
    }
    
}

@objc class GradientLayerLabelView: UIView {
    
    var label: UILabel = {
        let label = UILabel()
        return label
    }()
    var config: GradientLayerLabelConfig?
    var gradientLayer: CAGradientLayer?
    
    @objc convenience init(config: GradientLayerLabelConfig) {
        self.init(frame: .zero)
        self.config = config
        self.label.font = config.font
        self.label.text = config.text
        self.addSubview(self.label)
        self.label.sizeToFit()
        let frame = CGRect(x: 0, y: 0, width: self.label.frame.size.width, height: self.label.frame.size.height)
        self.frame = frame
    }
    
//    @objc func createLabelImage() -> UIImage? {
//        return UIImage.convertView(toImage: self)
//    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        guard let config = self.config else { return }
        if self.gradientLayer != nil {
            return
        }
        let gradientLayer = CAGradientLayer()
        self.gradientLayer = gradientLayer
        gradientLayer.colors = [config.startColor.cgColor,config.endColor.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        gradientLayer.frame = self.label.frame
        gradientLayer.mask = self.label.layer
        self.label.layer.frame = gradientLayer.bounds
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

