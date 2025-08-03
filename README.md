# Grocery Mart

Grocery Mart is a simple Flutter-based e-commerce application designed to demonstrate local data handling using `Provider` for state management and `SharedPreferences` for cart persistence.

## Features

- Browse grocery items by category and subcategory
- Add/remove items to/from cart
- Increment/decrement item quantity in cart
- Cart data persists using `SharedPreferences`
- Mark items as favorites
- View item detail pages
- Splash screen included

## Getting Started

Follow the steps below to set up and run the project on your local machine.

### Prerequisites

- Flutter SDK (Latest stable version recommended)
- Android Studio or VS Code
- A real device or emulator
- Android SDK (API 34 or below to avoid known JDK transform issues)

### Installation

1. **Clone the Repository**

   ```bash
   git clone https://github.com/Mubasshir007/Grocery-Mart.git
   cd grocery-mart
Install Dependencies

bash
Copy
Edit
flutter pub get
Run the App

bash
Copy
Edit
flutter run
For real devices, ensure USB debugging is enabled.

Folder Structure
bash
Copy
Edit
lib/
├── main.dart
├── data/                # Sample Data : 10-15 products across 3-4 categories (detail.dart)
├── providers/           # Provider classes for state management (cartitem, Cartmodel)
├── screens/             # UI pages (Shop, Explore, Cart, Favorite, Account)
├── widgets/             # Reusable UI components (addtocart, addtofav, productdetail, productview)
└── customs/             # UIHelper classes (appcolor, uihelper)
Notes
The cart and favorites are stored locally using SharedPreferences and are retained between app restarts.

No backend is connected; data is static and hardcoded.