//
//  ViewController.swift
//  fakeApp
//
//  Created by Григорий Душин on 16.08.2023.
//

import UIKit

final class ViewController: UIViewController, UICollectionViewDelegate {
    
    typealias DataSource = UICollectionViewDiffableDataSource<Section, ListItem>
    typealias DataSourceSnapshot = NSDiffableDataSourceSnapshot<Section, ListItem>
    
    private var collectionView: UICollectionView!
    private var topView: UIView!
    var presenter: MarketPresenterProtocol!
    
    private var snapshot = DataSourceSnapshot()
    private lazy var dataSource = configureCollectionViewDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTopView()
        setupCollectionView()
        setupPresenterAndLayout()
    }
    
    // MARK: - Configure UI
    
    private func setupTopView() {
        topView = UIView()
        topView.translatesAutoresizingMaskIntoConstraints = false
        topView.backgroundColor = .white
        view.addSubview(topView)
        
        topView.layer.borderWidth = 0.5
        topView.layer.borderColor = UIColor.systemGray5.cgColor
        
        NSLayoutConstraint.activate(
            [
                topView.topAnchor.constraint(equalTo: view.topAnchor),
                topView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                topView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                topView.heightAnchor.constraint(equalToConstant: 96)
            ]
        )
        
        configureTextField(in: topView)
        configureButton(in: topView)
    }
    
    private func configureTextField(in view: UIView) {
        
        let textField = UITextField()
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.text = TopViewConstants.city
        textField.layer.cornerRadius = 20
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.lightGray.cgColor
        
        let imageView = UIImageView(image: UIImage(named: TopViewConstants.image))
        
        imageView.contentMode = .center

        textField.leftView = imageView
        textField.leftViewMode = .always
        
        view.addSubview(textField)
        
        NSLayoutConstraint.activate(
            [
                textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 13),
                textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -51),
                textField.topAnchor.constraint(equalTo: view.topAnchor, constant: 52),
                textField.heightAnchor.constraint(equalToConstant: 40)
            ]
        )
    }
    
    private func configureButton(in view: UIView) {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: TopViewConstants.button), for: .normal)
        button.tintColor = .systemGreen
        view.addSubview(button)
        
        NSLayoutConstraint.activate(
            [
                button.topAnchor.constraint(equalTo: view.topAnchor, constant: 62),
                button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -13)
            ]
        )
    }
    
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = self
        
        registerCells()
        
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate(
            [
                collectionView.topAnchor.constraint(equalTo: topView.bottomAnchor),
                collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ]
        )
    }
    
    private func setupPresenterAndLayout() {
        presenter = MarketPresenter()
        presenter.view = self
        presenter.getData()
        
        collectionView.collectionViewLayout = createLayout()
        configureHeader()
    }
    
    private func registerCells() {
        
        collectionView.register(CollectionViewCell1.self, forCellWithReuseIdentifier: RegisterCell.firstCell)
        collectionView.register(CollectionViewCell2.self, forCellWithReuseIdentifier: RegisterCell.secondCell)
        collectionView.register(CollectionViewCell3.self, forCellWithReuseIdentifier: RegisterCell.thirdCell)
        collectionView.register(CollectionViewCell4.self, forCellWithReuseIdentifier: RegisterCell.fourthCell)
        collectionView.register(CollectionViewCell5.self, forCellWithReuseIdentifier: RegisterCell.fifthCell)
        collectionView.register(HeaderCollectionViewCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: RegisterCell.headerCell)
        
    }
    
    
    // MARK: - Configure CollectionView DataSource
    
    private func configureCollectionViewDataSource() -> DataSource {
        let dataSource = DataSource(
            collectionView: collectionView) { [weak self] collectionView, indexPath, listItem -> UICollectionViewCell? in
                guard let self = self else { return UICollectionViewCell() }
                
                switch listItem {
                case let .horizontalCircleInfo(img, text):
                    guard let cell = collectionView.dequeueReusableCell(
                        withReuseIdentifier: RegisterCell.firstCell,
                        for: indexPath
                    ) as? CollectionViewCell1 else { return UICollectionViewCell() }
                    cell.setup(img: img, labelText: text)
                    return cell
                    
                case let .horizontalPromoInfo(img):
                    guard let cell = collectionView.dequeueReusableCell(
                        withReuseIdentifier: RegisterCell.secondCell,
                        for: indexPath
                    ) as? CollectionViewCell2 else { return UICollectionViewCell() }
                    cell.setup(img: img)
                    return cell
                    
                case let .horizontalBonusesInfo(img):
                    guard let cell = collectionView.dequeueReusableCell(
                        withReuseIdentifier: RegisterCell.thirdCell,
                        for: indexPath
                    ) as? CollectionViewCell3 else { return UICollectionViewCell() }
                    cell.setup(img: img)
                    return cell
                    
                case let .horizontalMenuInfo(img):
                    guard let cell = collectionView.dequeueReusableCell(
                        withReuseIdentifier: RegisterCell.fourthCell,
                        for: indexPath
                    ) as? CollectionViewCell4 else { return UICollectionViewCell() }
                    cell.setup(img: img)
                    return cell
                    
                case let .horizontalProductsInfo(img):
                    guard let cell = collectionView.dequeueReusableCell(
                        withReuseIdentifier: RegisterCell.fifthCell,
                        for: indexPath
                    ) as? CollectionViewCell5 else { return UICollectionViewCell() }
                    cell.setup(img: img)
                    return cell
                }
            }
        
        return dataSource
    }
    
    private func configureHeader() {
        dataSource.supplementaryViewProvider = { collectionView, kind, indexPath -> UICollectionReusableView? in
            guard let header = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: RegisterCell.headerCell,
                for: indexPath
            ) as? HeaderCollectionViewCell else { return UICollectionReusableView()
            }
            header.setup(header: self.dataSource.snapshot().sectionIdentifiers[indexPath.section].title ?? "")
            return header
        }
    }
    
    // MARK: - Creating sections using CompositionalLayout
    
    private func createLayout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { [weak self] sectionIndex, _ in
            guard let self = self else { return nil }
            
            let section = self.dataSource.snapshot().sectionIdentifiers[sectionIndex].sectionType
            switch section {
                
            case .horizontalCircle:
                let item = NSCollectionLayoutItem(
                    layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
                )
                let group = NSCollectionLayoutGroup.horizontal(
                    layoutSize: .init(widthDimension: .absolute(100), heightDimension: .absolute(120)), subitems: [item]
                )
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
                section.interGroupSpacing = 5
                section.contentInsets = .init(top: 1, leading: 1, bottom: 1, trailing: 1)
                return section
                
            case .horizontalPromo:
                let item = NSCollectionLayoutItem(
                    layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
                )
                let group = NSCollectionLayoutGroup.horizontal(
                    layoutSize: .init(widthDimension: .absolute(400), heightDimension: .absolute(220)), subitems: [item]
                )
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
                section.interGroupSpacing = 3
                section.contentInsets = .init(top: 3, leading: 3, bottom: 3, trailing: 3)
                return section
                
            case .horizontalBonuses:
                let item = NSCollectionLayoutItem(
                    layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
                )
                let group = NSCollectionLayoutGroup.horizontal(
                    layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(150)), subitems: [item]
                )
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .none
                section.interGroupSpacing = 3
                section.contentInsets = .init(top: 3, leading: 3, bottom: 3, trailing: 3)
                return section
                
            case .horizontalMenu:
                let item = NSCollectionLayoutItem(
                    layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
                )
                let group = NSCollectionLayoutGroup.horizontal(
                    layoutSize: .init(widthDimension: .absolute(150), heightDimension: .absolute(170)), subitems: [item]
                )
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
                section.interGroupSpacing = 5
                section.contentInsets = .init(top: 1, leading: 1, bottom: 1, trailing: 1)
                return section
                
            case .horizontalProducts:
                let item = NSCollectionLayoutItem(
                    layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
                )
                let group = NSCollectionLayoutGroup.horizontal(
                    layoutSize: .init(widthDimension: .absolute(150), heightDimension: .absolute(170)), subitems: [item]
                )
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
                section.interGroupSpacing = 5
                section.contentInsets = .init(top: 1, leading: 1, bottom: 1, trailing: 1)
                
                let headerFooterSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(44))
                let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: headerFooterSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top
                )
                section.boundarySupplementaryItems = [sectionHeader]

                return section
                
            }
        }
    }
}

// MARK: - RocketViewProtocol

extension ViewController: MarketViewProtocol {
    
    func presentSections(data: [Section]) {
        
        var snapshot = DataSourceSnapshot()
        snapshot = DataSourceSnapshot()
        for section in data {
            snapshot.appendSections([section])
            snapshot.appendItems(section.items, toSection: section)
        }
        
        self.snapshot = snapshot
        dataSource.apply(snapshot)
    }
}
