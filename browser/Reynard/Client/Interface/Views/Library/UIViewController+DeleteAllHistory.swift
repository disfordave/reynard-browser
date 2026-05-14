//
//  UIViewController+DeleteAllHistory.swift
//  Reynard
//
//  Created by David on 5/14/26.
//

import UIKit

extension UIViewController {
    func makeDeleteAllHistoryButton() -> UIBarButtonItem {
        let button = UIBarButtonItem(
            title: "Delete All",
            style: .plain,
            target: self,
            action: #selector(presentDeleteAllHistoryConfirmation)
        )
        button.tintColor = .systemRed
        return button
    }
    
    @objc func presentDeleteAllHistoryConfirmation() {
        let alert = UIAlertController(
            title: "Delete All History",
            message: "This will permanently remove your entire browsing history.",
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        alert.addAction(UIAlertAction(title: "Delete All", style: .destructive) { _ in
            HistoryStore.shared.deleteAllHistoryItems()
        })
        present(alert, animated: true)
    }
}
