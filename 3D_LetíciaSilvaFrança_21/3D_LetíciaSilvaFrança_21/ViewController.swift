//
//  ViewController.swift
//  3D_LetíciaSilvaFrança_21
//
//  Created by COTEMIG on 02/09/23.
//

import UIKit

class ViewController: UITableViewController, CadastrarViewControllerDelegate {
    func salvar(item: Extrato) {
        self.lista.append(item)
        do {
            let serializado = try JSONEncoder().encode(self.lista)
            userDefault.set(serializado, forKey: listKey)
        } catch {
            self.lista.removeAll(where: { $0.data == item.data && $0.tipo == item.tipo && $0.valor == item.valor && $0.descricao == item.descricao  })
        }
    }
    
    var lista: [Extrato] = []
    var userDefault = UserDefaults.standard
    var listKey = "Extrato"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        self.navigationItem.title = "Lançamento Financeiro"
        carregar()
    }
    
    @IBAction func navegar(_ sender: Any) {
        let desc = CadastrarViewController()
        desc.delegate = self
        self.navigationController?.pushViewController(desc, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return lista.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell1") as? CelulaCustomizadaTableViewCell else {
            return UITableViewCell()
        }
        let item = self.lista[indexPath.row]
        cell.popularCelula(item: item)
        return cell
    }
    
    func tabela(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 113.0
    }
    
    func carregar(){
        guard let listData = userDefault.value(forKey: listKey) as? Data else {
            lista = []
            return
        }
        do {
            let savedLista = try JSONDecoder().decode([Extrato].self, from: listData)
            lista = savedLista
            tableView.reloadData()
        } catch {
            print("Erro ao recuperar dados.")
        }
    }
}
