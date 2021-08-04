//
//  ConcentrationThemeChooserViewControlerViewController.swift
//  teste
//
//  Created by sara.batista.d.felix on 14/05/21.
//  Copyright © 2021 Stanford. All rights reserved.
//

import UIKit

class ConcentrationThemeChooserViewController: VCLLoggingViewController, UISplitViewControllerDelegate {

    override var vclLoggingName: String {
        return "ThemeChooser"
    }
    
    let themes = [
        "Sports": "⚽️🏀🏈⚾️🎾🏐🏉🎱🏓⛷🎳⛳️",
        "Animals": "🐶🦆🐹🐸🐘🦍🐓🐩🐦🦋🐙🐏",
        "Faces": "😀😌😎🤓😠😤😭😰😱😳😜😇"
    ]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        splitViewController?.delegate = self
    }
    
    private func splitViewController(_ splitViewController: UISplitViewController,
                             collapseSecondary secondaryViewController: UIViewController,
                             onto primaryViewController: UIViewController
                            ) -> Bool {
        if let cvc = secondaryViewController as? ConcentrationViewController {
            if cvc.theme == nil {
                return true
            }
        }
        return false
    }
    
    @IBAction func changeTheme(_ sender: Any) {
//        if let cvc = splitViewDetailConcentrationViewController {
//            if let themeName = (sender as? UIButton)?.currentTitle, let theme = themes[themeName] {
//                cvc.theme = theme
//            }
//        } else if let cvc = lastSeguedToConcentrationViewController {
//            if let themeName = (sender as? UIButton)?.currentTitle, let theme = themes[themeName] {
//                cvc.theme = theme
//            }
//
//            navigationController?.pushViewController(cvc, animated: true)
//        }
//        else {
            performSegue(withIdentifier: "Choose Theme", sender: sender as! UIButton)
//        }
    }
    
    private var splitViewDetailConcentrationViewController: ConcentrationViewController? {
        return splitViewController?.viewControllers.last as? ConcentrationViewController
    }
    
    private var lastSeguedToConcentrationViewController: ConcentrationViewController?
    
    private func splitViewController(_ splitViewController: UISplitViewController,
                             collapseSecondary secondaryViewController: VCLLoggingViewController,
                             onto primaryViewController: VCLLoggingViewController
        ) -> Bool
    {
        if let cvc = secondaryViewController as? ConcentrationViewController {
            return cvc.theme == nil
        }
        return false
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier, identifier == "Choose Theme", let cvc = segue.destination as? ConcentrationViewController {
            if let themeName = (sender as? UIButton)?.currentTitle, let theme = themes[themeName] {
                cvc.theme = theme
                lastSeguedToConcentrationViewController = cvc
            }
        }
    }
}

