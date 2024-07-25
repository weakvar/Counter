//
//  CounterViewController.swift
//  Counter
//
//  Created by Vladislav Kulikov on 25.07.2024.
//

import UIKit

final class CounterViewController: UIViewController {

    // MARK: - Views

    private lazy var counterLabel: UILabel = {
        let counterLabel = UILabel()
        counterLabel.font = .preferredFont(forTextStyle: .largeTitle)
        counterLabel.text = "\(currentCount)"
        counterLabel.textColor = .label
        counterLabel.textAlignment = .center

        return counterLabel
    }()

    private lazy var descriptionLabel: UILabel = {
        let descriptionLabel = UILabel()
        descriptionLabel.font = .preferredFont(forTextStyle: .callout)
        descriptionLabel.text = "Значение счётчика"
        descriptionLabel.textColor = .secondaryLabel
        descriptionLabel.textAlignment = .center

        return descriptionLabel
    }()

    private lazy var counterStackView: UIStackView = {
        let counterStackView = UIStackView()
        counterStackView.axis = .vertical
        counterStackView.distribution = .fill
        counterStackView.alignment = .center
        counterStackView.spacing = 8
        counterStackView.translatesAutoresizingMaskIntoConstraints = false

        return counterStackView
    }()

    private lazy var countButton: UIButton = {
        var configuration = UIButton.Configuration.filled()
        configuration.image = UIImage(systemName: "plus")
        configuration.imagePadding = 8
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16)

        let countButton = UIButton(type: .system)
        countButton.setTitle("Добавить еще", for: .normal)
        countButton.configuration = configuration
        countButton.translatesAutoresizingMaskIntoConstraints = false

        return countButton
    }()

    // MARK: - Properties

    private var currentCount = 0

    // MARK: - UIViewController's Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

}

// MARK: - Setup Views

private extension CounterViewController {

    func setup() {
        setupView()
        setupConstraints()
    }

    func setupView() {
        view.backgroundColor = .systemBackground
    }

    func setupConstraints() {
        view.addSubview(counterStackView)
        view.addSubview(countButton)
        counterStackView.addArrangedSubview(counterLabel)
        counterStackView.addArrangedSubview(descriptionLabel)

        NSLayoutConstraint.activate([
            countButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            countButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            counterStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            counterStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            counterStackView.bottomAnchor.constraint(equalTo: countButton.topAnchor, constant: -32),
        ])
    }

}
