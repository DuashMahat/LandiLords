//
//  MainViewController.swift
//  LandiLords
//
//  Created by Duash on 7/16/20.
//  Copyright © 2020 Duale. All rights reserved.
//


/*
     
 
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
    var cellIdentifier : String {
       return "cell"
    }
    var navName : String {
       return "Enter State"
    }
    var searchbarConroller = UISearchController(searchResultsController: nil)
    public enum indicatorColor {
        static let color : UIColor =  .white
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        forViewDidLoad()
        response()
        
    
    }
    
    func response () {
        viewmodel.vmResponse(url: UrlPath.path.sharedStatesUrl()) { [weak self](_) in
            DispatchQueue.main.async {
                self?.tableview.reloadData()
            }
        
        }
    }
    
    @IBAction func logOutAction(_ sender: UIBarButtonItem) {
        do {
            try Auth.auth().signOut()
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
//        tableview.background()
        searchbarConroller.searchResultsUpdater = self
        searchbarConroller.searchBar.placeholder = navName
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
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier , for: indexPath)
        cell.editBackground()
        cell.textLabel?.text = isFiltered ? viewmodel.getArtatIndexAtFilered(index: indexPath.row).name : viewmodel.getArtatIndexMain(index: indexPath.row).name
        return cell 
    }
}


//MAKk:-  Delegate


extension MainViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        let st = isFiltered ? viewmodel.filteredStates[indexPath.row].abbreviation.lowercased() : viewmodel.states[indexPath.row].abbreviation.lowercased()
        guard let url = URL(string: UrlPath.path.firstpath + st + UrlPath.path.lastpath ) else {return}
        print(url)
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
        viewmodel.filteredStates = viewmodel.states.filter { searchtext in
            return searchtext.name.lowercased().contains(searchText.lowercased())
        }
        DispatchQueue.main.async {
            self.tableview.reloadData()
        }
    }
}

