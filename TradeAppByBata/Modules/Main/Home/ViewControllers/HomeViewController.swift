//
//  HomeViewController.swift
//  TradeAppByBata
//
//  Created by Дмитрий Пономаренко on 18.03.23.
//

import UIKit


class HomeViewController: UIViewController{
    
    @IBOutlet var categoryCollectionView: UICollectionView!
    
    @IBOutlet var latestCollectionView: UICollectionView!
    
    @IBOutlet var saleCollectionView: UICollectionView!
    
    @IBOutlet var brandCollectionView: UICollectionView!
    
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var scrollView: UIScrollView!
    
    var viewModel: HomeViewModel!
    
    
    var categoryArray = ["phones", "headphones", "games", "cars", "furniture", "kids"]
    var categoryImage = ["PhonesIcon.png", "headphoneImage.png", "gameImage.png", "carsImage.png", "furnitureImage.png", "kidsImage.png"]
    var brandImageArray = ["brand1.png", "brand2.png", "brand3.png"]
    var brandCatgoryArray = ["Phones", "Games", "Games"]
    var brandNameAray = ["Samsung Galaxy S10", "PlayStation 4 console", "Gamepad"]
    var brandPriceArray = ["#80,000", "#100,000", ""]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        categoryCollectionView.dataSource = self
        latestCollectionView.dataSource = self
        saleCollectionView.dataSource = self
        brandCollectionView.dataSource = self
        
        searchBar.layer.cornerRadius = CGFloat(5)
        
        
    }
    
    
    
}
extension HomeViewController: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == latestCollectionView {
            if  viewModel.latest != [] && viewModel.sale != [] {
                return viewModel.latest.count
            } else {
                return 0
            }
        } else if collectionView == saleCollectionView {
            if  viewModel.latest != [] && viewModel.sale != [] {
                return viewModel.sale.count
            } else {
                return 0
            }
        } else if collectionView == brandCollectionView {
            return brandNameAray.count
        }
        
        return categoryArray.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let categoryCell = categoryCollectionView.dequeueReusableCell(withReuseIdentifier: "categoryCell", for: indexPath) as! CategoryCell
        categoryCell.categoryButton.setTitle(categoryArray[indexPath.row], for: .normal)
        categoryCell.categoryButton.setImage(UIImage(named: categoryImage[indexPath.row]), for: .normal)
        
        if collectionView == latestCollectionView {
            let latestCell = collectionView.dequeueReusableCell(withReuseIdentifier: "latestCell", for: indexPath) as! LatestCell
            
            if  viewModel.latest != [] && viewModel.sale != [] {
                
                let latest = viewModel.latest[indexPath.row]
                
                latestCell.latestCategoryName.text = latest.category
                latestCell.latestItemName.text = latest.name
                latestCell.priceItem.text = String(latest.price)
                let url = URL(string: latest.image_url)
                
                let data = try? Data(contentsOf: url!)
                
                if let imageData = data {
                    
                    latestCell.latestImageView.image = UIImage(data: imageData)
                }
            }
            
            return latestCell
        } else if collectionView == saleCollectionView {
            let saleCell = collectionView.dequeueReusableCell(withReuseIdentifier: "saleCell", for: indexPath) as! SaleCell
            
            if viewModel.latest != [] && viewModel.sale != [] {
                let sale = viewModel.sale[indexPath.row]
                
                saleCell.saleCategoryName.text = sale.category
                saleCell.saleItemName.text = sale.name
                saleCell.salePrice.text = String(sale.price)
                saleCell.saleDiscont.text = "\(String(sale.discount))% off"
                
                let url = URL(string: sale.image_url)
                let data = try? Data(contentsOf: url!)
                
                if let imageData = data {
                    
                    saleCell.saleItemImage.image = UIImage(data: imageData)
                }
            }
            
            return saleCell
        } else if collectionView == brandCollectionView {
            let brandCell = collectionView.dequeueReusableCell(withReuseIdentifier: "brandCell", for: indexPath) as! BrandCell
            brandCell.brandImage.image = UIImage(named: brandImageArray[indexPath.row])
            brandCell.brandCategory.text = brandCatgoryArray[indexPath.row]
            brandCell.brandItemName.text = brandNameAray[indexPath.row]
            brandCell.brandPrice.text = brandPriceArray[indexPath.row]
            return brandCell
        }
        return categoryCell
    }
    
}
