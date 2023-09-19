//
//  CadastrarViewController.swift
//  3D_LetíciaSilvaFrança_21
//
//  Created by COTEMIG on 02/09/23.
//

import UIKit

protocol CadastrarViewControllerDelegate : AnyObject {
    func salvar (item: Extrato)
}

class CadastrarViewController: UIViewController {
    var delegate : CadastrarViewControllerDelegate?
    
    
    @IBOutlet weak var txtDescricao: UITextField!
    @IBOutlet weak var txtData: UITextField!
    @IBOutlet weak var txtValor: UITextField!
    @IBOutlet weak var txtTipo: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func btnCadastrar(_ sender: Any) {
        if let desc = txtDescricao.text,
           let tipo = txtTipo.text,
           let valor = txtValor.text,
           let data = txtData.text,
           
            desc.count > 0 && !tipo.isEmpty && !valor.isEmpty && !data.isEmpty {
            
            
            let item = Extrato (descricao: desc, tipo: tipo, valor: valor, data: data)
            delegate?.salvar(item: item)
            
            self.navigationController?.popViewController(animated: true)
        }
    }
}
