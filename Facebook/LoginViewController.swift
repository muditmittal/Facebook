//
//  LoginViewController.swift
//  Facebook
//
//  Created by Mudit Mittal on 2/10/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    var initialFieldY: CGFloat!
    var initialLabelY: CGFloat!
    var initialLogoY: CGFloat!
    var offsetField: CGFloat!
    var offsetLabel: CGFloat!
    var offsetLogo: CGFloat!
    @IBOutlet weak var fieldParentView: UIView!
    @IBOutlet weak var logoParentView: UIImageView!
    @IBOutlet weak var labelParentView: UIView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var loginIndicator: UIActivityIndicatorView!
    
    
    @IBAction func didPressLogin(sender: AnyObject) {
        loginIndicator.startAnimating()
        loginButton.selected = true
        if emailField.text == "q" && passwordField.text == "q" {
            delay(2, closure: { () -> () in
                self.loginIndicator.stopAnimating()
                self.loginButton.selected = false
                self.performSegueWithIdentifier("firstSegue", sender: nil)
            })
        } else {
            delay(2, closure: { () -> () in
                self.loginIndicator.stopAnimating()
                self.loginButton.selected = false
            })
            let alertController = UIAlertController(title: "Error", message: "Message", preferredStyle: .Alert)
            let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (action) in
            }
            alertController.addAction(cancelAction)
            presentViewController(alertController, animated: true) {
            }

        }
    }
    @IBAction func onButton(sender: AnyObject) {
        //self.activityIndicator.startAnimating()
    }
    @IBAction func editingChange(sender: AnyObject) {
        if emailField.text!.isEmpty || passwordField.text!.isEmpty {
            loginButton.enabled = false
        } else {
            loginButton.enabled = true
        }
    }

    @IBAction func didTap(sender: AnyObject) {
        view.endEditing(true)
    }
    func keyboardWillShow(notification: NSNotification!) {
        
        fieldParentView.frame.origin.y = initialFieldY - offsetField
        labelParentView.frame.origin.y = initialLabelY - offsetLabel
        logoParentView.frame.origin.y = initialLogoY - offsetLogo
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        
        
        fieldParentView.frame.origin.y = initialFieldY + offsetField
        labelParentView.frame.origin.y = initialLabelY + offsetLabel
        logoParentView.frame.origin.y = initialLogoY + offsetLogo
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)

        initialLogoY = logoParentView.frame.origin.y
        offsetLogo = 75
        initialFieldY = fieldParentView.frame.origin.y
        offsetField = 100
        initialLabelY = labelParentView.frame.origin.y
        offsetLabel = 200
        
        
        // Do any additional setup after loading the view.
    }

    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
