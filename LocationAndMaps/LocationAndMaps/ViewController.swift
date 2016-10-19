//
//  ViewController.swift
//  LocationAndMaps
//
//  Created by Test on 17.10.2016..
//  Copyright © 2016. ena. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    @IBOutlet weak var tableView: UITableView!
    
    var users = [User]()
    var selectedUser = User()
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func sendRequestForUsers(_ sender: UIBarButtonItem) {
        
        let url = URL (string: "https://jsonplaceholder.typicode.com/users")!
        
        URLSession.shared.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
            if let error = error {
                print(error.localizedDescription)
            } else {
                do {
                    let json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! [[String: AnyObject]]
                    
                    self.users = [User]()
                    
                    for userObject in json {
                        
                        let user = User()
                        
                        if let id = userObject["id"] as? Int {
                            user.id = id
                        }
                        
                        if let name = userObject["name"] as? String {
                            user.name = name
                        }
                        if let username = userObject["username"] as? String {
                            user.username = username
                        }
                        
                        if let email = userObject["email"] as? String {
                            user.email = email
                        }
                        
                        if let addressObject = userObject["address"] as? [String : AnyObject] {
                            let address = Address()
                            user.address = address
                            
                            if let street = addressObject["street"] as? String {
                                address.street = street
                            }
                            
                            if let suite = addressObject["suite"] as? String {
                                address.suite = suite
                            }
                            
                            if let city = addressObject["city"] as? String {
                                address.city = city
                            }
                            
                            if let zipcode = addressObject["zipcode"] as? String {
                                address.zipcode = zipcode
                            }
                            
                            if let geoObject = addressObject["geo"] as? [String: AnyObject] {
                                let geo = Geo ()
                                address.geo = geo
                                
                                if let lat = geoObject["lat"] as? String {
                                    geo.lat = lat
                                }
                                
                                if let lng = geoObject["lng"] as? String {
                                    geo.lng = lng
                                }
                            }
                        }
                        
                        if let companyObject = userObject["company"] as? [String: AnyObject] {
                            let company = Company()
                            user.company = company
                            
                            if let name = companyObject["name"] as? String? {
                                company.name = name
                            }
                            
                            if let catchPhrase = companyObject["catchPhrase"] as? String {
                                company.catchPhrase = catchPhrase
                            }
                            
                            if let bs = companyObject["bs"] as? String {
                                company.bs = bs
                            }
                            
                            
                        }
                        self.users.append(user)
                        
                    }
                    DispatchQueue.main.sync {
                        self.putUsersOnMap()
                        self.tableView.reloadData()
                    }
                    
                } catch {
                    print(error)
                }
            }
            }.resume()
    }
    
    func putUsersOnMap() {
        
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyThreeKilometers
        locationManager.delegate = self
        
        
        let coordinate = CLLocationCoordinate2DMake(0.000, 0.000)
        let region = CLCircularRegion(center: coordinate, radius: 1, identifier: "User's region")
        print("Users region")
        locationManager.startMonitoring(for: region)
        let span = MKCoordinateSpanMake(100, 100)
        let userRegion = MKCoordinateRegionMake(coordinate, span)
        mapView.setRegion(userRegion, animated: true)
        
        
        
        for user in users {
            let annonation = MKPointAnnotation()
            let coordinate = CLLocationCoordinate2DMake(Double((user.address?.geo?.lat)!)!, Double((user.address?.geo?.lng)!)!)
            annonation.title = user.name
            annonation.subtitle = (user.address?.street)! + (user.address?.city)!
            annonation.coordinate = coordinate
            mapView.addAnnotation(annonation)
        }
        locationManager.startUpdatingLocation()
    }
    
    func showUsersLocation(user: User){
        
        locationManager.requestWhenInUseAuthorization()
        locationManager.delegate = self
        let coordinate = CLLocationCoordinate2DMake(Double((user.address?.geo?.lat)!)!, Double((user.address?.geo?.lng)!)!)
        let region = CLCircularRegion(center: coordinate, radius: 10000, identifier: "User's region")
        print("Users region")
        locationManager.startMonitoring(for: region)
        let span = MKCoordinateSpanMake(1, 1)
        let userRegion = MKCoordinateRegionMake(coordinate, span)
        mapView.setRegion(userRegion, animated: true)
    }

}


extension ViewController: UITableViewDelegate, UITableViewDataSource, CLLocationManagerDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let user = users[indexPath.row]
        cell.textLabel?.text = user.name
        cell.detailTextLabel?.text = "\(user.address?.city)" + "\(user.address?.street)"
        
        return cell
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return users.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedUser = users[indexPath.row]
        showUsersLocation(user: selectedUser)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(locations.last!)
    }
    
    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        print ("User did enter \(region.identifier)")
    }
    
    func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
        print ("User did exit \(region.identifier)")
    }
    func locationManager(_ manager: CLLocationManager, monitoringDidFailFor region: CLRegion?, withError error: Error) {
        print ("Monitoring failed with error: \(error.localizedDescription)")

    }
    
}


