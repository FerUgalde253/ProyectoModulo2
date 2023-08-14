import UIKit

class WinesViewController: UIViewController {
    
    var tableView : UITableView?
    var winesCollectionView: UICollectionView?
    var wineData = WineData()
    var showMoreButton: UIButton?
    var backButton : UIButton?
    
    var leftPadding : CGFloat = 25

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.myBackGroundColor
        initUI()
        wineData.getData()
        wineData.getImage()
        setConstrains()
        
        
    }
    
    func initUI(){
        tableView = UITableView(frame: CGRect(x: Constants.padding, y: Constants.padding*10, width: Constants.width - Constants.padding*2, height: Constants.height-Constants.padding*10))
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView?.backgroundColor = UIColor.ligtColor2
        tableView?.layer.cornerRadius = 10
        view.addSubview(tableView!)
        
        winesCollectionView = {
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .horizontal
            layout.minimumLineSpacing = Constants.width/15
            layout.minimumInteritemSpacing = Constants.width/10
            
            let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
            collection.register(WineCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
            collection.isPagingEnabled = true
            collection.translatesAutoresizingMaskIntoConstraints = false
            collection.backgroundColor = .clear
            collection.showsVerticalScrollIndicator = true
            collection.showsHorizontalScrollIndicator = true
            return collection
        }()
        //////////////////////////////////////////////////////////////
        let showMoreButton = UIButton()
        showMoreButton.setTitleColor(UIColor.ligtColor1, for: .normal)
        showMoreButton.setTitle("Ver Más", for: .normal)
        showMoreButton.backgroundColor = UIColor.myButtonlColor
        showMoreButton.layer.cornerRadius = 10
        showMoreButton.translatesAutoresizingMaskIntoConstraints = false
        showMoreButton.addTarget(self, action: #selector(goToGrid), for: .touchUpInside)
        self.showMoreButton = showMoreButton
        view.addSubview(showMoreButton)
        //////////////////////////////////////////////////////
        backButton = UIButton()
        view.addSubview(backButton!)
        backButton?.translatesAutoresizingMaskIntoConstraints = false
        backButton?.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -leftPadding).isActive = true
        backButton?.widthAnchor.constraint(equalToConstant: 25).isActive = true
        backButton?.centerYAnchor.constraint(equalTo: showMoreButton.centerYAnchor).isActive = true
        backButton?.heightAnchor.constraint(equalToConstant: 25).isActive = true
        //Propeties
        backButton?.backgroundColor = UIColor.clear
        backButton?.setImage(UIImage(systemName: "house.fill"), for: .normal)
        backButton?.tintColor = UIColor.myButtonlColor
        backButton?.addTarget(self, action: #selector(goToHome), for: .touchUpInside)
        view.addSubview(backButton!)
        
    }
    
    @objc func goToGrid(){
        let goToGrid = GridViewController()
        goToGrid.modalPresentationStyle = .popover
        present(goToGrid, animated: true, completion: nil)
        
    }
    @objc func goToHome(){
        let nextVC = HomeViewController()
        nextVC.modalPresentationStyle = .fullScreen
        present(nextVC,animated: true, completion: nil)
    }
    
    func setConstrains(){
        
        guard let winesCollectionView = winesCollectionView, let showMoreButton = showMoreButton else { return }
        
        winesCollectionView.delegate = self
        winesCollectionView.dataSource = self
        view.addSubview(winesCollectionView)
        
        NSLayoutConstraint.activate([
            winesCollectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            winesCollectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            winesCollectionView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            winesCollectionView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.15),
        ])
        
        NSLayoutConstraint.activate([
            showMoreButton.topAnchor.constraint(equalTo: winesCollectionView.bottomAnchor, constant: 16),
            showMoreButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            showMoreButton.widthAnchor.constraint(equalToConstant: 100),
            showMoreButton.heightAnchor.constraint(equalToConstant: 20)
        ])
        
    }
        
}

//MARK: - TableView Extensions
extension WinesViewController : UITableViewDelegate, UITableViewDataSource {
    //
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wineData.dataSource?.category?[section].wines?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let wine = wineData.dataSource?.category?[indexPath.section].wines?[indexPath.row]
        let cell = WinesTableViewCell(wine: wine!)
        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return wineData.dataSource?.category?.count ?? 0
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return wineData.dataSource?.category?[section].name ?? ""
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("I'm in the category \(indexPath.section) and the row \(indexPath.row)")
        
        let wine = wineData.dataSource?.category?[indexPath.section].wines?[indexPath.row]
        
        let detailViewController = DetailViewController(wine: wine)
        detailViewController.modalPresentationStyle = .popover
        present(detailViewController, animated: true, completion: nil)
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        Constants.height/7
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = UIColor.myButtonlColor
        
        let image = UIImageView(frame: CGRect(x: 5, y: 2.5, width: 25, height: 35))
        image.image = UIImage(named: "wineBottle")
        view.addSubview(image)
        
        let label = UILabel(frame: CGRect(x: 0, y: 7.5, width: Constants.width - Constants.padding*2, height: 25))
        label.textColor = UIColor.ligtColor2
        label.text = wineData.dataSource?.category?[section].name ?? ""
        label.textAlignment = .center
        label.font = UIFont(name: "Georgia Bold", size: 25)
        view.addSubview(label)
        
        return view
    }
}
//MARK: - CollectionView Extensions

extension WinesViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    //Determina el numero de celdas dependiendo de la cantidad de imagenes
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return wineData.imageSourece?.wineCategory?[section].winesImages?.count ?? 0
    }
    //Asigna las imagenes a cada celda
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = winesCollectionView?.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! WineCollectionViewCell
        let winesImage = wineData.imageSourece?.wineCategory?[indexPath.section].winesImages?[indexPath.item]
        cell.setData(wineImage: winesImage!)
        return cell
    }
    //Determina la altura y anchoi de cada celda
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: Constants.width/5 - 10, height: Constants.height/6 - 30)
    }
    //Seleciona la cantidad de secciones
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
}
