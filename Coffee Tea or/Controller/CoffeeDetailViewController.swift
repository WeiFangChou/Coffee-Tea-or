//
//  DetailViewController.swift
//  Coffee Tea or
//
//  Created by WeiFangChou on 2021/5/4.
//

import UIKit
import SafariServices

class CoffeeDetailViewController: UIViewController {
    
    var coffee: Coffee?
    @IBOutlet var coffeeDetailTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let coffee = coffee{
            print("Coffee Detail : \(coffee)")
            
        }
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.tintColor = .none
        navigationController?.hidesBarsOnSwipe = false
        
        coffeeDetailTableView.cellLayoutMarginsFollowReadableWidth = true
        
        
        // Do any additional setup after loading the view.
    }
    
    

}
extension CoffeeDetailViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 16
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CoffeeDetailMapsTableViewCell.self), for: indexPath) as! CoffeeDetailMapsTableViewCell
            if let location = coffee?.address{
                cell.configure(location: location)
            }
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CoffeeDetailLabelTableViewCell.self), for: indexPath) as! CoffeeDetailLabelTableViewCell
            cell.img.image = UIImage(named: "shop")
            if let name = coffee?.name{
                cell.coffeetextLabel.text = name
            }
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CoffeeDetailLabelTableViewCell.self), for: indexPath) as! CoffeeDetailLabelTableViewCell
            cell.img.image = UIImage(named: "cityhall")
            if let city = coffee?.city {
                cell.coffeetextLabel.text = city.uppercased()
                
            }
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CoffeeDetailscoreTableViewCell.self), for: indexPath) as! CoffeeDetailscoreTableViewCell
            cell.imageView?.image = UIImage(named: "wifi")
            if let wifi = coffee?.wifi{
                cell.scoreImageView.value = CGFloat(wifi)
            }
            return cell
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CoffeeDetailscoreTableViewCell.self), for: indexPath) as! CoffeeDetailscoreTableViewCell
            cell.imageView?.image = UIImage(named: "seat")
            if let seat = coffee?.seat {
                cell.scoreImageView.value = CGFloat(seat)
            }
            return cell
        case 5:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CoffeeDetailscoreTableViewCell.self), for: indexPath) as! CoffeeDetailscoreTableViewCell
            cell.imageView?.image = UIImage(named: "quiet")
            if let quiet = coffee?.quiet {
                cell.scoreImageView.value = CGFloat(quiet)
            }
            return cell
        case 6:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CoffeeDetailscoreTableViewCell.self), for: indexPath) as! CoffeeDetailscoreTableViewCell
            cell.imageView?.image = UIImage(named: "tasty")
            if let tasty = coffee?.tasty {
                cell.scoreImageView.value = CGFloat(tasty)
            }
            return cell
        case 7:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CoffeeDetailscoreTableViewCell.self), for: indexPath) as! CoffeeDetailscoreTableViewCell
            cell.imageView?.image = UIImage(named: "coin")
            if let cheap = coffee?.cheap {
                cell.scoreImageView.value = CGFloat(cheap)
            }
            return cell
        case 8:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CoffeeDetailscoreTableViewCell.self), for: indexPath) as! CoffeeDetailscoreTableViewCell
            cell.imageView?.image = UIImage(named: "music")
            if let music = coffee?.music {
                cell.scoreImageView.value = CGFloat(music)
            }
            return cell

        case 9:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CoffeeDetailLabelTableViewCell.self), for: indexPath) as! CoffeeDetailLabelTableViewCell
            cell.imageView?.image = UIImage(named: "url")
            if let url = coffee?.url {
                cell.coffeetextLabel.text = url
            }
            return cell
        case 10:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CoffeeDetailLabelTableViewCell.self), for: indexPath) as! CoffeeDetailLabelTableViewCell
            cell.imageView?.image = UIImage(named: "location")
            if let address = coffee?.address{
                cell.coffeetextLabel.text = address
            }
            return cell
        case 11:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CoffeeDetailLabelTableViewCell.self), for: indexPath) as! CoffeeDetailLabelTableViewCell
            cell.imageView?.image = UIImage(named: "timer")
            if let limited_time = coffee?.limited_time{
                cell.coffeetextLabel.text = limited_time
            }
            return cell
        case 12:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CoffeeDetailLabelTableViewCell.self), for: indexPath) as! CoffeeDetailLabelTableViewCell
            cell.imageView?.image = UIImage(named: "socket")
            if let socket = coffee?.socket{
                cell.coffeetextLabel.text = socket
            }
            return cell
        case 13:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CoffeeDetailLabelTableViewCell.self), for: indexPath) as! CoffeeDetailLabelTableViewCell
            cell.imageView?.image = UIImage(named: "standing_desk")
            if let standing_desk = coffee?.standing_desk{
                cell.coffeetextLabel.text = standing_desk
            }
            return cell
        case 14:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CoffeeDetailLabelTableViewCell.self), for: indexPath) as! CoffeeDetailLabelTableViewCell
            cell.imageView?.image = UIImage(named: "mrt")
            if let mrt = coffee?.mrt{
                cell.coffeetextLabel.text = mrt
            }
            return cell
        case 15:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CoffeeDetailLabelTableViewCell.self), for: indexPath) as! CoffeeDetailLabelTableViewCell
            cell.imageView?.image = UIImage(named: "clock")
            
            if let open_time = coffee?.open_time{
                print("openTime\(open_time)")
                if coffee?.open_time != nil{
                    cell.coffeetextLabel.text = open_time
                }
                
            }
            
            return cell
            
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CoffeeDetailLabelTableViewCell.self), for: indexPath) as! CoffeeDetailLabelTableViewCell
            cell.imageView?.image = UIImage(systemName: "xmark.octagon")
            cell.coffeetextLabel.text = "Failed"
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 9 {
            if let url = URL(string: (coffee?.url)!){
                let safariController = SFSafariViewController(url: url)
                present(safariController, animated: true, completion: nil)
            }
            
            
        }
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showMapView" {
            let desinationController = segue.destination as! MapViewViewController
            desinationController.coffee = coffee
        }
    }



}

