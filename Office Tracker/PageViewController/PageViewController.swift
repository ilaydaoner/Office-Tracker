//
//  PageViewController.swift
//  Office Tracker
//
//  Created by Mac on 23.08.2022.
//

import UIKit

class PageViewController: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {

            if viewController == vcs.last{
                return vcs.first
            } else if viewController == vcs.first{
                return nil
            } else {
                return nil
            }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
            if viewController == vcs.first{
                return vcs.last
            } else if viewController == vcs.last{
                return nil
            } else {
                return nil
            }
        }

    

    let listVC = OfficeListScreen()
    let mapVC = MapViewController()
    var vcs = [UIViewController]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //let storyboard1 = UIStoryboard(name: "Main", bundle: nil)
        //let destinationVC1: OfficeListScreen = storyboard1.instantiateViewController(withIdentifier: "OfficeListScreen") as! OfficeListScreen
        //let storyboard2 = UIStoryboard(name: "Main", bundle: nil)
        //let destinationVC2: MapViewController = storyboard2.instantiateViewController(withIdentifier: "MapViewController") as! MapViewController
        vcs = [listVC, mapVC]
        
        delegate = self
        dataSource = self
        
        if let vc = vcs.first{
            setViewControllers([vc], direction: .forward, animated: true)
        
        //vcs = [destinationVC1,destinationVC2]
        
        
        if let vc = vcs.first {
            setViewControllers([vc], direction: .forward, animated: true)
        }
        
       
    }


}

//extension PageViewController: UIPageViewControllerDelegate, UIPageViewControllerDataSource{
    
    //func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
       // if viewController == vcs.last{
          //  return vcs.first
        // } else if viewController == vcs.first{
        //    return nil
        //} else {
        //    return nil
        // }
        //}
    
        //func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        //if viewController == vcs.first{
        //    return vcs.last
        //} else if viewController == vcs.last{
        //    return nil
        //} else {
        //   return nil
        //}
        //}
    
    
}

