# Firebase Setup Instructions

## Настройка Firebase для проекта

### 1. Создание Firebase проекта
1. Перейдите в [Firebase Console](https://console.firebase.google.com/)
2. Создайте новый проект или выберите существующий
3. Включите Authentication и Firestore Database

### 2. Настройка платформ

#### Web платформа
1. В Firebase Console добавьте Web приложение
2. Скопируйте конфигурацию Firebase
3. Замените значения в `lib/firebase_options.dart` для `web` секции

#### iOS платформа
1. В Firebase Console добавьте iOS приложение
2. Укажите Bundle ID: `com.loskutnikoff.shoppingList`
3. Скачайте `GoogleService-Info.plist`
4. Скопируйте `ios/Runner/GoogleService-Info.plist.example` в `ios/Runner/GoogleService-Info.plist`
5. Скопируйте `ios/GoogleService-Info.plist.example` в `ios/GoogleService-Info.plist`
6. Замените все `YOUR_*` значения на реальные из скачанного файла
7. Замените значения в `lib/firebase_options.dart` для `ios` секции

#### Android платформа
1. В Firebase Console добавьте Android приложение
2. Укажите Package name: `com.loskutnikoff.shoppingList`
3. Скачайте `google-services.json`
4. Скопируйте `android/app/google-services.json.example` в `android/app/google-services.json`
5. Замените все `YOUR_*` значения на реальные из скачанного файла
6. Замените значения в `lib/firebase_options.dart` для `android` секции

### 3. Настройка Google Sign-In

#### Web
1. В Google Cloud Console создайте OAuth 2.0 Client ID для Web
2. Добавьте Authorized JavaScript origins:
   - `http://localhost`
   - `http://localhost:5000`
   - `http://localhost:8080`
   - `https://YOUR_PROJECT_ID.firebaseapp.com`
3. Добавьте Authorized redirect URIs:
   - `https://YOUR_PROJECT_ID.firebaseapp.com/__/auth/handler`
   - `http://localhost:5000`
   - `http://localhost:8080`

#### iOS
1. В Google Cloud Console создайте OAuth 2.0 Client ID для iOS
2. Укажите Bundle ID: `com.loskutnikoff.shoppingList`
3. Скачайте конфигурацию и обновите `ios/Runner/Info.plist`

#### Android
1. В Google Cloud Console создайте OAuth 2.0 Client ID для Android
2. Укажите Package name: `com.loskutnikoff.shoppingList`
3. Добавьте SHA-1 fingerprint

### 4. Файлы конфигурации

**ВАЖНО**: Все файлы конфигурации Firebase содержат секретные ключи и НЕ должны быть в публичном репозитории!

1. Скопируйте `lib/firebase_options.dart.example` в `lib/firebase_options.dart`
2. Скопируйте `android/app/google-services.json.example` в `android/app/google-services.json`
3. Скопируйте `ios/Runner/GoogleService-Info.plist.example` в `ios/Runner/GoogleService-Info.plist`
4. Скопируйте `ios/GoogleService-Info.plist.example` в `ios/GoogleService-Info.plist`
5. Замените все `YOUR_*` значения на реальные из Firebase Console
6. Убедитесь, что все файлы конфигурации добавлены в `.gitignore`

### 6. Проверка настройки

После настройки всех платформ:
1. Запустите `flutter clean`
2. Запустите `flutter pub get`
3. Протестируйте на всех платформах:
   - Web: `flutter run -d chrome`
   - iOS: `flutter run -d "iPhone 16e"`
   - Android: `flutter run -d android`
