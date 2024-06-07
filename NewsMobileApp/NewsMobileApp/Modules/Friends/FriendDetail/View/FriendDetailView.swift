//
//  FriendDetailView.swift
//  NewsMobileApp
//
//  Created by Aldana Rastrelli on 07/06/2024.
//

import UIKit
import GoogleMaps

final class FriendDetailViewController: UIViewController {

    private let viewModel: FriendDetailViewModel

    private let nameLabel = UILabel()
    private let usernameLabel = UILabel()
    private let emailLabel = UILabel()
    private let phoneLabel = UILabel()
    private let addressLabel = UILabel()
    private var mapView = GMSMapView()

    init(viewModel: FriendDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        configureUI()
    }

    private func setupUI() {
        view.backgroundColor = .white

        [nameLabel, usernameLabel, phoneLabel, emailLabel, addressLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.textAlignment = .center
            view.addSubview($0)
        }
        // Configure Labels
        nameLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 16, leading: view.leadingAnchor, paddingLeading: 16, trailing: view.trailingAnchor, paddingTrailing: 16)
        nameLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        nameLabel.textColor = .darkGray
        nameLabel.textAlignment = .center
        nameLabel.numberOfLines = 0

        usernameLabel.anchor(top: nameLabel.bottomAnchor, paddingTop: 8, leading: view.leadingAnchor, paddingLeading: 16, trailing: view.trailingAnchor, paddingTrailing: 16)
        usernameLabel.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        usernameLabel.numberOfLines = 0

        phoneLabel.anchor(top: usernameLabel.bottomAnchor, paddingTop: 20, leading: view.leadingAnchor, paddingLeading: 16, trailing: view.trailingAnchor, paddingTrailing: 16)
        phoneLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        phoneLabel.numberOfLines = 0
        phoneLabel.textColor = .gray
        
        emailLabel.anchor(top: phoneLabel.bottomAnchor, paddingTop: 8, leading: view.leadingAnchor, paddingLeading: 16, trailing: view.trailingAnchor, paddingTrailing: 16)
        emailLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        emailLabel.numberOfLines = 0
        emailLabel.textColor = .gray

        addressLabel.anchor(top: emailLabel.bottomAnchor, paddingTop: 8, leading: view.leadingAnchor, paddingLeading: 16, trailing: view.trailingAnchor, paddingTrailing: 16)
        addressLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        addressLabel.numberOfLines = 0
        addressLabel.textColor = .gray

        let user = viewModel.user
        // Configure MapView
        let camera = GMSCameraPosition.camera(withLatitude: Double(user.address.geo.lat) ?? 0.0,
                                              longitude: Double(user.address.geo.lng) ?? 0.0,
                                              zoom: 15.0)
        mapView = GMSMapView(frame: .zero, camera: camera)
        mapView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(mapView)
        mapView.anchor(top: addressLabel.bottomAnchor, paddingTop: 16, leading: view.leadingAnchor, paddingLeading: 16, trailing: view.trailingAnchor, paddingTrailing: 16, bottom: view.safeAreaLayoutGuide.bottomAnchor, paddingBottom: 30, height: 100)
    }

    private func configureUI() {
        let user = viewModel.user
        nameLabel.text = "\(user.firstname) \(user.lastname)"
        usernameLabel.text = user.login.username
        emailLabel.text = user.email
        phoneLabel.text = user.phone
        addressLabel.text = "\(user.address.street), \(user.address.city), \(user.address.zipcode)"
        
        // Add Marker to Map
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: Double(user.address.geo.lat) ?? 0.0,
                                                 longitude: Double(user.address.geo.lng) ?? 0.0)
        marker.map = mapView
    }
}

