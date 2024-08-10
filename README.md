# SnapShop
A user-friendly platform designed to simplify online shopping. It enables users to browse a variety of products, add items to their cart, and manage selections with ease, offering a smooth shopping experience from start to finish.<br>
🎬 Watch video at: [Youtube](https://youtu.be/jvaBx38yvQA)
<br>
## Tech Stack
<table>
  <tr>
    <td align='center'>
      <a href="https://www.dartlang.org/"> <img width='36' height='36' src='https://img.stackshare.io/service/1646/Twitter-02.png' alt='Dart'> </a>
      <br>
      <sub><a href="https://www.dartlang.org/">Dart</a></sub>
      <br>
      <sub></sub>
    </td>
    <td align='center'>
      <a href="https://flutter.io/"> <img width='36' height='36' src='https://img.stackshare.io/service/7180/flutter-mark-square-100.png' alt='Flutter'> </a>
      <br>
      <sub><a href="https://flutter.io/">Flutter</a></sub>
      <br>
      <sub></sub>
    </td>
    <td align='center'>
      <a href="https://firebase.google.com/"><img width='36' height='36' src='https://img.stackshare.io/service/116/cZLxNFZS.jpg' alt='Firebase'> </a>
      <br>
      <sub><a href="https://firebase.google.com/">Firebase</a></sub>
      <br>
      <sub></sub>
    </td>
  </tr>
</table>

## Problem Statement
Develop an e-commerce application that enables users to browse and discover products effortlessly. The app should feature a user-friendly interface for searching, filtering, and organizing products into categories. The app aims to enhance the product discovery process, making it intuitive and enjoyable for users to explore various options and manage their selections.

## Development
1. Download the [Flutter Development Kit](https://docs.flutter.dev/get-started/install).
2. For instructions on how to install watch:
   1. [Windows Setup](https://www.youtube.com/watch?v=qAeEdaiK7hM)
   2. [Mac Setup](https://www.youtube.com/watch?v=d_yOKQt7BdY)
   3. [Ubuntu Setup](https://www.youtube.com/watch?v=d_yOKQt7BdY)
3. Navigate to the folder you want to create the flutter project.
4. Using terminal, create new project:
   ```sh
   flutter create <project-name>
   ```
5. Replace the existing `lib` folder in the newly created flutter project with the [lib](https://github.com/ar3s-nd/SnapShop/tree/main/lib) folder of this repo.
6. Replace the `pubspec.yaml` with the [pubspec.yaml](https://github.com/ar3s-nd/SnapShop/blob/main/pubspec.yaml) of this repo or add the dependencies and assets list in the file.
7. To verify configurations, run:
   ```sh
   flutter doctor -v
   ```
8. Setup [firebase](https://firebase.google.com/docs), [firebase auth](https://firebase.google.com/docs/auth) and [cloud firestore](https://firebase.google.com/docs/firestore).
9. For debugging, run the following on the command-line:
   ```sh
   flutter clean
   flutter pub get
   flutter run
   ```

10. For any queries, see [flutter docs](https://docs.flutter.dev/)
11. For deployment, see [deploy flutter](https://docs.flutter.dev/deployment)

## App Installation
1. Download the apk file [SnapShop](https://github.com/ar3s-nd/SnapShop/blob/main/snapshop.apk) on your android device.
2. Install the apk from the downloads folder.
3. Give permission for system to download `files from unknown sources`.
4. Wait for app to install.

## Features
1. `Login`, `Register` and `Logout`.
2. `Sign up` with email/password or using `Google services`.
3. `Forgot Password` button to reset password.
4. Products divided into categories.
5. Detailed descriptions of products along with scrollable images.
6. `Save Products` feature to save items which are out of stock or which you wish to buy later.
5. `Cart` feature which provides basic cart functionality - add/remove items.
6. Cart and saved items are updated real-time in database.
7. `Profile` -  Displays username, email and location(Stored in database).
8. `Edit profile` - Can edit username and location(real-time updates in database).
9. `Delete Account` button - Delete authentication as well as database data of the user.

## Dependencies
<table>
  <tr>
    <td>
      <a href="https://pub.dev/packages/cupertino_icons">Cupertino Icons</a>
    </td>
    <td>Asset repo containing the default set of icon assets used by Flutter's <a href = 'https://github.com/flutter/flutter/tree/master/packages/flutter/lib/src/cupertino'>Cupertino widgets</a>.</td>
  </tr>
  
  <tr>
    <td>
      <a href="https://pub.dev/packages/firebase_core">Firebase Core</a>
    </td>
    <td>A Flutter plugin to use the Firebase Core API, which enables connecting to multiple Firebase apps.</td>
  </tr>
  
  <tr>
    <td>
      <a href="https://pub.dev/packages/firebase_auth">Firebase Authentication</a>
    </td>
    <td>A Flutter plugin to use the <a href = "https://firebase.google.com/products/auth">Firebase Authentication API</a>.</td>
  </tr>
  
  <tr>
    <td>
      <a href="https://pub.dev/packages/google_sign_in">Google Sign In</a>
    </td>
    <td>A Flutter plugin to sign in with Google account.</td>
  </tr>
  
  <tr>
    <td>
      <a href="https://pub.dev/packages/flutter_svg">SVG for Flutter</a>
    </td>
    <td>A Flutter plugin to use SVG files in Flutter application.</td>
  </tr>
  
  <tr>
    <td>
      <a href="https://pub.dev/packages/flutter_slidable">Flutter Slidable</a>
    </td>
    <td>A Flutter implementation of slidable list item with directional slide actions that can be dismissed.</td>
  </tr>
  
  <tr>
    <td>
      <a href="https://pub.dev/packages/cloud_firestore">Cloud Firestore</a>
    </td>
    <td>A Flutter plugin to use the <a href = 'https://firebase.google.com/docs/firestore/'>Cloud Firestore API</a> to manage realtime database.</td>
  </tr>
  
  <tr>
    <td>
      <a href="https://pub.dev/packages/random_string">Random String</a>
    </td>
    <td>Simple library for generating random ascii strings.</td>
  </tr>
</table>

## Scope for future improvements
1. Addition of two types of users- customers and sellers. Customers are able to view and buy the products while the sellers are able to add new product directly through the app. Sellers would have to verify themselves before they can identify as a seller.
2. Search function for customers to search for products.
3. Recommend new products to customers using machine learning models based on their search history and previously bought products.
5. Automatically find customer's location without the customer having to set their location using plugins like [geolocator](https://pub.dev/packages/geolocator) and [geocoding](https://pub.dev/packages/geocoding).
6. Greater flexibility for users in updating their profile details.
7. Add payment interface.
8. Better UI using tools like figma.

## Contributors
[Navaneeth D](https://github.com/ar3s-nd/)
