//
//  totalViewController.swift
//  DITFoodDelivery
//
//  Created by D7702_10 on 2018. 6. 7..
//  Copyright © 2018년 ksh. All rights reserved.
//

import UIKit
import MapKit

class totalViewController: UIViewController {
    @IBOutlet weak var totalMapView: MKMapView!
    
    var tMapAddeess:[String] = []
    var tMapName:[String] = []
    var tMapTel:[String] = []
    var annotations = [MKPointAnnotation]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //중심 위도, 경도로 설정
        let center = CLLocationCoordinate2D(latitude: 35.165782, longitude: 129.072529)
        
        //반경(zoom in, zoom out) 설정
        let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        
        //region 객체는 center, span을 묶는것
        let region = MKCoordinateRegion(center: center, span: span)
        
        print(tMapAddeess)
        print(tMapName)
        print(tMapTel)
         viewMap(tMapAddeess: tMapAddeess, tMapName: tMapName, tMapTel: tMapTel)
        let pin02 = MKPointAnnotation()
        pin02.coordinate = center
        pin02.title = "동의과학대"
        pin02.subtitle = "051-852-0011"
        totalMapView.addAnnotation(pin02)
    }
    var count = 0
    func  viewMap(tMapAddeess:[String], tMapName:[String], tMapTel:[String]) {
        for loc in tMapAddeess {
            let geoCoder = CLGeocoder()
            geoCoder.geocodeAddressString(loc , completionHandler: {
                (placemarks: [CLPlacemark]?, error: Error?) -> Void in
                if let error = error {
                    print(error)
                    return
                }
                if placemarks != nil {
                    let placemark = placemarks![0]
                    print(placemarks![0])
                
                    // pin point 을 저장
                    let annotation = MKPointAnnotation()
                    if let location = placemark.location {
                        // Add annotation
                        annotation.title = self.tMapName[self.count]
                        annotation.subtitle = self.tMapTel[self.count]
                        self.count = self.count + 1
                        annotation.coordinate = location.coordinate
                        self.annotations.append(annotation)
                        self.totalMapView.addAnnotations(self.annotations)
                    }
                }
                self.totalMapView.showAnnotations(self.annotations, animated: true)
            })
        }
    }
}
