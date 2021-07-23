//
//  SignupViewController.swift
//  9jalingo
//
//  Created by Samuel Hyeman on 20/07/2021.
//

import UIKit

class SignupViewController: UIViewController {

    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var pageContainer: UIView!
    var frameRect:CGRect = CGRect()
    var currentPageIndex = 1
    var currentPage:UIViewController?
    let pages = 4
    override func viewDidLoad() {
        super.viewDidLoad()
        OpenPage(newPage: CreateNamePageVC(), transitionfromLeft: true)
        progressView.transform = CGAffineTransform(scaleX: 1, y: 1.5)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        if(currentPageIndex == 1){
            dismiss(animated: true, completion: nil)
        }
        currentPageIndex -= 1
        if let page = currentPage{
            ChangeState(oldPage:page,transitionFromLeft: false)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}




extension SignupViewController{
    func CreateNamePageVC() -> NameViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
          // Instantiate View Controller
        let viewController = storyboard.instantiateViewController(withIdentifier: "NameViewController") as! NameViewController
        viewController.pageDelegate = self
          return viewController
    }
    
    func CreateAgePageVC() -> AgeViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
          // Instantiate View Controller
        let viewController = storyboard.instantiateViewController(withIdentifier: "AgeViewController") as! AgeViewController
        viewController.pageDelegate = self
          return viewController
    }
    
    func CreateEmailPageVC() -> EmailViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
          // Instantiate View Controller
        let viewController = storyboard.instantiateViewController(withIdentifier: "EmailViewController") as! EmailViewController
        viewController.pageDelegate = self
          return viewController
    }
    
    func CreatePasswordPageVC() -> PasswordViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
          // Instantiate View Controller
        let viewController = storyboard.instantiateViewController(withIdentifier: "PasswordViewController") as! PasswordViewController
        viewController.pageDelegate = self
          return viewController
    }
    
    func CreateHomePageVC() -> ViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
          // Instantiate View Controller
        let viewController = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as! ViewController
          return viewController
    }
}



extension SignupViewController : PageDelegate{
    
        func nextPage(oldPage: UIViewController) {
            if(currentPageIndex == pages){
                //Perform Segue to congratulatory page
            }
            currentPageIndex += 1
            ChangeState(oldPage: oldPage, transitionFromLeft: true)
        }
    
    
    
        func ChangeState(oldPage:UIViewController,transitionFromLeft:Bool){
            RemovePage(oldPage: oldPage,transitionfromLeft: transitionFromLeft)
            switch currentPageIndex {
            case 1:
                currentPage = CreateNamePageVC()
            case 2:
                currentPage = CreateAgePageVC()
            case 3:
                currentPage = CreateEmailPageVC()
            case 4:
                currentPage = CreatePasswordPageVC()
            case pages+1:
                let homePage = CreateHomePageVC()
                homePage.modalTransitionStyle = .flipHorizontal
                homePage.modalPresentationStyle = .fullScreen
                present(homePage, animated: true, completion: nil)
                //HomeViewController
            default:
                print("problem")
            }
            OpenPage(newPage:currentPage ,transitionfromLeft: transitionFromLeft)
        }
    //Page Fliping In and Out Animation
        
        func OpenPage(newPage : UIViewController?,transitionfromLeft:Bool) {
            var AnimationOptions = UIView.AnimationOptions()
            var xCordinate = CGFloat()
            if(transitionfromLeft){
                AnimationOptions = .transitionFlipFromLeft
                xCordinate = 1000
            }else{
                AnimationOptions = .transitionFlipFromRight
                xCordinate = -1000
            }
             addChild(newPage!)
            pageContainer.addSubview(newPage!.view)
            newPage!.view.frame = CGRect(x: xCordinate, y: 0, width: 0, height: 0)
            // call before adding child view controller's view as subview
            newPage!.didMove(toParent: self)
            
            UIView.animate(withDuration: 0.7, delay: 0.3, options: AnimationOptions) {
                newPage!.view.frame = self.pageContainer.bounds
                self.progressView.setProgress(Float(self.currentPageIndex)/Float(self.pages), animated: true)
            
            }
        }
        
        
        
        
        
        func RemovePage(oldPage : UIViewController?,transitionfromLeft:Bool){
            var AnimationOptions = UIView.AnimationOptions()
            var xCordinate = CGFloat()
            if(transitionfromLeft){
                AnimationOptions = .transitionFlipFromLeft
                xCordinate = -1000
            }else{
                AnimationOptions = .transitionFlipFromRight
                xCordinate = 1000
            }
            UIView.animate(withDuration: 0.7, delay: 0.3, options: AnimationOptions,animations: {
                oldPage!.view.frame = CGRect(x: xCordinate, y:0, width: self.pageContainer.frame.width, height: self.pageContainer.frame.height)
            },completion: { (finished:Bool) in
                if(finished){
                    oldPage?.willMove(toParent: nil)

                    oldPage?.view.removeFromSuperview()

                                // call after removing child view controller's view from hierarchy
                    oldPage?.removeFromParent()
                }
            })
                        // call before removing child view controller's view from hierarchy
        }
        
        
    }


