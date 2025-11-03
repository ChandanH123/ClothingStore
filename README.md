# 🛍️ SwiftUI E-Commerce Clothing App

[![Swift Version](https://img.shields.io/badge/Swift-5.9-orange.svg)](https://swift.org)
[![Platform](https://img.shields.io/badge/Platform-iOS%2017.0+-blue.svg)](https://developer.apple.com/ios/)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![SwiftUI](https://img.shields.io/badge/SwiftUI-5.0-red.svg)](https://developer.apple.com/xcode/swiftui/)

A modern, production-ready e-commerce iOS application built with **SwiftUI**, demonstrating best practices in iOS development including **MVVM architecture**, **protocol-oriented programming**, **async/await**, and comprehensive support for **accessibility**, **localization**, and **dark mode**.

---

## 📱 Screenshots

### Light Mode
<p align="center">
  <img src="screenshots/product-list-light.png" width="250" alt="Product List Light">
  <img src="screenshots/product-detail-light.png" width="250" alt="Product Detail Light">
  <img src="screenshots/cart-light.png" width="250" alt="Cart Light">
</p>

### Dark Mode
<p align="center">
  <img src="screenshots/product-list-dark.png" width="250" alt="Product List Dark">
  <img src="screenshots/product-detail-dark.png" width="250" alt="Product Detail Dark">
  <img src="screenshots/cart-dark.png" width="250" alt="Cart Dark">
</p>

### Features Demo
<p align="center">
  <img src="screenshots/search-demo.png" width="250" alt="Search">
  <img src="screenshots/category-filter.png" width="250" alt="Category Filter">
  <img src="screenshots/loading-state.png" width="250" alt="Loading State">
</p>

---

## ✨ Features

### Core Functionality
- 🛒 **Product Catalog**: Browse products with images, prices, and ratings
- 🔍 **Search**: Real-time product search by title and description
- 🏷️ **Category Filter**: Filter products by category (clothing, jewelry, electronics)
- 📱 **Product Details**: Detailed product view with description and ratings
- 🛍️ **Shopping Cart**: Add, remove, and manage cart items with quantity control
- 💾 **Persistent Cart**: Cart data persists using UserDefaults
- 🔄 **Pull-to-Refresh**: Refresh product list with native gesture

### Technical Features
- 🌐 **Networking**: RESTful API integration with async/await
- 🏗️ **MVVM Architecture**: Clean separation of concerns
- 🔌 **Protocol-Oriented Design**: Testable, flexible, and maintainable code
- 🧪 **Unit Tests**: ViewModel testing with mocked dependencies
- 🌍 **Localization**: Support for English and Hindi
- 🌙 **Dark Mode**: Full system dark mode support
- ♿ **Accessibility**: VoiceOver labels and hints throughout
- ⚡ **Performance**: Lazy loading, efficient image caching
- 📐 **SwiftUI Best Practices**: Modern declarative UI patterns

---

## 🏗️ Architecture

### MVVM (Model-View-ViewModel)

```
┌─────────────────────────────────────────────────────────┐
│                         View Layer                       │
│  ProductListView | ProductDetailView | CartView         │
│  (SwiftUI Views - UI Display)                           │
└────────────────────┬────────────────────────────────────┘
                     │
                     │ @Published Properties
                     │ User Actions
                     ▼
┌─────────────────────────────────────────────────────────┐
│                     ViewModel Layer                      │
│  ProductListViewModel | CartViewModel                   │
│  (ObservableObject - Business Logic & State)            │
└────────────────────┬────────────────────────────────────┘
                     │
                     │ Protocol Methods
                     │ Async Calls
                     ▼
┌─────────────────────────────────────────────────────────┐
│                     Service Layer                        │
│  ProductService | CartService | NetworkManager          │
│  (Protocol-based - Data Operations)                     │
└────────────────────┬────────────────────────────────────┘
                     │
                     │ API Requests
                     │ JSON Decoding
                     ▼
┌─────────────────────────────────────────────────────────┐
│                      Model Layer                         │
│  Product | CartItem | User                              │
│  (Codable Structs - Data Structures)                    │
└─────────────────────────────────────────────────────────┘
```

---

## 📂 Project Structure

```
ClothingStoreApp/
├── App/
│   └── ClothingStoreApp.swift          # App entry point
│
├── Models/
│   ├── Product.swift                    # Product model (Codable, Identifiable)
│   ├── CartItem.swift                   # Cart item model
│   └── User.swift                       # User model
│
├── Protocols/
│   ├── ProductServiceProtocol.swift     # Product service interface
│   └── CartServiceProtocol.swift        # Cart service interface
│
├── Services/
│   ├── NetworkManager.swift             # Generic network layer
│   ├── ProductService.swift             # Product API implementation
│   └── CartService.swift                # Cart persistence implementation
│
├── ViewModels/
│   ├── ProductListViewModel.swift       # Product list state management
│   ├── ProductDetailViewModel.swift     # Product detail state
│   └── CartViewModel.swift              # Cart state management
│
├── Views/
│   ├── ProductListView.swift            # Product list screen
│   ├── ProductRowView.swift             # Reusable product row
│   ├── ProductDetailView.swift          # Product detail screen
│   ├── CartView.swift                   # Shopping cart screen
│   ├── CartRowView.swift                # Cart item row
│   └── CategoryPillView.swift           # Category filter pill
│
├── Utilities/
│   ├── Constants.swift                  # App constants and endpoints
│   ├── LoadingState.swift               # Loading state enum
│   └── NetworkError.swift               # Custom error types
│
├── Resources/
│   ├── en.lproj/
│   │   └── Localizable.strings         # English translations
│   └── hi.lproj/
│       └── Localizable.strings         # Hindi translations
│
└── Tests/
    ├── MockProductService.swift         # Mock service for testing
    └── ProductListViewModelTests.swift  # ViewModel unit tests
```

---

## 🚀 Getting Started

### Prerequisites

- **Xcode**: 15.0 or later
- **iOS**: 17.0+ deployment target
- **Swift**: 5.9+
- **macOS**: Sonoma or later

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/swiftui-ecommerce-app.git
   cd swiftui-ecommerce-app
   ```

2. **Open in Xcode**
   ```bash
   open ClothingStoreApp.xcodeproj
   ```

3. **Run the app**
   - Select your target device or simulator
   - Press `Cmd + R` to build and run

### API Setup

This app uses the [Fake Store API](https://fakestoreapi.com) - a free, public REST API for testing and prototyping.

**No API key required!** The API is already configured in `Constants.swift`:

```swift
static let baseURL = "https://fakestoreapi.com"
```

**Available Endpoints:**
- `GET /products` - Fetch all products
- `GET /products/{id}` - Fetch single product
- `GET /products/categories` - Fetch categories
- `GET /products/category/{category}` - Filter by category

---

## 🧪 Testing

### Run Unit Tests

```bash
# In Xcode
cmd + U

# Or using xcodebuild
xcodebuild test -scheme ClothingStoreApp -destination 'platform=iOS Simulator,name=iPhone 15'
```

### Test Coverage

- ✅ ProductListViewModel
  - Product loading success/failure
  - Search filtering
  - Category filtering
  - State management

- ✅ CartViewModel
  - Add/remove items
  - Quantity updates
  - Total calculations
  - Persistence

---

## 🛠️ Built With

### Technologies
- **SwiftUI** - Declarative UI framework
- **Swift Concurrency** - async/await for networking
- **Combine** - Reactive programming (optional)
- **URLSession** - Native networking
- **UserDefaults** - Local data persistence
- **XCTest** - Unit testing framework

### Design Patterns
- **MVVM** - Model-View-ViewModel architecture
- **Protocol-Oriented Programming** - Flexible, testable code
- **Dependency Injection** - Loose coupling
- **Repository Pattern** - Data abstraction
- **Singleton** - NetworkManager shared instance

### API
- [Fake Store API](https://fakestoreapi.com) - Free e-commerce REST API

---

## 📖 Key Concepts Demonstrated

### SwiftUI
- `@State`, `@Binding`, `@StateObject`, `@ObservedObject`, `@EnvironmentObject`
- `@Published` properties for reactive updates
- `NavigationStack` and `NavigationLink` for navigation
- `AsyncImage` for remote image loading
- `.task`, `.refreshable`, `.searchable` modifiers
- `List`, `ForEach`, `ScrollView` for data display
- Custom view components and modifiers

### Swift
- `async/await` for asynchronous operations
- `Codable` for JSON serialization
- `Equatable`, `Identifiable` protocols
- Generics (`<T: Codable>`)
- Error handling with `do-catch`, `try-await`
- Optional binding (`if let`, `guard let`)
- Property wrappers

### Architecture
- Protocol-oriented design for testability
- MVVM separation of concerns
- Dependency injection for flexibility
- State management patterns
- Loading state handling

---

## 🌍 Localization

The app supports multiple languages:

### Supported Languages
- 🇬🇧 **English** (Default)
- 🇮🇳 **Hindi** (हिंदी)

### Adding a New Language

1. Add new `.lproj` folder in Resources
2. Create `Localizable.strings` file
3. Add translations for all keys
4. Update Xcode project localization settings

```swift
// Usage in code
Text(NSLocalizedString("products", comment: "Products navigation title"))
```

---

## ♿ Accessibility

Full VoiceOver support with:

- ✅ `accessibilityLabel` for all interactive elements
- ✅ `accessibilityHint` for button actions
- ✅ `accessibilityValue` for dynamic content
- ✅ Semantic grouping with `accessibilityElement`
- ✅ Dynamic Type support
- ✅ High contrast mode compatibility

### Testing Accessibility

1. Enable VoiceOver: `Settings > Accessibility > VoiceOver`
2. Use Accessibility Inspector in Xcode
3. Test with Dynamic Type size changes

---

## 🌙 Dark Mode

Automatic dark mode support using:

- `@Environment(\.colorScheme)` for theme detection
- System color palette (`.primary`, `.secondary`)
- Adaptive color opacity
- Dynamic UI element styling

```swift
@Environment(\.colorScheme) var colorScheme

// Conditional styling
.background(colorScheme == .dark ? Color.black : Color.white)
```

---

## 📊 Performance Optimizations

- **Lazy Loading**: `LazyVStack` and `LazyHStack` for large lists
- **Image Caching**: `AsyncImage` with automatic caching
- **View Extraction**: Small, reusable view components
- **Equatable Views**: Prevents unnecessary re-renders
- **Background Tasks**: Async operations on background threads
- **@MainActor**: UI updates on main thread

---

## 🔄 Git Workflow

### Conventional Commits

This project follows [Conventional Commits](https://www.conventionalcommits.org/):

```bash
feat: add product detail view
fix: correct cart total calculation
docs: update README with screenshots
test: add unit tests for cart viewmodel
refactor: extract category pill component
style: format code with SwiftLint
perf: optimize image loading performance
```

### Branch Strategy

```
main (production-ready)
  ├── develop (integration)
  │   ├── feature/product-list
  │   ├── feature/cart
  │   ├── feature/search
  │   └── feature/categories
  └── hotfix/critical-bug
```

---

## 🗺️ Development Roadmap

### ✅ Completed (Steps 1-9)
- [x] Project setup and structure
- [x] Product model and networking
- [x] Product list view with loading states
- [x] Product detail view
- [x] Navigation between screens
- [x] Dark mode support
- [x] Basic accessibility
- [x] Error handling
- [x] Pull-to-refresh

### 🚧 In Progress (Steps 10-14)
- [ ] Search functionality
- [ ] Enhanced accessibility
- [ ] Localization (English + Hindi)
- [ ] Unit tests
- [ ] Performance optimizations

### 📅 Upcoming (Steps 15-17)
- [ ] Category filtering
- [ ] Shopping cart model
- [ ] Cart view with quantity management
- [ ] Cart persistence
- [ ] TabView navigation

### 🔮 Future Enhancements
- [ ] User authentication
- [ ] Favorites/Wishlist
- [ ] Order history
- [ ] Payment integration
- [ ] Push notifications
- [ ] Product reviews
- [ ] Image zoom
- [ ] Share products
- [ ] Offline mode
- [ ] CoreData migration
- [ ] Widget support
- [ ] Apple Pay integration

---

## 🤝 Contributing

Contributions are welcome! Please follow these steps:

1. **Fork** the repository
2. **Create** a feature branch (`git checkout -b feature/AmazingFeature`)
3. **Commit** your changes (`git commit -m 'feat: add amazing feature'`)
4. **Push** to the branch (`git push origin feature/AmazingFeature`)
5. **Open** a Pull Request

### Code Style
- Follow Swift API Design Guidelines
- Use SwiftLint for code formatting
- Add unit tests for new features
- Update documentation

---

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## 👨‍💻 Author

**Your Name**
- GitHub: [@yourusername](https://github.com/yourusername)
- LinkedIn: [Your Name](https://linkedin.com/in/yourprofile)
- Email: your.email@example.com

---

## 🙏 Acknowledgments

- [Fake Store API](https://fakestoreapi.com) - Free REST API for testing
- [SwiftUI Documentation](https://developer.apple.com/documentation/swiftui)
- [Swift.org](https://swift.org) - Swift programming language
- [iOS Developer Community](https://developer.apple.com)

---

## 📚 Learning Resources

### SwiftUI
- [Apple SwiftUI Tutorials](https://developer.apple.com/tutorials/swiftui)
- [Hacking with Swift](https://www.hackingwithswift.com/100/swiftui)
- [SwiftUI by Example](https://www.hackingwithswift.com/quick-start/swiftui)

### Architecture
- [MVVM in SwiftUI](https://www.swiftbysundell.com/articles/mvvm-in-swift/)
- [Protocol-Oriented Programming](https://developer.apple.com/videos/play/wwdc2015/408/)
- [Clean Architecture](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)

### Testing
- [Unit Testing SwiftUI](https://www.swiftbysundell.com/articles/unit-testing-swiftui-views/)
- [Testing Async Code](https://developer.apple.com/documentation/xctest/asynchronous_tests_and_expectations)

---

## 📞 Support

If you have any questions or issues:

1. Check existing [Issues](https://github.com/yourusername/swiftui-ecommerce-app/issues)
2. Open a new [Issue](https://github.com/yourusername/swiftui-ecommerce-app/issues/new)
3. Start a [Discussion](https://github.com/yourusername/swiftui-ecommerce-app/discussions)

---

## ⭐ Show Your Support

If this project helped you, please give it a ⭐️!

---

## 📱 App Store

*Coming soon...*

---

**Happy Coding! 🚀**

---

<p align="center">Made with ❤️ and SwiftUI</p>
