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

    private lazy var weatherIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "cloud.drizzle.fill")
        imageView.tintColor = UIColor(named: "infoColor")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private lazy var temperatureLabel: UILabel = {
        let lable = UILabel()
        lable.font = .systemFont(ofSize: 50, weight: .bold)
        lable.text = "24C"
        lable.tintColor = UIColor(named: "infoColor")
        lable.textAlignment = .center
        lable.translatesAutoresizingMaskIntoConstraints = false
        return lable
    }()

    
    private lazy var feelsLikeTemperatureLabel: UILabel = {
        let lable = UILabel()
        lable.font = .systemFont(ofSize: 15, weight: .semibold)
        lable.text = "Feels like 22c"
        lable.tintColor = UIColor(named: "infoColor")
        lable.textAlignment = .right
        lable.translatesAutoresizingMaskIntoConstraints = false
        return lable
    }()

    private lazy var cityLabel: UILabel = {
        let lable = UILabel()
        lable.font = .systemFont(ofSize: 26, weight: .semibold)
        lable.text = "city"
        lable.tintColor = UIColor(named: "infoColor")
        lable.textAlignment = .center
        lable.translatesAutoresizingMaskIntoConstraints = false
        return lable
    }()

    // MARK: - viewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews ()
        setupConstraints()

    }

    private func setupViews() {
        [backgroundImageView,
         weatherIconImageView,
         temperatureLabel,
         feelsLikeTemperatureLabel,
         cityLabel
        ].forEach {
            view.addSubview($0)
        }
    }

    // MARK: - setupConstraints

    func setupConstraints() {
        NSLayoutConstraint.activate([
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.widthAnchor.constraint(equalTo: view.widthAnchor),
            backgroundImageView.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])

        NSLayoutConstraint.activate([
            weatherIconImageView.widthAnchor.constraint(equalToConstant: 150),
            weatherIconImageView.heightAnchor.constraint(equalToConstant: 150),
            weatherIconImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            weatherIconImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
        ])

        NSLayoutConstraint.activate([
            temperatureLabel.widthAnchor.constraint(equalToConstant: 150),
            temperatureLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            temperatureLabel.topAnchor.constraint(equalTo: weatherIconImageView.bottomAnchor, constant: 20),
        ])

        NSLayoutConstraint.activate([
            feelsLikeTemperatureLabel.widthAnchor.constraint(equalToConstant: 150),
            feelsLikeTemperatureLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            feelsLikeTemperatureLabel.topAnchor.constraint(equalTo: temperatureLabel.bottomAnchor, constant: 5),
        ])

        NSLayoutConstraint.activate([
            cityLabel.widthAnchor.constraint(equalToConstant: 150),
            cityLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cityLabel.topAnchor.constraint(equalTo: feelsLikeTemperatureLabel.bottomAnchor, constant: 20),
        ])
    }
}

