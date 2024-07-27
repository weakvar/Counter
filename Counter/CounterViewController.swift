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
        descriptionLabel.text = "Текущий счет"
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

    private lazy var incrementButton: UIButton = {
        var configuration = UIButton.Configuration.filled()
        configuration.image = UIImage(systemName: "plus")
        configuration.imagePadding = 8
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16)

        let incrementButton = UIButton(type: .system)
        incrementButton.configuration = configuration
        incrementButton.addTarget(self, action: #selector(incrementCount), for: .touchUpInside)
        incrementButton.translatesAutoresizingMaskIntoConstraints = false

        return incrementButton
    }()

    private lazy var decrementButton: UIButton = {
        var configuration = UIButton.Configuration.filled()
        configuration.image = UIImage(systemName: "minus")
        configuration.imagePadding = 8
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16)
        configuration.baseBackgroundColor = .red

        let decrementButton = UIButton(type: .system)
        decrementButton.configuration = configuration
        decrementButton.addTarget(self, action: #selector(decrementCount), for: .touchUpInside)
        decrementButton.isEnabled = false
        decrementButton.translatesAutoresizingMaskIntoConstraints = false

        return decrementButton
    }()

    private lazy var buttonsStackView: UIStackView = {
        let buttonsStackView = UIStackView()
        buttonsStackView.axis = .horizontal
        buttonsStackView.distribution = .fill
        buttonsStackView.alignment = .fill
        buttonsStackView.spacing = 8
        buttonsStackView.translatesAutoresizingMaskIntoConstraints = false

        return buttonsStackView
    }()

    private lazy var countHistoryTextView: UITextView = {
        let countHistoryTextView = UITextView()
        countHistoryTextView.font = .preferredFont(forTextStyle: .callout)
        countHistoryTextView.textColor = .secondaryLabel
        countHistoryTextView.textAlignment = .natural
        countHistoryTextView.backgroundColor = .secondarySystemBackground
        countHistoryTextView.layer.cornerRadius = 16
        countHistoryTextView.translatesAutoresizingMaskIntoConstraints = false

        return countHistoryTextView
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
        setupNavigationBar()
        setupConstraints()
    }

    func setupView() {
        view.backgroundColor = .systemBackground
    }

    func setupNavigationBar() {
        navigationItem.title = "Счетчик"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Сбросить", style: .plain, target: self, action: #selector(resetCounter))
    }

    func setupConstraints() {
        view.addSubview(counterStackView)
        view.addSubview(buttonsStackView)
        view.addSubview(countHistoryTextView)
        counterStackView.addArrangedSubview(counterLabel)
        counterStackView.addArrangedSubview(descriptionLabel)
        buttonsStackView.addArrangedSubview(decrementButton)
        buttonsStackView.addArrangedSubview(incrementButton)

        NSLayoutConstraint.activate([
            buttonsStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonsStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            counterStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            counterStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            counterStackView.bottomAnchor.constraint(equalTo: incrementButton.topAnchor, constant: -32),
            countHistoryTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            countHistoryTextView.topAnchor.constraint(equalTo: buttonsStackView.bottomAnchor, constant: 32),
            countHistoryTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            countHistoryTextView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -32)
        ])
    }

}

// MARK: - Update Views

private extension CounterViewController {

    @objc
    func incrementCount() {
        currentCount += 1
        counterLabel.text = "\(currentCount)"

        if currentCount > 0 && !decrementButton.isEnabled {
            setDecrementButtonEnabled(true)
        }
    }

    @objc
    func decrementCount() {
        guard currentCount > 0 else { return }
        
        currentCount -= 1
        counterLabel.text = "\(currentCount)"

        if currentCount == 0 && decrementButton.isEnabled {
            setDecrementButtonEnabled(false)
        }
    }

    @objc
    func resetCounter() {
        currentCount = 0
        counterLabel.text = "\(currentCount)"
        setDecrementButtonEnabled(false)
    }

    func setDecrementButtonEnabled(_ isEnabled: Bool) {
        guard decrementButton.isEnabled != isEnabled else { return }
        decrementButton.isEnabled = isEnabled
    }

}
