//
//  TableViewController.swift
//  struct-save-userdefaults-demo
//
//  Created by JotaroSugiyama on 2023/01/22.
//

import UIKit

class TableViewController: UITableViewController {
    
    var movies: [Movie] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        loadData()
    }
    
    func loadData() {
        if let loadedMovies = loadMovies(forKey: "movies") {
            movies = loadedMovies
        }
        self.tableView.reloadData()
        print(movies)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = movies[indexPath.row].title
        cell.detailTextLabel?.text = movies[indexPath.row].description
        cell.imageView?.image = UIImage(data: movies[indexPath.row].thumbnail)
        return cell
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
}
