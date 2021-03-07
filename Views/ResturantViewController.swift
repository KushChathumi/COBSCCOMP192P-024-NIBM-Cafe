//
//  ResturantViewController.swift
//  NIBM-Cafe
//
//  Created by Kushani Abeysinghe on 2021-03-07.
//

import UIKit

class ResturantViewController: UIViewController {

    @IBOutlet weak var TableView: UITableView!
    
    var foods = [
        Food(dictionary: ["name":"Double Cheese Burger", "description": "Tangy pickle, chopped onions, ketchup, mustard, and two slices of melted American cheese.", "price":650, "place": "Burger King"]),
        Food(dictionary: ["name":"Chocolate Delights ", "description": "A tempting delicacy made with chocolate chips and topped with rice chocolet sauce", "price":250, "place": "Royal Bakery"]),
        Food(dictionary: ["name":"Pasta Salad", "description": "Pasta, red onion, carrots, tomatoes, broccoli florets, white wine vinegar", "price":550, "place": "Caravan Fresh"]),
        Food(dictionary: ["name":"Chocolate Melt Lava Cake", "description": "Soft, moist chocolate cake with a burst of thick, hot liquid chocole inside", "price":300, "place": "Royal Bakery"]),
        Food(dictionary: ["name":"Seafood Dirty Rice", "description": "Shrimp, Scallions, green onions, Crab meat, Thyme, White pepper, Garlic, Celery, Green bell peppers", "price":950, "place": "Sen-Saal"])
        ] {
        didSet {
            TableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TableView.delegate = self
        TableView.dataSource = self

        // Do any additional setup after loading the view.
    }
}

extension ResturantViewController: UITableViewDelegate {
    func tableView(_ TableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("you tap on \(indexPath.row)")
    }
}

extension ResturantViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foods.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = TableView.dequeueReusableCell(withIdentifier: "FOOD_CELL", for: indexPath) as! RestaurantTableViewCell
        cell.foodName.text = foods[indexPath.row].name
        cell.foodDescription.text = foods[indexPath.row].description
        cell.foodPlace.text = foods[indexPath.row].place
        //cell.locationLabel.text = foods[indexPath.row].location
        return cell 
    }
}
