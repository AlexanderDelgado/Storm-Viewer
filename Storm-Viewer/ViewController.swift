//
//  ViewController.swift
//  Storm-Viewer
//
//  Created by Alexander Delgado on 11/12/16.
//  Copyright © 2016 Alexander Delgado. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var pictures = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // declare constant fm and assign it the value returned by "FileManager.default"
        // This is a data type that lets us work with the file system
        let fm = FileManager.default
        
        // assign path the resource path of our app's bundle
        let path = Bundle.main.resourcePath!
        
        //set to the contents of the directory at 'path'
        // try! means we know the following code is going to contain a value
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        // loops through every item in our array
        for item in items {
            if item.hasPrefix("nssl"){
                pictures.append(item)
            }
        }
        // prints to the deubug console
        print(pictures)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    // method that will pass ina table view as its first parameter
    // _ means it doesn't need to have a name sent externally
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 1. try loading the "Detail" view controller and typecasting it to be DetailViewController
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            // 2. success! Set its selectedImage property
            vc.selectedImage = pictures[indexPath.row]
            
            //3. now push it onto the navigation controller
            navigationController?.pushViewController(vc, animated: true)
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

