//
//  MainViewController.swift
//  LandiLords
//
//  Created by Duash on 7/16/20.
//  Copyright © 2020 Duale. All rights reserved.
//


/*
   You also need to modify the user interface so it can react when the user scrolls down the list. When they get near the end of the list of loaded moderators, you need to request a new page.

   Because network requests can take a long time, you need to improve the user experience by displaying a spinning indicator view if the moderator information is not yet available.
 
 */

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase
import SafariServices

class MainViewController: UIViewController {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    @IBOutlet weak var tableview : UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    var viewmodel = NetworkViewModel()
    var searchbarConroller = UISearchController(searchResultsController: nil)
    public enum indicatorColor {
        static let color : UIColor =  .white
    }
    override func viewDidLoad() {
        super.viewDidLoad()
//        activityIndicator.color = indicatorColor.color
////        activityIndicator.startAnimating()
////        tableview.isHidden = true
//        tableview.separatorColor = .blue
//        tableview.delegate = self
//        tableview.dataSource = self
        forViewDidLoad()
        response()
        
    
    }
    
    func response () {
        viewmodel.vmResponse(url: UrlPath.path.shared()) { [weak self](_) in
            DispatchQueue.main.async {
                self?.tableview.reloadData()
//                self?.activityIndicator.stopAnimating()
//                print(self?.viewmodel.articles)
            }
        
        }
    }
    
    @IBAction func logOutAction(_ sender: UIBarButtonItem) {
        do {
            try Auth.auth().signOut()
//              let storyBoard = UIStoryboard(name: "Main", bundle: nil)
//              guard let loginVc = storyBoard.instantiateViewController(identifier: "LoginViewController") as? LoginViewController else{return}
//            loginVc.modalPresentationStyle = .fullScreen
//              present(loginVc , animated: true)
            let initialViewController = self.storyboard!.instantiateViewController(withIdentifier: "LoginViewController")
            self.appDelegate.window?.rootViewController = initialViewController
            self.appDelegate.window?.makeKeyAndVisible()
        }
        catch {
            
        }
    }
}


//MARK:-

extension MainViewController {
    func forViewDidLoad() {
//        tableview.isHidden = true
        tableview.separatorColor = .blue
        tableview.delegate = self
        tableview.dataSource = self
        searchbarConroller.searchResultsUpdater = self
        searchbarConroller.searchBar.placeholder = "Enter author name"
        searchbarConroller.obscuresBackgroundDuringPresentation = false
        navigationItem.searchController = searchbarConroller
        definesPresentationContext = true
    }
}

//MAKk:- Datasource Delegate

extension MainViewController : UITableViewDataSource  {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isFiltered ? viewmodel.filteredCount()  : viewmodel.Maincount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell" , for: indexPath)
        cell.textLabel?.text = isFiltered ? viewmodel.getArtatIndexAtFilered(index: indexPath.row).author : viewmodel.getArtatIndexMain(index: indexPath.row).author
        return cell 
    }
}


//MAKk:-  Delegate


extension MainViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      guard let url = URL(string: "https://www.youtube.com/") else {return}
      let svc = SFSafariViewController(url: url )
      present(svc, animated: true, completion: nil)
    }
}


extension MainViewController : UISearchResultsUpdating  {
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        filteredLocations(for: searchBar.text!)
    }
}

extension MainViewController {
    var isFiltered : Bool {
        return !isEmpty  && searchbarConroller.isActive
    }
    
    var isEmpty : Bool {
        return searchbarConroller.searchBar.text?.isEmpty ?? true
    }
    
    func filteredLocations (for searchText: String ) {
        viewmodel.filteredArticles = viewmodel.articles.filter { searchtext in
            return searchtext.author.lowercased().contains(searchText.lowercased())
        }
        DispatchQueue.main.async {
            self.tableview.reloadData()
        }
    }
}

