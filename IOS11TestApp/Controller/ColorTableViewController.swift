//
//  ColorTableViewController.swift
//  IOS11TestApp
//
//  Created by Tanveer Bashir on 6/6/17.
//  Copyright © 2017 Tanveer Bashir. All rights reserved.
//

import UIKit

class ColorTableViewController: UITableViewController {

    private var colors: [ColorPalette] = []
    override func viewDidLoad() {
        super.viewDidLoad()

        getData()
        self.title = "256 Colors"
        //setNavTitle()
    }

    private func setNavTitle() {
        // New navbar title Swift 4.0 Style
        title = "256 Colors".capitalized
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .automatic
    }

    private func getData() {
        let file = Bundle.main.path(forResource: "256Color", ofType: "json")
        let contentOfFile = try! String(contentsOfFile: file!)
        let jsonData = """
            \(contentOfFile)
            """.data(using: .utf8)!
        let decoder = JSONDecoder()
        do {
            colors = try decoder.decode([ColorPalette].self, from: jsonData)
            tableView.reloadData()
        } catch {
            print(error)
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DetailViewController" {
            guard let indexPath = sender as? IndexPath else { return }
            let dvc = segue.destination as! DetailViewController
            dvc.configure(color: colors[indexPath.row])
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyTableViewCell
        let color = colors[indexPath.row]
        cell.configure(color)
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "DetailViewController", sender: indexPath)
    }
}
