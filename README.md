# Assignment: Basic UI (Part 2)

This is a simple Flutter application developed as a college assignment to demonstrate the use of basic layout widgets, scrollable lists/grids, cards, lists tiles, user interactions, and simple themes in Flutter.

## 📝 Assignment Requirements & Implementation

Here is how each requirement of the assignment has been met in the code:

*   **ListView & ListTile**: Implemented in `_buildListView()`. It displays the product catalog in a vertical scrollable list, where each product is represented by a `Card` containing a `ListTile` with product icons, names, descriptions, and prices.
*   **GridView**: Implemented in `_buildGridView()`. It displays the products in a 2-column grid layout, showing product cards with icons, names, short descriptions, and prices.
*   **Card**: Used in both list and grid view items to group item details visually with shadows (`elevation: 2.0`) and rounded borders.
*   **Item Tap Handling (InkWell / GestureDetector)**: 
    *   In the **ListView**, we used the built-in `onTap` property of the `ListTile`.
    *   In the **GridView**, we wrapped the `Card`'s child in an `InkWell` widget to detect taps while showing a neat Material ripple animation.
    *   *Interaction:* Tapping any item displays a `SnackBar` with the format: `Selected Item: [Item Name]`.
*   **Button Click Functionality**:
    *   **Special Offer Button**: Clicking this increments a click counter in the state, updates the text on the screen, and triggers a `SnackBar`.
    *   **Show List / Show Grid Button**: Toggles the display mode between list and grid dynamically, updating the layout on the fly.
*   **Spacing, Alignment, and Theme**: We utilized `Padding` widgets for spacing around the screen and cards, `SizedBox` for margins between widgets, and defined a basic material theme in `MaterialApp` using `ColorScheme.fromSeed` with blue accents.
*   **Smooth Scrolling**: Both `ListView.builder` and `GridView.builder` are placed inside an `Expanded` widget within a `Column`. This ensures they calculate their heights dynamically relative to the remaining screen space, preventing the classic `"Vertical viewport was given unbounded height"` layout crash.

---

## 🚀 How to Run the App

1.  **Prerequisites**: Make sure Flutter is installed and set up on your machine. You can verify this by running:
    ```bash
    flutter doctor
    ```

2.  **Navigate to Project Directory**:
    ```bash
    cd C:\Users\arpit\Desktop\Assignments
    ```

3.  **Run the App**: Connect your emulator or physical device and execute:
    ```bash
    flutter run
    ```

---

## 📂 Code Structure Overview

All the code is contained within the [lib/main.dart](file:///C:/Users/arpit/Desktop/Assignments/lib/main.dart) file, keeping it simple and beginner-friendly:

*   `Product`: A basic Dart class acting as our data model to hold `name`, `description`, `price`, and `icon`.
*   `MyApp`: A `StatelessWidget` that sets up the `MaterialApp` and app-wide theme.
*   `ProductCatalogScreen`: A `StatefulWidget` containing the state (whether grid view is active, count of button presses, and the hardcoded list of products).
*   `_buildListView()` & `_build_GridView()`: Separate clean builder methods to build the scrollable lists.

---

## 📸 Output Screenshots

Below are placeholders for the screenshots. Once you take the screenshots, save them in the `assets/` folder with the filenames `list_view_screenshot.png` and `grid_view_screenshot.png`. They will automatically display below with nice borders and alignment.

<div align="center" style="display: flex; justify-content: center; gap: 20px; flex-wrap: wrap; margin-top: 20px;">
  
  <!-- List View Screenshot Card -->
  <div style="border: 2px solid #e0e0e0; border-radius: 12px; padding: 10px; box-shadow: 0 4px 6px rgba(0,0,0,0.1); background-color: #ffffff; max-width: 320px;">
    <h3 style="color: #2196F3; margin-top: 0;">1. List View Mode</h3>
    <img src="assets/list_view_screenshot.png" alt="List View Screenshot" width="300" style="border-radius: 8px; display: block;" onerror="this.src='https://placehold.co/300x600?text=Place+List+View+Screenshot+Here'"/>
    <p style="font-size: 13px; color: #757575; margin-top: 10px; line-height: 1.4;">
      Shows products in a list using <code>ListView.builder</code>, <code>Card</code>, and <code>ListTile</code>.
    </p>
  </div>

  <!-- Grid View Screenshot Card -->
  <div style="border: 2px solid #e0e0e0; border-radius: 12px; padding: 10px; box-shadow: 0 4px 6px rgba(0,0,0,0.1); background-color: #ffffff; max-width: 320px;">
    <h3 style="color: #2196F3; margin-top: 0;">2. Grid View Mode</h3>
    <img src="assets/grid_view_screenshot.png" alt="Grid View Screenshot" width="300" style="border-radius: 8px; display: block;" onerror="this.src='https://placehold.co/300x600?text=Place+Grid+View+Screenshot+Here'"/>
    <p style="font-size: 13px; color: #757575; margin-top: 10px; line-height: 1.4;">
      Shows products in a grid using <code>GridView.builder</code> and <code>InkWell</code> for click ripple effect.
    </p>
  </div>

</div>
