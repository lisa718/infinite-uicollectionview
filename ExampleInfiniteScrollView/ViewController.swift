//
//  ViewController.swift
//  ExampleInfiniteScrollView
//
//  Created by Mason L'Amy on 04/08/2015.
//  Copyright (c) 2015 Maso Apps Ltd. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    @IBOutlet weak var infiniteCollectionView: InfiniteCollectionView!
    {
        didSet
        {
            infiniteCollectionView.backgroundColor = UIColor.whiteColor()
            infiniteCollectionView.registerNib(UINib(nibName: "ExampleCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cellCollectionView")
            infiniteCollectionView.infiniteDataSource = self
            infiniteCollectionView.reloadData()
        }
    }
    
    private let cellItems = ["One", "Two", "Three", "Four", "Five", "Six"]
    private let cellWidth = CGFloat(70.0)

    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
}

extension ViewController: InfiniteCollectionViewDataSource
{
    func widthForCellAtIndexPath(indexPath: NSIndexPath) -> CGFloat
    {
        return cellWidth
    }
    
    func numberOfItems(collectionView: UICollectionView) -> Int
    {
        return cellItems.count
    }
    
    func cellForItemAtIndexPath(collectionView: UICollectionView, dequeueIndexPath: NSIndexPath, usableIndexPath: NSIndexPath)  -> UICollectionViewCell
    {
        let cell = infiniteCollectionView.dequeueReusableCellWithReuseIdentifier("cellCollectionView", forIndexPath: dequeueIndexPath) as! ExampleCollectionViewCell
        cell.lbTitle.text = cellItems[usableIndexPath.row]
        cell.backgroundImage.image = UIImage(named: "cell-1")
        return cell
            
    }
}
