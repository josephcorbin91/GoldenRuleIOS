//
//  NewsViewController.swift
//  GoldenRuleIOS
//
//  Created by user132771 on 3/23/18.
//  Copyright © 2018 JohnTuttle. All rights reserved.
//

import UIKit
import CoreData

class NewsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsData.count
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let newsItem = newsData[indexPath.row]
            
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            context.delete(newsItem)
            
            self.newsData.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        
      
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let newsItem = newsData[indexPath.row]
        let newsCell = tableView.dequeueReusableCell(withIdentifier: "newsItemIdentifier", for: indexPath) as! NewsCell
        newsCell.TitleLabel.text=newsItem.value(forKey: "mNewsTitle") as? String
        newsCell.BodyLabel.text=newsItem.value(forKey: "mNewsBody") as? String
        newsCell.TimeLabel.text=newsItem.value(forKey: "mTime") as? String
       
        return newsCell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    private var newsData: [NSManagedObject]=[]

    @IBOutlet weak var newsTableView: UITableView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.newsTableView.delegate=self
        self.newsTableView.dataSource=self
        UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: "news_background.png")?.draw(in: self.view.bounds)
        
        if let image = UIGraphicsGetImageFromCurrentImageContext(){
            UIGraphicsEndImageContext()
            self.view.backgroundColor = UIColor(patternImage: image)
        }else{
            UIGraphicsEndImageContext()
            debugPrint("Image not available")
            
        }
        
        // Add a background view to the table view
        let backgroundImage = UIImage(named: "news_background.png")
        let imageView = UIImageView(image: backgroundImage)
        self.newsTableView.backgroundView = imageView
        // no lines where there aren't cells
        let rect = CGRect(origin: CGPoint(x: 0,y :0), size: CGSize(width: 0, height: 0))

        newsTableView.tableFooterView = UIView(frame: rect)
      
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
            
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "News")
        do{
            newsData = try managedContext.fetch(fetchRequest)
        }
        catch let error as NSError{
            print("Could not fetch")
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
