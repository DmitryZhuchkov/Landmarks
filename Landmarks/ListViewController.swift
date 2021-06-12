//
//  ViewController.swift
//  Landmarks
//
//  Created by Дмитрий Жучков on 08.06.2021.
//

import UIKit
import SnapKit
final class ListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    // MARK: Elements init
    let LandmarksList: UITableView = {
           let tableView = UITableView()
           tableView.translatesAutoresizingMaskIntoConstraints = false
           tableView.register(LandmarkCell.self, forCellReuseIdentifier: "Landmarks")
           return tableView
       }()
    
    let favoriteSwitch: UISwitch = {
           let favSwitch = UISwitch()
           favSwitch.translatesAutoresizingMaskIntoConstraints = false
           return favSwitch
       }()
    
    let lineLabel: UILabel = {
           let line = UILabel()
           line.numberOfLines = 1
           line.backgroundColor = #colorLiteral(red: 0.8940909505, green: 0.8940883279, blue: 0.898322165, alpha: 1)
           return line
       }()
    
    let bottomLineLabel: UILabel = {
           let line = UILabel()
           line.numberOfLines = 1
           line.backgroundColor = #colorLiteral(red: 0.8940909505, green: 0.8940883279, blue: 0.898322165, alpha: 1)
           return line
       }()
    let favoritesLabel: UILabel = {
           let favText = UILabel()
           favText.numberOfLines = 1
           favText.font = UIFont.systemFont(ofSize: 17, weight: .medium)
           favText.translatesAutoresizingMaskIntoConstraints = false
           favText.text = "Favorites only"
           return favText
       }()
    
    // MARK: ViewModel links
    var viewModel = ListViewModel()
    let tempModel = ListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: Table view init
        LandmarksList.dataSource = self
        LandmarksList.delegate = self
        favoriteSwitch.addTarget(self, action: #selector(self.switchStateDidChange(_:)), for: .valueChanged)
        setupView()
        viewModel.getData(tableView: LandmarksList)
        
        // MARK: Table view refresh init
        LandmarksList.refreshControl = UIRefreshControl()
        LandmarksList.refreshControl?.addTarget(self, action: #selector(pullToRefresh), for: .valueChanged)

    }
    
    // MARK: Refreshing func
    @objc func pullToRefresh() {
        if favoriteSwitch.isOn {
            DispatchQueue.global(qos: .background).async {
             self.tempModel.getData(tableView: self.LandmarksList)
                DispatchQueue.main.async {
                     self.viewModel.markList = self.tempModel.markList.filter{$0.isFavorite == true}
                self.LandmarksList.refreshControl?.endRefreshing()
                }
            }
        } else {
           DispatchQueue.global(qos: .background).async {
            self.viewModel.getData(tableView: self.LandmarksList)
               DispatchQueue.main.async {
               self.LandmarksList.refreshControl?.endRefreshing()
               }
           }
        }
        
       }
    
    // MARK: Big title settings
    override func viewWillAppear(_ animated: Bool) {
        navigationItem.largeTitleDisplayMode = .always
        self.title = "Landmarks"
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    
    func setupView() {
        view.backgroundColor = .white
        
        // MARK: Elements constaints
        self.view.addSubview(lineLabel)
        lineLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(1)
        }
        
        self.view.addSubview(favoritesLabel)
        favoritesLabel.snp.makeConstraints { make in
            make.top.equalTo(lineLabel.snp.bottom)
            make.left.equalToSuperview()
        }
        
        self.view.addSubview(favoriteSwitch)
        favoriteSwitch.snp.makeConstraints { make in
            make.top.equalTo(lineLabel.snp.bottom).offset(2)
            make.left.equalTo(favoritesLabel.snp.right)
            make.right.equalToSuperview()
            make.height.equalTo(favoritesLabel.snp.height)
        }
        
        self.view.addSubview(bottomLineLabel)
        bottomLineLabel.snp.makeConstraints { make in
            make.top.equalTo(favoriteSwitch.snp.bottom).offset(2)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(1)
        }
        
        self.view.addSubview(LandmarksList)
        LandmarksList.snp.makeConstraints { make in
            make.top.equalTo(bottomLineLabel.snp.bottom)
            make.bottom.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
    }
    
    // MARK: Switcher func
    @objc func switchStateDidChange(_ sender:UISwitch!)
     {
         if (sender.isOn == true){
            tempModel.markList = viewModel.markList
            viewModel.markList = viewModel.markList.filter{$0.isFavorite == true}
            
            LandmarksList.reloadData()
         }
         else{
            viewModel.markList = tempModel.markList
            LandmarksList.reloadData()
         }
     }
    
    
    // MARK: Table view protocol stubs realizaton
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  viewModel.markList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Landmarks", for: indexPath) as! LandmarkCell
        if let viewModelMark = viewModel.viewModelForMark(at: indexPath.row) {
            cell.configure(viewModel: viewModelMark)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        viewModel.navigateToPost(view: self, name: viewModel.markList[indexPath.row].name,latitude: viewModel.markList[indexPath.row].coordinates.latitude,longitude:viewModel.markList[indexPath.row].coordinates.longitude, imageName: viewModel.markList[indexPath.row].imageName, isFavorite: viewModel.markList[indexPath.row].isFavorite,details:viewModel.markList[indexPath.row].park, state: viewModel.markList[indexPath.row].state)
    }
    
    // MARK: Table view row height
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }

}

