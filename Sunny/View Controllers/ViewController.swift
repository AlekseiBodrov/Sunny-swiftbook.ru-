//
//  ViewController.swift
//  Sunny
//
//  Created by Aleksei Bodrov on 12.09.2022.
//

import UIKit
import CoreLocation

class ViewController: UIViewController{

    lazy var updatedText = ""

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
        lable.tintColor = UIColor(named: "infoColor")
        lable.textAlignment = .center
        lable.translatesAutoresizingMaskIntoConstraints = false
        return lable
    }()

    
    private lazy var feelsLikeTemperatureLabel: UILabel = {
        let lable = UILabel()
        lable.font = .systemFont(ofSize: 15, weight: .semibold)
        lable.tintColor = UIColor(named: "infoColor")
        lable.textAlignment = .right
        lable.translatesAutoresizingMaskIntoConstraints = false
        return lable
    }()

    lazy var cityLabel: UILabel = {
        let lable = UILabel()
        lable.font = .systemFont(ofSize: 26, weight: .semibold)
        lable.tintColor = UIColor(named: "infoColor")
        lable.text = "Ufa"
        lable.textAlignment = .center
        lable.translatesAutoresizingMaskIntoConstraints = false
        return lable
    }()

    var networkWeatherManager = NetworkWeatherManager()
    lazy var locationManager: CLLocationManager = {
        let lm = CLLocationManager()
        lm.delegate = self
        lm.desiredAccuracy = kCLLocationAccuracyKilometer
        lm.requestWhenInUseAuthorization()
        return lm
    }()

    private lazy var searchIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "magnifyingglass.circle.fill")
        imageView.tintColor = UIColor(named: "infoColor")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    lazy var searchButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(searchPressed), for: .touchDown)
        button.addTarget(self, action: #selector(addTarget), for: .touchUpInside)
        button.addTarget(self, action: #selector(touchUp), for: .touchUpOutside)
        return button
    }()

    // MARK: - viewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews ()
        setupUI()

        networkWeatherManager.onCompletion = { [weak self] currentWeather in
            guard let self = self else { return }
            self.updateInterfaceWith(weather: currentWeather)
        }

        if CLLocationManager.locationServicesEnabled() {
            locationManager.requestLocation()
        }
    }

    private func setupViews() {

        [searchIconImageView
        ].forEach {
            searchButton.addSubview($0)
        }

        [backgroundImageView,
         weatherIconImageView,
         temperatureLabel,
         feelsLikeTemperatureLabel,
         cityLabel,
         searchButton
        ].forEach {
            view.addSubview($0)
        }
    }

    private func setupUI(){
        setupConstraints()
    }

    func updateInterfaceWith(weather: CurrentWeather) {
        DispatchQueue.main.async {
            self.cityLabel.text = weather.cityName
            self.temperatureLabel.text = weather.temperatureString
            self.feelsLikeTemperatureLabel.text = "Feels like \(weather.feelsLikeTemperatureString)" 
            self.weatherIconImageView.image = UIImage(systemName: weather.systemIconNameString)
        }
    }

    @objc func searchPressed() {
        UIView.animate(withDuration: 0.1) {
            self.searchButton.transform = CGAffineTransform.init(scaleX: 0.95, y: 0.95)
        } completion: { _ in
        }
    }

    @objc func addTarget() {
        self.presentSearchAlertController(withTitle: "Enter city name", message: nil, style: .alert) { [unowned self] city in
            self.networkWeatherManager.fetchCurrentWeather(forRequestType: .cityName(city: city))
            self.cityLabel.text = city
        }

        UIView.animate(withDuration: 0.1) {
            self.searchButton.transform = .identity
        } completion: { _ in
        }
    }

    @objc private func touchUp() {

        UIView.animate(withDuration: 0.1) {
            self.searchButton.transform = .identity
        } completion: { _ in
        }
    }

    @objc func showDetailController() {
        print(navigationController)
    }


}

// MARK: - CLLocationManagerDelegate

extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        let latitude = location.coordinate.latitude
        let longitude = location.coordinate.longitude

        networkWeatherManager.fetchCurrentWeather(forRequestType: .coordinate(latitude: latitude, longitude: longitude))
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
}

// MARK: - setupConstraints

extension ViewController {


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
            searchButton.widthAnchor.constraint(equalToConstant: 75),
            searchButton.heightAnchor.constraint(equalToConstant: 75),
            searchButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            searchButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])

        NSLayoutConstraint.activate([
            cityLabel.heightAnchor.constraint(equalToConstant: 50),
            cityLabel.trailingAnchor.constraint(equalTo: searchButton.leadingAnchor, constant: -10),
            cityLabel.bottomAnchor.constraint(equalTo: searchButton.bottomAnchor)
        ])

        NSLayoutConstraint.activate([
    
            searchIconImageView.trailingAnchor.constraint(equalTo: searchButton.trailingAnchor),
            searchIconImageView.leadingAnchor.constraint(equalTo: searchButton.leadingAnchor),
            searchIconImageView.topAnchor.constraint(equalTo: searchButton.topAnchor),
            searchIconImageView.bottomAnchor.constraint(equalTo: searchButton.bottomAnchor)
        ])
    }
}
