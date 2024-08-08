import UIKit

protocol DetailsViewModelProtocol: AnyObject {
  func getPhoto()
}

// MARK: - Class

final class DetailsViewModel {
  
  weak var viewController: DetailsViewDisplay?
  private let service: DetailsServicing
  private var cat: Cats
  private var imageUrl: String?
  private let scheduler: Scheduler
  
  init(service: DetailsServicing, scheduler: Scheduler = DispatchQueue.main, cat: Cats) {
    self.service = service
    self.scheduler = scheduler
    self.cat = cat
  }
}

// MARK: - DetailsViewModelProtocol

extension DetailsViewModel: DetailsViewModelProtocol {
  func getPhoto() {
    viewController?.load()
    service.getPhoto(breed: cat.id) { [weak self] (response: Result<[CatImage], NetworkResponse>) in
      guard let self = self else { return }
      self.scheduler.schedule {
        switch response {
        case .success(let image):
            if let item = image.first {
              self.imageUrl = item.url
            }
            
            self.buildData(imageUrl: self.imageUrl)
            self.viewController?.stop()
        case .failure:
          self.viewController?.stop()
        }
      }
    }
  }
}

// MARK: - Private methods

private extension DetailsViewModel {
  func buildData(imageUrl: String?) {
    let model = DetailModel(
      imageUrl: imageUrl,
      titleBreed: "Breed",
      infoBreed: cat.name,
      titleDescription: "Description",
      infoDescription: cat.description,
      titleTemperament: "Temperament",
      infoTemperament: cat.temperament
    )
    viewController?.displayInformations(model: model)
  }
}

