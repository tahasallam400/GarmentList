//
//  ViewController.swift
//  Technical Assessment
//
//  Created by TAHA SALLAM on 12/20/20.
//

import UIKit

class GarmentListViewController: UIViewController {
    
    @IBOutlet weak var sortBtnOption: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    
    let garmentListDataSource = GarmentListDataSource()
    
    lazy var garmentListViewModel:GarmentListViewModel = {
        return  GarmentListViewModel(garmentList: garmentListDataSource)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureViewModel()
    }
    
    func configureUI(){
        tableView.register(UINib.init(nibName: "DefaultCell", bundle: nil), forCellReuseIdentifier: "DefaultCell")
        tableView.register(UINib.init(nibName: "NoDataExistCell", bundle: nil), forCellReuseIdentifier: "NoDataExistCell")
        sortBtnOption.addTarget(self, action: #selector(indexChanged(_:)), for: .valueChanged)
        sortBtnOption.setTitle(String.Localization.Alpha, forSegmentAt: 0)
        sortBtnOption.setTitle(String.Localization.CreationTime, forSegmentAt: 1)
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(showAddGermentView))
        navigationItem.title = String.Localization.List
    }
    
    
    @objc func indexChanged(_ sender: UISegmentedControl) {
        self.garmentListViewModel.fetch(sortType: SortOption(rawValue: sortBtnOption.selectedSegmentIndex)!)
    }
    
    @objc func showAddGermentView(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "GarmentAddViewController") as! GarmentAddViewController
        vc.updateGarmentListDelegate = self
         navigationController?.pushViewController(vc,
         animated: true)
    }
    
    
    func configureViewModel(){
        tableView.dataSource = self.garmentListDataSource
        tableView.delegate = self.garmentListDataSource
       
        self.garmentListViewModel.fetch(sortType: SortOption(rawValue: sortBtnOption.selectedSegmentIndex)!)
        self.garmentListDataSource.data.addAndNotify(observer: self) { [weak self] in
            self?.tableView.reloadData()
        }
    }
}





