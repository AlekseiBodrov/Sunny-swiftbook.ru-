//
//  ViewController.swift
//  Sunny
//
//  Created by Aleksei Bodrov on 12.09.2022.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - variables parametrs

    private lazy var backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "background")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews ()
        setupTopConstraints()

    }

    private func setupViews() {
        [backgroundImageView
        ].forEach {
            view.addSubview($0)
        }
    }

    func setupTopConstraints() {
        NSLayoutConstraint.activate([
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.widthAnchor.constraint(equalTo: view.widthAnchor),
            backgroundImageView.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])
    }
}

