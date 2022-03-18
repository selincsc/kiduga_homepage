//
//  ViewController.swift
//  kiduga_homepage
//
//  Created by Selin Çağlar on 18.03.2022.
//

import UIKit
import Kingfisher
import Alamofire
import SwiftyJSON
class ViewController: MyController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    override func viewDidLoad() {
        super.viewDidLoad()
        kiduga_request_list()
    }
    @IBOutlet var body_view_outlet: UIView!{
        didSet{
            body_view_outlet.backgroundColor = Color._F2F2F2
        }
    }
    @IBOutlet weak var header_view_outlet: UIView!{
        didSet{
            header_view_outlet.backgroundColor = Color._6CC092
        }
    }
    @IBOutlet weak var person_label_outlet: UILabel!
    @IBOutlet var content_view_outlet: UIView!
   
    @IBOutlet weak var image_view_person_outlet: AnimatedImageView!{
        didSet{
            image_view_person_outlet.makeRounded()
            image_view_person_outlet.layer.borderWidth = 1
            image_view_person_outlet.layer.borderColor = Color._6CC092.cgColor
        }
    }
    @IBOutlet weak var view2_baslik_label_outlet: UILabel!{
        didSet{
            view2_baslik_label_outlet.addLine(position: .bottom, color: Color._6CC092, width: 1.0)
        }
    }
    @IBOutlet weak var name_label_outlet: UILabel!
    @IBOutlet weak var view2_metin_outlet: UILabel!
    @IBOutlet weak var view2_devaminioku_label_outlet: UILabel!
    @IBOutlet weak var table_view_outlet: UITableView!
    @IBOutlet weak var collection_view_1_outlet: UICollectionView!{
        didSet{
            collection_view_1_outlet.dataSource = self
            collection_view_1_outlet.delegate = self
            collection_view_1_outlet.backgroundColor = .clear
            collection_view_1_outlet.addLine(position: .bottom, color: Color._106B77, width: 1.0)
        }
    }
    @IBOutlet weak var collection_view_2_outlet: UICollectionView!{
        didSet{
            collection_view_2_outlet.dataSource = self
            collection_view_2_outlet.delegate = self
            collection_view_2_outlet.backgroundColor = .clear
        }
    }
    @IBOutlet weak var collection_view_3_outlet: UICollectionView!{
        didSet{
            collection_view_3_outlet.dataSource = self
            collection_view_3_outlet.delegate = self
            collection_view_3_outlet.backgroundColor = .clear
        }
    }
    @IBOutlet weak var collection_view_4_outlet: UICollectionView!{
        didSet{
            collection_view_4_outlet.dataSource = self
            collection_view_4_outlet.delegate = self
            collection_view_4_outlet.backgroundColor = .clear
        }
    }
    @IBOutlet weak var collection_view_5_outlet: UICollectionView!{
        didSet{
            collection_view_5_outlet.dataSource = self
            collection_view_5_outlet.delegate = self
            collection_view_5_outlet.backgroundColor = .clear
        }
    }
    @IBOutlet weak var collection_view_6_outlet: UICollectionView!{
        didSet{
            collection_view_6_outlet.dataSource = self
            collection_view_6_outlet.delegate = self
            collection_view_6_outlet.backgroundColor = .clear
        }
    }
}
//MARK: ALAMOFİRE
extension ViewController{
    //ALAMOFIRE JSON
    func kiduga_request_list(){
        let parameters : Parameters = [
            "userId" : "5fb9406f7e6e03193208847d",
        ]
        let url = apiURL + "/getMainPage"
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.httpBody).responseJSON { [self]
            response in
            
            switch response.result {
            case .success(let value):
                
                kiduga = JSON(value)
                collection_view_1_outlet.reloadData()
                collection_view_2_outlet.reloadData()
                collection_view_3_outlet.reloadData()
                collection_view_4_outlet.reloadData()
                collection_view_5_outlet.reloadData()
                collection_view_6_outlet.reloadData()
                table_view_outlet.reloadData()
                view2_baslik_label_outlet.text = kiduga["data"]["weekly"]["tr"]["name"].stringValue
                view2_metin_outlet.text = kiduga["data"]["weekly"]["tr"]["desc"].stringValue
//                person_label_outlet.text = kiduga["data"]["children"]["bDay"]["tr"].stringValue
//                name_label_outlet.text = kiduga["data"]["children"]["name"].stringValue
//
                print(" gelen data: \(kiduga)")
            case .failure(let error):
                Swift.print(error)
            }
        }
    }
}
//MARK: COLLECTIONVIEW
extension ViewController{
    //COLLECTIONVIEW
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return kiduga["data"].count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if (collectionView == collection_view_1_outlet){
            let cell = collection_view_1_outlet.dequeueReusableCell(withReuseIdentifier: "aylikgelisim_CollectionViewCell",for: indexPath) as! aylikgelisim_CollectionViewCell
            Url_To_Image(url: imageBaseURL + kiduga["data"]["monthly"][indexPath.item]["listImage"].stringValue, imageView: cell.image_outlet)
            cell.label_outlet.text = kiduga["data"]["monthly"][indexPath.item]["detail"]["tr"]["name"].stringValue
            cell.view_outlet.backgroundColor = .clear
            cell.layer.cornerRadius = 12
            cell.image_outlet.layer.cornerRadius = 12
            cell.backgroundColor = .clear
            cell.image_outlet.contentMode = .scaleToFill
           
            return cell
            
        }else if (collectionView == collection_view_2_outlet) {
            let cell = collection_view_2_outlet.dequeueReusableCell(withReuseIdentifier: "bebekbakimi_CollectionViewCell",for: indexPath) as! bebekbakimi_CollectionViewCell
            Url_To_Image(url: imageBaseURL + kiduga["data"]["bebek_bakimi"][][indexPath.item]["bakim_img"].stringValue, imageView: cell.image_view_outlet)
            cell.layer.cornerRadius = 12
            cell.backgroundColor = .clear
            cell.view_outlet.layer.cornerRadius = 12
            cell.image_view_outlet.contentMode = .scaleToFill
            return cell
        }else if (collectionView == collection_view_4_outlet) {
            let cell = collection_view_4_outlet.dequeueReusableCell(withReuseIdentifier: "ayinoyuncaklari_CollectionViewCell",for: indexPath) as! ayinoyuncaklari_CollectionViewCell
            Url_To_Image(url: imageBaseURL + kiduga["data"]["toyList"][indexPath.item]["listImage"].stringValue, imageView: cell.image_view_outlet)
            cell.label_outlet.text = kiduga["data"]["toyList"][indexPath.item]["detail"]["tr"]["name"].stringValue
            cell.layer.cornerRadius = 12
            cell.backgroundColor = .clear
            cell.view_outlet.layer.cornerRadius = 12
            cell.image_view_outlet.contentMode = .scaleToFill
            return cell
        }else if (collectionView == collection_view_5_outlet) {
            let cell = collection_view_5_outlet.dequeueReusableCell(withReuseIdentifier: "masal_CollectionViewCell",for: indexPath) as! masal_CollectionViewCell
            Url_To_Image(url: imageBaseURL + kiduga["data"]["storyList"][indexPath.item]["listImage"].stringValue, imageView: cell.image_view_outlet)
            cell.label_outlet.text = kiduga["data"]["storyList"][indexPath.item]["detail"]["tr"]["name"].stringValue
            cell.layer.cornerRadius = 12
            cell.backgroundColor = .clear
            cell.view_outlet.layer.cornerRadius = 12
            cell.image_view_outlet.contentMode = .scaleToFill
            cell.image_view_outlet.layer.cornerRadius = 12
            return cell
        }else if (collectionView == collection_view_6_outlet) {
            let cell = collection_view_6_outlet.dequeueReusableCell(withReuseIdentifier: "mu_zik_CollectionViewCell",for: indexPath) as! mu_zik_CollectionViewCell
            Url_To_Image(url: imageBaseURL + kiduga["data"]["musicList"][][indexPath.item]["listImage"].stringValue, imageView: cell.image_view_outlet)
            cell.label_outlet.text = kiduga["data"]["storyList"][indexPath.item]["detail"]["tr"]["name"].stringValue
            
            cell.layer.cornerRadius = 12
            cell.backgroundColor = .clear
            cell.view_outlet.layer.cornerRadius = 12
            cell.image_view_outlet.contentMode = .scaleToFill
            cell.image_view_outlet.layer.cornerRadius = 12
            return cell
        }
        else{
            let cell = collection_view_3_outlet.dequeueReusableCell(withReuseIdentifier: "bebekgelisimi_CollectionViewCell",for: indexPath) as! bebekgelisimi_CollectionViewCell
            
            Url_To_Image(url: imageBaseURL + kiduga["data"]["bebekGelisim"][indexPath.item]["img_url"].stringValue, imageView: cell.image_view_outlet)
            cell.label_outlet.text = kiduga["data"]["bebekGelisim"][indexPath.item]["text"]["tr"].stringValue
            cell.image_view_outlet.layer.cornerRadius = 12
            cell.view_outlet.backgroundColor = .clear
            cell.layer.cornerRadius = 12
            cell.backgroundColor = .clear
            cell.view_outlet.layer.cornerRadius = 12
            cell.image_view_outlet.contentMode = .scaleToFill
            return cell
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if(collectionView == collection_view_1_outlet){
            return CGSize(width: 360,height: 226)
        }else if(collectionView == collection_view_2_outlet){
            return CGSize(width: 150,height:170 )
        }else if(collectionView == collection_view_4_outlet){
            return CGSize(width: 150,height:170 )
        }else if(collectionView == collection_view_5_outlet){
            return CGSize(width: 170,height:190 )
        }else if(collectionView == collection_view_6_outlet){
            return CGSize(width: 170,height:190 )
        }else{
            return CGSize(width: 360,height: 210)
        }
    }
}
//MARK: TABLEVIEW
extension ViewController{
    //TABLEVIEW
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3;
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table_view_outlet.dequeueReusableCell(withIdentifier: "TableViewCell",for: indexPath) as! TableViewCell
        cell.backgroundColor = .clear
        Url_To_Image(url: imageBaseURL + hedef["data"]["blogList"][indexPath.item]["listImage"].stringValue, imageView: cell.image_view_outlet)
        cell.label_outlet.text = kiduga["data"]["blogList"][indexPath.item]["detail"]["tr"]["name"].stringValue
        cell.label_button_outlet.text = kiduga["data"]["bebek_bakimi"][indexPath.item]["bakim_text"]["tr"].stringValue
        cell.label_button_outlet.layer.cornerRadius = 12
        cell.image_view_outlet.contentMode = .scaleToFill
        cell.image_view_outlet.layer.cornerRadius = 12
        cell.view_outlet.layer.cornerRadius = 12
        cell.layer.cornerRadius = 12
        let when = DispatchTime.now() + 0.05 //Burası 0.05 sani bekletiyor.
        
        DispatchQueue.main.asyncAfter(deadline: when){
            
            DispatchQueue.main.async{ [self] in
                
                content_view_outlet.autoresizesSubviews = false //contentview autoresize false yapıyoruz ki büyütürken herşey büyümesin.
                table_view_outlet.setFrameHeight(height: table_view_outlet.contentSize.height) //tableview'i içindeki nesnelerin boyutu kadar büyütüyoruz.
                content_view_outlet.setFrameHeight(height: table_view_outlet.frame.maxY + 20) //contentviewe tableview max y + 20 kadar büyütüyoruz.
                content_view_outlet.autoresizesSubviews = true //contentview autoresize true yapıyoruz. eski haline herşey dönsün.
            }
        }
            return cell
    }
}
