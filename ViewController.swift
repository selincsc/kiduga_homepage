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
class ViewController: MyController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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
    @IBOutlet weak var view2_metin_outlet: UILabel!
    @IBOutlet weak var view2_devaminioku_label_outlet: UILabel!
}

