//
//  ViewController.swift
//  HealthyFood
//
//  Created by Kirill on 18.03.18.
//  Copyright © 2018 Kirill. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPageViewControllerDataSource {
    
    var pageImages:NSArray!
    var pageViewController:UIPageViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        pageImages = NSArray(objects:"Image1","Image2")
        self.pageViewController = self.storyboard?.instantiateViewController(withIdentifier: "WelcomePageViewController") as! UIPageViewController
        
        self.pageViewController.dataSource = self
        
        let initialContentViewController = self.pageTutorialAtIndex(0) as ContentPageHolderViewController
        
        self.pageViewController.setViewControllers([initialContentViewController], direction: UIPageViewControllerNavigationDirection.forward, animated: true, completion: nil)
        
        self.pageViewController.view.frame = CGRect(x: 0, y: 100, width: self.view.frame.size.width, height: self.view.frame.size.height-100)
        
        self.addChildViewController(self.pageViewController)
        self.view.addSubview(self.pageViewController.view)
        self.pageViewController.didMove(toParentViewController: self)
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func pageTutorialAtIndex(_ index: Int) -> ContentPageHolderViewController
    {
        
        let pageContentViewController = self.storyboard?.instantiateViewController(withIdentifier: "ContentPageHolderViewController") as! ContentPageHolderViewController
        
        pageContentViewController.imageFileName = pageImages[index] as! String
        pageContentViewController.pageIndex = index
        
        
        return pageContentViewController
        
    }
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController?
    {
        let viewController = viewController as! ContentPageHolderViewController
        var index = viewController.pageIndex as Int
        
        if(index == 0 || index == NSNotFound)
        {
            return nil
        }
        
        index -= 1
        
        return self.pageTutorialAtIndex(index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController?
    {
        let viewController = viewController as! ContentPageHolderViewController
        var index = viewController.pageIndex as Int
        
        if((index == NSNotFound))
        {
            return nil
        }
        
        index += 1
        
        if(index == pageImages.count)
        {
            return nil
        }
        
        return self.pageTutorialAtIndex(index)
    }
    
    
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int
    {
        return pageImages.count
    }
    
    
    
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int
    {
        return 0
    }
    
    

    @IBAction func pushSkipButton(_ sender: Any)
    {
        let defaults = UserDefaults.standard
        
        defaults.setValue(true, forKey: "skipTutorialPages")
        
        defaults.synchronize()
        
        
        let registerView: RegisterViewController = self.storyboard?.instantiateViewController(withIdentifier: "RegisterViewController") as! RegisterViewController
        
        let appdelegate = UIApplication.shared.delegate as! AppDelegate
        
        appdelegate.window!.rootViewController = registerView
    }
    
}

