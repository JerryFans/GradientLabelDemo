//
//  GradientPatternLabelView.swift
//  GradientLabelDemo
//
//  Created by 逸风 on 2022/1/1.
//

import UIKit

@objc class GradientPatternLabelConfig: NSObject {
    
    var text: String = ""
    var font: UIFont = UIFont.systemFont(ofSize: 15)
    var textColor: UIColor = .clear
    @objc var startColor: UIColor = .clear
    @objc var endColor: UIColor = .clear
    @objc var maxWidth: CGFloat = 0.0
    @objc var lineBreakMode: NSLineBreakMode = .byTruncatingTail
    
    convenience init(text: String, font: UIFont, textColor: UIColor, startColor: UIColor, endColor: UIColor, maxWidth: CGFloat) {
        self.init()
        self.text = text
        self.font = font
        self.textColor = textColor
        self.startColor = startColor
        self.endColor = endColor
        self.maxWidth = maxWidth
    }
    
    @objc class func createNormalLabelConfig(with text: String, textColor: UIColor, font: UIFont, maxWidth: CGFloat) -> GradientPatternLabelConfig {
        return GradientPatternLabelConfig(text: text, font: font, textColor: textColor, startColor: .red, endColor: .green, maxWidth: maxWidth)
    }
}

@objc class GradientPatternLabelView: UIView {
    
    var label: UILabel = {
        let label = UILabel()
        return label
    }()
    var config: GradientPatternLabelConfig?

    @objc convenience init(config: GradientPatternLabelConfig) {
        self.init(frame: .zero)
        self.config = config
        self.label.font = config.font
        self.label.text = config.text
        self.addSubview(self.label)
        self.label.sizeToFit()
        self.label.lineBreakMode = config.lineBreakMode
        let size = (config.maxWidth == 0 || self.label.jf.size.width < config.maxWidth) ? self.label.jf.size : CGSize(width: config.maxWidth, height: self.label.jf.size.height)
        if config.startColor == UIColor.clear {
            self.label.textColor = config.textColor
        }
        else if let gradientImage = ConvertGradientImage.gradientImage(with: config, size: size) {
            self.label.textColor = UIColor(patternImage: gradientImage)
        }
        else {
            self.label.textColor = config.startColor
        }
        let frame = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        self.label.frame = frame
        self.frame = frame
    }

    @objc func createLabelImage() -> UIImage? {
        return nil
//        return UIImage.convertView(toImage: self)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

