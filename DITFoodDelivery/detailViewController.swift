//
//  detailViewController.swift
//  DITFoodDelivery
//
//  Created by D7702_10 on 2018. 5. 31..
//  Copyright © 2018년 ksh. All rights reserved.
//

import UIKit

class detailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    @IBOutlet weak var detailImage: UIImageView!
    @IBOutlet weak var detailTableView: UITableView!
    
    var cellName = ""
    var cellImage = ""
    
    
    var cellAddress = ""
    var cellType = ""
    var cellTel = ""
    var cellMenu = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //UIViewController와 delegate 객체 연결
        detailTableView.dataSource = self
        detailTableView.delegate = self
        detailImage.image = UIImage(named: cellImage)
    }
    
    // tableView delegate 메소드 호출
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = detailTableView.dequeueReusableCell(withIdentifier: "detail", for: indexPath)
        
        switch indexPath.row {
        case 0:
            cell.textLabel?.text = "음식점 종류: " + cellType
            return cell
        case 1:
            cell.textLabel?.text = "메뉴: " + cellMenu
            return cell
        case 2:
            cell.textLabel?.text = "주소: " + cellAddress
            return cell
        default:
            cell.textLabel?.text = "전화번호: " + cellTel
            return cell
        }
        
    }
    
    

}
