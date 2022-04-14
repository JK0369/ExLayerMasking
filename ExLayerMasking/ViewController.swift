//
//  ViewController.swift
//  ExLayerMasking
//
//  Created by Jake.K on 2022/04/14.
//

import UIKit

class ViewController: UIViewController {
  private lazy var titleLabel: UILabel = {
    let label = UILabel()
    label.text = "마스킹 예제"
    label.translatesAutoresizingMaskIntoConstraints = false
    self.view.addSubview(label)
    return label
  }()
  private lazy var sampleView: SampleView = {
    let view = SampleView()
    self.view.addSubview(view)
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    NSLayoutConstraint.activate([
      self.sampleView.heightAnchor.constraint(equalToConstant: 100),
      self.sampleView.widthAnchor.constraint(equalToConstant: 200),
      self.sampleView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
      self.sampleView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
    ])
    NSLayoutConstraint.activate([
      self.titleLabel.bottomAnchor.constraint(equalTo: self.sampleView.topAnchor, constant: -16),
      self.titleLabel.centerXAnchor.constraint(equalTo: self.sampleView.centerXAnchor),
    ])
  }
}

final class SampleView: UIView {
  private enum Constants {
    static let lineWidth = 2.0
    static let cornerRadius = 10.0
  }
  init() {
    super.init(frame: .zero)
    self.backgroundColor = .systemBlue
  }
  
  required init?(coder: NSCoder) {
    fatalError()
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    let shapeLayer = CAShapeLayer()
    shapeLayer.lineWidth = Constants.lineWidth
    shapeLayer.cornerRadius = Constants.cornerRadius
    shapeLayer.strokeColor = UIColor.black.cgColor
    shapeLayer.fillColor = UIColor.clear.cgColor
    shapeLayer.path = UIBezierPath(
      roundedRect: self.bounds.insetBy(dx: Constants.lineWidth, dy: Constants.lineWidth),
      cornerRadius: Constants.cornerRadius
    ).cgPath
    
    self.layer.mask = shapeLayer
  }
}
