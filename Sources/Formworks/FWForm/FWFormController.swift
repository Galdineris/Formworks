//
//  FWFormController.swift
//  
//
//  Created by Artur Carneiro on 29/09/20.
//

import UIKit

final class FWFormController: UIViewController {
    // - MARK: Properties
    private lazy var formCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: setUpCollectionViewLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()

    @available(iOS 13.0, *)
    private func setUpCollectionViewLayout() -> UICollectionViewCompositionalLayout {
        let itemLayoutSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(FormSpec.itemFractionalWidth),
                                                    heightDimension: .fractionalHeight(FormSpec.itemFractionalHeight))
        let item = NSCollectionLayoutItem(layoutSize: itemLayoutSize)

        let groupLayoutSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(FormSpec.groupFractionalWidth),
                                                     heightDimension: .fractionalHeight(FormSpec.groupFractionalHeight))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupLayoutSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)

        return UICollectionViewCompositionalLayout(section: section)
    }

    //- MARK: Init
    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //- MARK: Life cycle
    override func loadView() {
        super.loadView()

    }

    private func setUpCollectionViewConstraints() {
        view.addSubview(formCollectionView)

        NSLayoutConstraint.activate([
            
        ])
    }
}
