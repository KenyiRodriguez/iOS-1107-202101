//
//  ListMovieViewController.swift
//  ConsumoServicio
//
//  Created by Kenyi Rodriguez on 24/06/21.
//

import UIKit

class ListMovieViewController: UIViewController {
    
    @IBOutlet weak var clvMovies: UICollectionView!
    
    var arrayMovies         = [MovieBE]()
    var arrayMoviesToShow   = [MovieBE]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        MovieWS().getAllMoviesAF { arrayMovies in
            
            self.arrayMoviesToShow  = arrayMovies
            self.arrayMovies        = arrayMovies
            self.clvMovies.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let controller = segue.destination as? DetailMovieViewController, let objMovie = sender as? MovieBE {
            controller.objMovie = objMovie
        }
    }
}

extension ListMovieViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchText == "" {
            self.arrayMoviesToShow = self.arrayMovies
            
        } else {
            
            let arrayFilter = self.arrayMovies.filter({
                
                let title = $0.title.lowercased()
                let text = searchText.lowercased()
                return title.contains(text)
            })
            
            self.arrayMoviesToShow = arrayFilter
        }
        
        self.clvMovies.reloadData()
    }
}

extension ListMovieViewController: UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.arrayMoviesToShow.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCollectionViewCell", for: indexPath) as? MovieCollectionViewCell
        cell?.objMovie = self.arrayMoviesToShow[indexPath.row]
        
        return cell ?? UICollectionViewCell()
    }
}

extension ListMovieViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let objMovie = self.arrayMoviesToShow[indexPath.row]
        self.performSegue(withIdentifier: "DetailMovieViewController", sender: objMovie)
    }
}

extension ListMovieViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let numberOfColumns: CGFloat = 2
        let paddingLeft: CGFloat = 11
        let paddingRight: CGFloat = 11
        let spaceCell: CGFloat = 10
        let totalSpaceCell = spaceCell * (numberOfColumns - 1)
        let availableWidth = collectionView.frame.width - totalSpaceCell - paddingLeft - paddingRight
        let cellWidth = availableWidth / numberOfColumns
        let cellHeight = cellWidth * 1.6
        
        let newSize = CGSize(width: cellWidth, height: cellHeight)
        return newSize
    }
}
