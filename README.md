# 🛍️ ClothingStore — SwiftUI MVVM App

## 📸 Preview
<table>
  <tr>
    <td align="center"><b>Products List Loading</b></td>
    <td align="center"><b>Products List Error</b></td>
    <td align="center"><b>Product Image Loading</b></td>
    <td align="center"><b>Products List Loaded</b></td>
    <td align="center"><b>Product Detail Loaded</b></td>
  </tr>
  <tr>
    <td><img src="https://github.com/user-attachments/assets/84ed84d0-9de3-4553-a0ba-1e7c56cb62f0" width="200"/></td>
    <td><img src="https://github.com/user-attachments/assets/59629ae6-fb53-4c3b-8790-f650f93307d0" width="200"/></td>
    <td><img src="https://github.com/user-attachments/assets/68741bd8-ce5e-44f3-b713-40e4d88a2995" width="200"/></td>
    <td><img src="https://github.com/user-attachments/assets/1647ce34-b3f1-42df-a0c2-f7976a87006d" width="200"/></td>
    <td><img src="https://github.com/user-attachments/assets/4ada9fe8-934e-4232-acfb-5c6d28bcc1b9" width="200"/></td>
  </tr>
</table>



## 🚀 Features

- SwiftUI + MVVM architecture
- Async/await networking
- Protocol-based API layer (fully testable)
- Loading, success, error UI states
- Product listing with image, title, price and category  
- Product detail screen with description and ratings 
- Highly readable and maintainable code
- Localization support (`en`, `hi`)
- Works on iOS 16+

## 📂 Project Structure
```
ClothingStoreApp/
├── App/
│   └── `ClothingStoreApp.swift`
├── Models/
│   └── `Product.swift`
├── Protocols/
│   └── `ProductServiceProtocol.swift`
├── Services/
│   ├── `NetworkManager.swift`
│   └── `ProductService.swift`
├── ViewModels/
│   ├── `ProductListViewModel.swift`
│   └── `ProductDetailViewModel.swift`
├── Views/
│   ├── `ProductListView.swift`
│   ├── `ProductRowView.swift`
│   └── `ProductDetailView.swift`
├── Utilities/
│   ├── `Constants.swift`
│   ├── `LoadingState.swift`
│   └── `NetworkError.swift`
├── Resources/
│   ├── `en.lproj/Localizable.strings`
│   └── `hi.lproj/Localizable.strings`
└── Tests/
    ├── `MockProductService.swift`
    └── `ProductListViewModelTests.swift`
```

## 🏗️ Architecture Overview
- MVVM: `Views` bind to `ViewModels` (`ObservableObject` + `@Published`) which call `Services`.  
- Protocol-driven services (`ProductServiceProtocol`) enable dependency injection and easy mocking.  
- `NetworkManager` centralizes HTTP requests and JSON decoding.  
- `App/ClothingStoreApp.swift` boots the app and currently shows `ProductListView` as the root view.

## 🌐 API Used
- Example backends: `https://dummyjson.com` for placeholder product data.  
- Configure `BASE_URL` in `Utilities/Constants.swift`. Swap real vs mock by injecting a different `ProductServiceProtocol` implementation.

## ▶️ How to Run
1. Open `ClothingStoreApp.xcodeproj` in Xcode (recommended Xcode 15+).  
2. Select an iOS simulator or device (iOS 17+ recommended).  
3. Build and run (Cmd+R).  
4. To use mocks, instantiate view models with `MockProductService` in preview or SceneDelegate/App bootstrapping.

## 🧪 Unit Testing
You can test:
- `ViewModels` for loading and error handling.  
- `ProductService` using network stubs or `MockProductService`.

Example test strategy:
- Inject `MockProductService` into `ProductListViewModel`.  
- Arrange: mock returns a fixed set of products.  
- Act: call `viewModel.fetchProducts()`.  
- Assert: `viewModel.products.count == expected` and `viewModel.loadingState == .loaded`.

Run tests: Product → Test (Cmd+U).

## 🧱 Dependencies
- No external dependencies required by default. Optional SPM packages:
  - Image caching (e.g., `Kingfisher`)  
  - Networking helpers (optional)

## 💡 Future Enhancements
- Add product search
- Add sorting & filtering
- Add cart functionality
- Add offline caching and improved image caching  
- Add pull-to-refresh
- Add pagination and infinite scroll  
- Add favorites and user profiles  
- Add authentication and remote sync  
- UI polish and animations

## 📜 License
Specify a license (e.g., MIT). Add a `LICENSE` file at the repository root.

## ❤️ Contributing
- Create a branch per feature/fix: `feature/<name>` or `fix/<name>`  
- Open a PR with description and screenshots for UI changes  
- Add unit tests for business logic changes

## 🙌 Acknowledgements
- Placeholder data from public demo APIs (e.g., Dummy JSON API)  
- Inspiration from common SwiftUI + MVVM patterns
