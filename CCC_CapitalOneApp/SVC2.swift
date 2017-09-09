//
//  SCV2.swift
//  CCC_CapitalOneApp
//
//  Created by Carlos Carrillo on 8/29/17.
//  Copyright © 2017 Carlos Carrillo. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class SVC2: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var myLabel1: UILabel!
    @IBOutlet weak var myLabel2: UILabel!
    @IBOutlet weak var myTableView: UITableView!
    
    lazy var SVCViewModel2:SVCModel2 = SVCModel2(delegateSVCModel2: self)
    
    var passArray:[Product]?
    var nameToPass:String?
    var descToPass:String?
    var imageToPass:String?
    let images = [#imageLiteral(resourceName: "card1"), #imageLiteral(resourceName: "card2"), #imageLiteral(resourceName: "card2"), #imageLiteral(resourceName: "card1")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SVCViewModel2.getMasterArray(array: passArray!)
        let bundle = Bundle(for: CustomTableViewCell.self)
        let nib = UINib(nibName: "CustomeViewCell", bundle: bundle)
        self.myTableView.register(nib, forCellReuseIdentifier: "CustomCell")
    }
    
    // Load the table every single time you get to this tab
    override func viewWillAppear(_ animated: Bool) {
        myTableView.reloadData()
    }
    
    // Populate table with output array
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SVCViewModel2.getCounter()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.myTableView.dequeueReusableCell(withIdentifier: "CustomCell") as! CustomTableViewCell
        let name = SVCViewModel2.getName(index: indexPath.row)
        cell.fillCell(with: name, image: images[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Get Values to be passed
        nameToPass = SVCViewModel2.getName(index: indexPath.row)
        imageToPass = SVCViewModel2.getImage(index: indexPath.row)
        descToPass = SVCViewModel2.getDescription(index: indexPath.row)
        performSegue(withIdentifier: "mySegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "mySegue") {
            // Initialize new view controller with desired target
            let viewController = segue.destination as! TVC2
            viewController.passedName = nameToPass   // Pass Values
            viewController.passedDesc = descToPass   // Pass Values
            viewController.passedImage = imageToPass // Pass Values
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension SVC2:VMDelegate5{
    
    func updateTableView() {
        DispatchQueue.main.async {
            self.myTableView.reloadData()
        }
    }
}