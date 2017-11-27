//
//  ViewController.swift
//  GoogleSearchWithGCD
//
//  Created by Kartik Patel on 2017-04-04.
//  Copyright © 2017 Kartik Patel. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var searchLabel: UITextField!
    @IBOutlet weak var imageCollectionView: UICollectionView!
    
    var googleImageQueue:DispatchQueue!
    var images:[UIImage] = []
    let cellIdentifier:String = "imageCell"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    func downloadImages() {
        print("Downloading...")
        // downlad Images
        let searchText = searchLabel.text?.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlPathAllowed)
        
        let url = "https://www.googleapis.com/customsearch/v1?q=\(searchText!)&cx=003540641445219121526:pkpkkavuolg&start=1&key=AIzaSyAvbEBd4nwJwxrxwYaJA1Gln1QS8Bqfxa8&searchType=image"
        
        URLSession.shared.dataTask(with: URL(string:url)! ,completionHandler: { (data:Data?, response:URLResponse?
            , error:Error?) in
            
            if error != nil {
                DispatchQueue.main.sync {
                    self.displayError(error: error!.localizedDescription.description)
                }
                return
            }
            
            var resultsDictionary: [String: Any]?
            
            do {
                resultsDictionary = try JSONSerialization.jsonObject(with: data!, options: []) as? [String: Any]
            } catch {
                print(error)
                return
            }
            if resultsDictionary?["items"] == nil {
                DispatchQueue.main.sync {
                    self.displayError(error: "No Items found")
                }
                return
            }
            let photoResults = resultsDictionary?["items"] as! [[String:Any]]
            
            print(photoResults)
            let googlePhotos : [UIImage] = photoResults.map {
                photoDictionary in
                
                let image = photoDictionary["image"] as! [String: Any]
                let thumbnailURL = image["thumbnailLink"] as! String
                let imageData = NSData(contentsOf: NSURL(string: thumbnailURL)! as URL)
                let googleImage = UIImage(data: imageData! as Data)
                
                return googleImage!
            }
            DispatchQueue.main.async {
                self.show(images: googlePhotos)
            }

        }).resume()
    }
    
    func displayError(error:String) {
       print("error in other thread:" + error)
    }
    
    func show(images imgs : [UIImage]) {
        print("Number of images \(imgs.count)")
        self.images = imgs;
        imageCollectionView.reloadData()
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath)
        let image = images[indexPath.row]
        let imageView = UIImageView(image: image)
        imageView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        cell.addSubview(imageView)
        return cell
    }
    
    @IBAction func textEditChange(_ sender: UITextField) {
        print(sender.text!)
        googleImageQueue = DispatchQueue(label: "googleImageQueue", attributes : .concurrent)
        googleImageQueue.async {
            self.downloadImages()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

