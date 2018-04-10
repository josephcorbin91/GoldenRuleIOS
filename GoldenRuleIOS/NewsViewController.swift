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
    func seedIOSDatabase(){
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "News", in: context)
        let news = NSManagedObject(entity: entity!,insertInto: context)
        news.setValue("time", forKey: "mNewsTitle")
        news.setValue("time", forKey: "mNewsBody")
        news.setValue("time", forKey: "mTime")
        do {
            try context.save()
        }catch{
            print("Failed saving")
        }
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "News")
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject]{
                print(data.value(forKey: "mTime") as! String)
            }
        }
        catch{
            print("Failed")
        }
        
    }

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

        
        for i in 0...100{
            data.append(News)
        }
        // Do any additional setup after loading the view.
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
