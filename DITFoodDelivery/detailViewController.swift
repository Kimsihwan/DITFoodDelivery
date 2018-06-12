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
        self.title = cellName
    }
    
    // tableView delegate 메소드 호출
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        switch indexPath.row {
        case 0:
            let cell = detailTableView.dequeueReusableCell(withIdentifier: "detailcell", for: indexPath)
            cell.textLabel?.text = "주소: " + cellAddress
            return cell
        case 1:
            let cell = detailTableView.dequeueReusableCell(withIdentifier: "detailcell", for: indexPath)
            cell.textLabel?.text = "전화번호: " + cellTel
            return cell
        case 2:
            let cell = detailTableView.dequeueReusableCell(withIdentifier: "detailcell", for: indexPath)
            cell.textLabel?.text = "메뉴: " + cellMenu
            return cell
        default:
            let cell = detailTableView.dequeueReusableCell(withIdentifier: "mapcell", for: indexPath) as! MapTableViewCell
            cell.configure(location: cellAddress)
            return cell
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailMapView" {
            if detailTableView.indexPathForSelectedRow != nil {
                let destinationController = segue.destination as! MapViewController
                destinationController.location = cellAddress
                destinationController.name = cellName
                destinationController.tel = cellTel
            }
        }
        
    }
    
    

}
