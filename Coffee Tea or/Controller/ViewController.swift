//
//  ViewController.swift
//  Coffee Tea or
//
//  Created by WeiFangChou on 2021/5/4.
//

import UIKit

class ViewController: UIViewController, UISearchControllerDelegate {

    
    
    var coffees : [Coffee] = []
    var searchResults : [Coffee] = []
    var coffeeSearchController: UISearchController!
    var url = "https://cafenomad.tw/api/v1.2/cafes/"
    @IBOutlet var coffeeTableView: UITableView!
    @IBOutlet var tableviewbackground: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationController?.navigationBar.prefersLargeTitles = true
        coffeeSearchController = UISearchController(searchResultsController: nil)
        coffeeSearchController?.searchResultsUpdater = self
        coffeeTableView.tableHeaderView = coffeeSearchController?.searchBar
        coffeeSearchController?.dimsBackgroundDuringPresentation = false
        coffeeSearchController?.searchBar.placeholder = "Search Coffee"
        coffeeSearchController?.searchBar.tintColor = .none
        coffeeSearchController.delegate = self
        coffeeTableView.cellLayoutMarginsFollowReadableWidth = true
        coffeeTableView.backgroundView = tableviewbackground
        coffeeTableView.backgroundView?.isHidden = true
        //Tablet Width
        getData(string: "taipei")
    }
    
    func getData(string: String) {
        if let url = URL(string: url + string) {
            let urlTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let error = error{
                    print(error.localizedDescription)
                    return
                }else if let response = response as? HTTPURLResponse, let data = data {
                    print("Status Code : \(response.statusCode)")
                    
                    let decoder = JSONDecoder()
                    if let coffeeData = try? decoder.decode([Coffee].self, from: data) {
                        DispatchQueue.main.async {
                            if coffeeData != nil{
                                self.coffees = coffeeData
                                self.coffeeTableView.reloadData()
                                print("First : \(self.coffees[0])")
                                print(self.coffees[1])
                            }else{
                                print(coffeeData.count)
                            }
                            
                        }
                    }else{
                        print("Data error")
                        
                    }
                }
            }.resume()
        }else{
            print("Invalid URL...")
        }
    }
    
    func filterContent(for searchText: String) {
        searchResults = coffees.filter({ (coffee) -> Bool in
            if let name = coffee.name, let location = coffee.address{
                let isMatch = name.localizedCaseInsensitiveContains(name) ||  location.localizedCaseInsensitiveContains(location)
            }
            return false
        })
    }
}

extension ViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if coffeeSearchController.isActive{
            return searchResults.count
        }else{
            return coffees.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "CoffeeTableCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! CoffeeTableViewCell
        
        let coffee = (coffeeSearchController.isActive) ? searchResults[indexPath.row] : coffees[indexPath.row]
        cell.coffeeNameLabel.text = coffee.name
        cell.coffeeCityLabel.text = coffee.city
        cell.coffeeAddressLabel.text = coffee.address
            
            
        return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showdetailCoffee"{
            if let indexPath = coffeeTableView.indexPathForSelectedRow{
                let desinationController = segue.destination as! CoffeeDetailViewController
                desinationController.coffee = coffees[indexPath.row]
            }
        }
    }
    
}
//MARK: - UISearchResultsUpdating
extension ViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        if let searchText = searchController.searchBar.text {
            filterContent(for: searchText)
            coffeeTableView.reloadData()
        }
    }
}
