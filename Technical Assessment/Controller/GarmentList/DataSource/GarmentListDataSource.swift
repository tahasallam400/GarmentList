//
//  DataSource11.swift
//  Technical Assessment
//
//  Created by TAHA SALLAM on 12/20/20.
//

import Foundation
import UIKit


public class GarmentListDataSource:GenericDataSource<GamenList>,UITableViewDelegate,UITableViewDataSource{
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch data.value.count {
        case 0:
            return 1
        default:
            return data.value.count
        }
    }
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch data.value.count {
        case 0:
            return tableView.frame.height
        default:
            return 65
        }
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch data.value.count {
        case 0:
            return tableView.dequeueReusableCell(withIdentifier: "NoDataExistCell") ??  UITableViewCell()
        default:
            let cell =  tableView.dequeueReusableCell(withIdentifier: "DefaultCell")
            cell?.textLabel?.text = data.value[indexPath.row].name
            return cell ??  UITableViewCell()
        }
    }
}
