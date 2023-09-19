//
//  CelulaCustomizadaTableViewCell.swift
//  3D_LetíciaSilvaFrança_21
//
//  Created by COTEMIG on 02/09/23.
//

import UIKit

class CelulaCustomizadaTableViewCell: UITableViewCell {

    @IBOutlet weak var lblTitulo: UILabel!
    @IBOutlet weak var lblSubtitulo: UILabel!
    @IBOutlet weak var lblDetalhe: UILabel!

    
    func popularCelula(item: Extrato) {
        lblTitulo.text = item.descricao
        lblSubtitulo.text = item.tipo
        lblDetalhe.text = item.data
    }
}
