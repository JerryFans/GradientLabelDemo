//
//  ViewController.swift
//  GradientLabelDemo
//
//  Created by 逸风 on 2022/1/1.
//

import UIKit
import JRBaseKit


class ViewController: UIViewController {
    
    func buildNormalLabel(text: String) -> UILabel {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 15)
        label.text = text
        label.frame = CGRect(x: 15, y: 100, width: 120, height: 20)
        label.sizeToFit()
        return label
    }
    
    func buildGradientLayerLabel(text: String) -> GradientLayerLabelView {
        let label = GradientLayerLabelView(config: GradientLayerLabelConfig.defaultLabelConfig(with: text, textColor: .black, font: UIFont.systemFont(ofSize: 15)))
        return label
    }
    
    func buildGradientPatternLabel(text: String) -> GradientPatternLabelView {
        let label = GradientPatternLabelView(config: GradientPatternLabelConfig.createNormalLabelConfig(with: text, textColor: .black, font: UIFont.systemFont(ofSize: 15), maxWidth: 300))
        return label
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let label1 = buildNormalLabel(text: "我是普通Label有emoj😊😊")
        view.addSubview(label1)
        
        let frame = label1.frame
        
        var label2 = buildGradientLayerLabel(text: "我是渐变Label有emoj😊😊")
        view.addSubview(label2)
        label2.frame = frame
        label2.jf.top = label1.jf.bottom + 15
        
        var label3 = buildGradientPatternLabel(text: "我是渐变Label有emoj😊😊")
        view.addSubview(label3)
        label3.frame = frame
        label3.jf.top = label2.jf.bottom + 15
        
        
        
    }


}

