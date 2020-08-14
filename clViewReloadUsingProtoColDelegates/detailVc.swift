//
//  detailVc.swift
//  clViewReloadUsingProtoColDelegates
//
//  Created by Bhargava on 14/08/20.
//  Copyright © 2020 Bhargava. All rights reserved.
//

import UIKit
protocol clReloadDelegate {
    func ClviewReload()
}
class detailVc: UIViewController {
    var Delegate:clReloadDelegate!
    var imageUrl:UIImage!
    var imageTitle = String()
    var id = String()
    var albumId = String()
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var albumIdLbl: UILabel!
    @IBOutlet weak var idLbl: UILabel!
    @IBOutlet weak var imageGet: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.albumIdLbl.text = albumId
        self.idLbl.text = id
        self.imageGet.image = imageUrl
        self.titleLbl.text = imageTitle
        Delegate.ClviewReload()
    }
    


}
