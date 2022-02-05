//
//  MusicViewController.swift
//  IOS_WEEK3_CollectionView
//
//  Created by 홍희수 on 2022/01/18.
//

import UIKit

class MusicViewController: UIViewController {

    @IBOutlet weak var musicCollectionView: UICollectionView!
    
    private var musicList : [MusicDataModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setMusicList()
        
        musicCollectionView.delegate = self
        musicCollectionView.dataSource = self
    }
    
    func setMusicList() {
        musicList.append(contentsOf: [
            MusicDataModel(coverName : "album", musicTitle: "Rock with you", singer: "세븐틴"),
            
            MusicDataModel(coverName : "album", musicTitle: "Rock with you", singer: "세븐틴"),
            
            MusicDataModel(coverName : "album", musicTitle: "Rock with you", singer: "세븐틴"),
            
            MusicDataModel(coverName : "album", musicTitle: "Rock with you", singer: "세븐틴"),
        ])
    }
}

extension MusicViewController : UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return musicList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let musicCell = collectionView.dequeueReusableCell(withReuseIdentifier: MusicCollectionViewCell.identifier, for: indexPath)
                as? MusicCollectionViewCell
        else {return UICollectionViewCell() }
        
        musicCell.setData(imageName: musicList[indexPath.row].coverName,
                          title: musicList[indexPath.row].musicTitle,
                          subtitle: musicList[indexPath.row].singer)
        
        return musicCell
    }
    
    
}

extension MusicViewController : UICollectionViewDelegate
{
    
}

extension MusicViewController : UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = UIScreen.main.bounds.width
        
        let cellWidth = width * (177/375)
        let cellHeight = cellWidth * (205/177)
        
        return CGSize(width: cellWidth, height: cellHeight)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 3
    }
}
