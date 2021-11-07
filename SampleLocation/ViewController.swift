//
//  ViewController.swift
//  SampleLocation
//
//  Created by 송유찬 on 2021/11/07.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {

    let locationManger = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManger.delegate = self
        
        // 정확도를 최고로 설정
        locationManger.desiredAccuracy = kCLLocationAccuracyBest
        
        // 업데이트 이벤트가 발생하기전 장치가 수평으로 이동해야 하는 최소 거리(미터 단위)
        locationManger.distanceFilter = 100
        
        // 앱의 사용중과 관계없이 위치 서비스에 대한 사용자의 권한을 요청
        locationManger.requestAlwaysAuthorization()
        
        // 앱이 suspend 상태일때 위치정보를 수신받는지에 대한 결정
        locationManger.allowsBackgroundLocationUpdates = true
        
        // location manager가 위치정보를 수신을 일시 중지 할수 있는지에 대한 결정
        locationManger.pausesLocationUpdatesAutomatically = false
        
        //위치 업데이트 시작
        locationManger.startUpdatingLocation()
    }
}

extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            let latitude = location.coordinate.latitude
            let longitude = location.coordinate.longitude
            
            print("latitude is \(latitude), longitude is \(longitude)")
        }
    }
}

