//
//  PDFViewController.swift
//  FileView
//
//  Created by Jigyasaa Sood on 12/18/20.
//

import UIKit
import PDFKit

class PDFViewController: UIViewController {

    @IBOutlet weak var pdfView: PDFView!
    
    var pdfFile:File!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
                

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        if let file = pdfFile{
            print(file.url)
            let pdfDocument = PDFDocument(url:file.url)
            self.pdfView.displayMode = .singlePageContinuous
            self.pdfView.autoScales = true
            self.pdfView.displayDirection = .vertical
            self.pdfView.document = pdfDocument
                    
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
