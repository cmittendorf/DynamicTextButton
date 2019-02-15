//
//  ViewController.swift
//  DynamicTextButton
//
//  Created by Christian Mittendorf on 15.02.19.
//  Copyright © 2019 Christian Mittendorf. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let titleLable = createLabel { label in
        label.font = UIFont.systemFont(ofSize: UIFont.labelFontSize)
        label.textColor = .black
        label.textAlignment = .center
    }

    let button1: UIButton = createButton { button in
        button.setTitle("Button #1", for: .normal)
        button.setTitleColor(.white, for: .normal)
    }

    let label1 = createLabel { label in
        label.text = "A button with a title set using 'setTitle' and 'setTitleColor'."
    }

    let button2: UIButton = createButton { button in
        button.titleLabel?.adjustsFontForContentSizeCategory = true
        button.titleLabel?.font = UIFontMetrics.default.scaledFont(for: UIFont.systemFont(ofSize: UIFont.buttonFontSize))

        button.setTitle("Button #2", for: .normal)
        button.setTitleColor(.white, for: .normal)
    }

    let label2 = createLabel { label in
        label.text = "A button with a title set using 'setTitle' and 'setTitleColor' and a font using 'UIFontMetrics.default.scaledFont(for:)'."
    }

    let button3: UIButton = createButton { button in
        button.titleLabel?.adjustsFontForContentSizeCategory = true

        var attributes: [NSAttributedString.Key: Any] = [:]
        attributes[.foregroundColor] = UIColor.white
        attributes[.font] = UIFontMetrics.default.scaledFont(for: UIFont.systemFont(ofSize: UIFont.buttonFontSize))

        let title = NSAttributedString(string: "Button #3", attributes: attributes)
        button.setAttributedTitle(title, for: .normal)
    }

    let label3 = createLabel { label in
        label.text = "A button with a title set using 'setAttributedTitle' and a NSAttributedString using '.font' with 'UIFontMetrics.default.scaledFont(for:)'."
    }

    let button4: UIButton = createButton { button in
        button.titleLabel?.adjustsFontForContentSizeCategory = true

        var attributes: [NSAttributedString.Key: Any] = [:]
        attributes[.foregroundColor] = UIColor.white
        attributes[.font] = UIFont.preferredFont(forTextStyle: .title3)

        let title = NSAttributedString(string: "Button #4", attributes: attributes)

        button.setAttributedTitle(title, for: .normal)
    }

    let label4 = createLabel { label in
        label.text = "A button with a title set using 'setAttributedTitle' and a NSAttributedString using '.font' with 'UIFont.preferredFont(forTextStyle: .title3)'."
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(titleLable)

        view.addSubview(button1)
        view.addSubview(label1)
        view.addSubview(button2)
        view.addSubview(label2)
        view.addSubview(button3)
        view.addSubview(label3)
        view.addSubview(button4)
        view.addSubview(label4)

        button1.addTarget(self, action: #selector(fakeButtonAction(sender:)), for: .touchUpInside)
        button2.addTarget(self, action: #selector(fakeButtonAction(sender:)), for: .touchUpInside)
        button3.addTarget(self, action: #selector(fakeButtonAction(sender:)), for: .touchUpInside)
        button4.addTarget(self, action: #selector(fakeButtonAction(sender:)), for: .touchUpInside)

        NSLayoutConstraint.activate([
            titleLable.leftAnchor.constraint(equalToSystemSpacingAfter: view.layoutMarginsGuide.leftAnchor, multiplier: 1.0),
            titleLable.topAnchor.constraint(equalToSystemSpacingBelow: view.layoutMarginsGuide.topAnchor, multiplier: 1.0),
            view.layoutMarginsGuide.rightAnchor.constraint(equalToSystemSpacingAfter: titleLable.rightAnchor, multiplier: 1.0),
            ])

        NSLayoutConstraint.activate([
            label1.leftAnchor.constraint(equalToSystemSpacingAfter: view.layoutMarginsGuide.leftAnchor, multiplier: 1.0),
            view.layoutMarginsGuide.bottomAnchor.constraint(equalToSystemSpacingBelow: label1.bottomAnchor, multiplier: 1.0),
            view.layoutMarginsGuide.rightAnchor.constraint(equalToSystemSpacingAfter: label1.rightAnchor, multiplier: 1.0),
            ])

        setConstraints(for: button1, above: label1, in: view)
        setConstraints(for: label2, above: button1, in: view)
        setConstraints(for: button2, above: label2, in: view)
        setConstraints(for: label3, above: button2, in: view)
        setConstraints(for: button3, above: label3, in: view)
        setConstraints(for: label4, above: button3, in: view)
        setConstraints(for: button4, above: label4, in: view)
    }

    @objc func fakeButtonAction(sender: Any?) {}

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        titleLable.text = traitCollection.preferredContentSizeCategory.rawValue
    }
}

func createLabel(completion: (UILabel) -> Void) -> UILabel {
    let label = UILabel()
    label.numberOfLines = 0
    label.font = UIFont.systemFont(ofSize: UIFont.smallSystemFontSize)
    label.textColor = .gray
    completion(label)
    label.adjustsFontForContentSizeCategory = false
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
}

func createButton(completion: (UIButton) -> Void) -> UIButton {
    let button = UIButton(type: .system)
    button.layer.cornerRadius = 5.0
    button.backgroundColor = .orange
    completion(button)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
}

func setConstraints(for view: UIView, above: UIView, in superView: UIView) {
    var multiplier: CGFloat = 1.0
    if view is UILabel {
        multiplier = 2.0
    }

    NSLayoutConstraint.activate([
        view.leftAnchor.constraint(equalToSystemSpacingAfter: superView.layoutMarginsGuide.leftAnchor, multiplier: 1.0),
        above.topAnchor.constraint(equalToSystemSpacingBelow: view.bottomAnchor, multiplier: multiplier),
        superView.layoutMarginsGuide.rightAnchor.constraint(equalToSystemSpacingAfter: view.rightAnchor, multiplier: 1.0),
    ])
}
