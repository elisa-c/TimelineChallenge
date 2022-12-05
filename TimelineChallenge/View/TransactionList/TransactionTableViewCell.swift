//
//  TransactionTableViewCell.swift
//  TimelineChallenge
//
//  Created by Elisa Camillo on 04/12/22.
//

import UIKit

class TransactionTableViewCell: UITableViewCell {
    static let identifier = "TransactionTableViewCell"

    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .white
        addViews()
        addConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Views
    lazy var valueLabel = makeValueLabel()
    lazy var titleLabel = makeTitleLabel()
    lazy var iconView = makeIconView()

    // MARK: - View Makers
    func makeValueLabel() -> UILabel {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 22.0)
        label.textColor = UIColor.customGreen
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }

    func makeTitleLabel() -> UILabel {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22.0)
        label.textColor = .darkText
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }

    func makeIconView() -> UIImageView {
        let image = UIImage(named: "")?.withTintColor(UIColor.customOrange)
        let imageView = UIImageView(image: image)
        return imageView
    }

    // MARK: - Setup
    func addViews() {
        contentView.addSubview(iconView)
        contentView.addSubview(valueLabel)
        contentView.addSubview(titleLabel)
    }

    func addConstraints() {
        NSLayoutConstraint.activate([
            iconView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            iconView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            iconView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            iconView.trailingAnchor.constraint(equalTo: valueLabel.leadingAnchor),

            valueLabel.leadingAnchor.constraint(equalTo: iconView.trailingAnchor),
            valueLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            valueLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            valueLabel.bottomAnchor.constraint(equalTo: titleLabel.topAnchor),
            valueLabel.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),

            titleLabel.topAnchor.constraint(equalTo: valueLabel.bottomAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
        ])
    }

    func setupCell(item: Transaction) {
        // TO-DO: configure cell with transaction data and icon
    }

}
