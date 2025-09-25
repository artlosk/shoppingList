# 🛒 Shopping List App

Современное кроссплатформенное приложение для управления списком покупок, построенное на Flutter с использованием Firebase для аутентификации и хранения данных.

## ✨ Особенности

- 🔐 **Google Sign-In** - Безопасная аутентификация через Google
- 📱 **Кроссплатформенность** - Работает на Web, iOS и Android
- ☁️ **Firebase Backend** - Надежное хранение данных в облаке
- 📝 **Управление списками** - Добавление, редактирование и удаление товаров
- 🔄 **Синхронизация** - Данные синхронизируются между устройствами
- 🏷️ **Фильтрация и сортировка** - Удобная организация товаров

## 🚀 Быстрый старт

### Предварительные требования

- Flutter SDK (версия 3.0 или выше)
- Dart SDK
- Firebase проект
- Google Cloud Console проект
- Xcode (для iOS разработки)
- Android Studio (для Android разработки)

### Установка

1. **Клонируйте репозиторий:**
   ```bash
   git clone https://github.com/artlosk/shoppingList.git
   cd shoppingList
   ```

2. **Установите зависимости:**
   ```bash
   flutter pub get
   ```

3. **Настройте Firebase:**
   - Следуйте инструкциям в [FIREBASE_SETUP.md](FIREBASE_SETUP.md)
   - Скопируйте `lib/firebase_options.dart.example` в `lib/firebase_options.dart`
   - Заполните реальными значениями из Firebase Console

4. **Настройте конфигурационные файлы:**
   ```bash
   # Firebase конфигурация
   cp lib/firebase_options.dart.example lib/firebase_options.dart
   
   # Android
   cp android/app/google-services.json.example android/app/google-services.json
   
   # iOS
   cp ios/Runner/GoogleService-Info.plist.example ios/Runner/GoogleService-Info.plist
   cp ios/GoogleService-Info.plist.example ios/GoogleService-Info.plist
   cp ios/Runner/Info.plist.example ios/Runner/Info.plist
   
   # macOS
   cp macos/GoogleService-Info.plist.example macos/GoogleService-Info.plist
   cp macos/Runner/Info.plist.example macos/Runner/Info.plist
   ```

5. **Запустите приложение:**
   ```bash
   # Web
   flutter run -d chrome
   
   # iOS
   flutter run -d "iPhone 16e"
   
   # macOS
   flutter run -d macos
   
   # Android
   flutter run -d android
   ```

## 🏗️ Архитектура

### Технологический стек

- **Frontend:** Flutter/Dart
- **Backend:** Firebase (Firestore, Authentication)
- **State Management:** MobX
- **Authentication:** Google Sign-In
- **Storage:** Firebase Firestore

### Структура проекта

```
lib/
├── main.dart                 # Точка входа приложения
├── firebase_options.dart     # ❌ Конфигурация Firebase (НЕ коммитится)
├── firebase_options.dart.example  # ✅ Пример конфигурации
├── models/                   # Модели данных
│   ├── user_model.dart
│   └── shopping_list_model.dart
├── observables/              # MobX состояния
│   ├── auth_observable.dart
│   └── firestore_observable.dart
├── views/                    # UI экраны
│   ├── init_screen.dart
│   ├── login_view.dart
│   ├── wrapper_view.dart
│   ├── shopping_list_view.dart
│   └── shopping_item_view.dart
├── enums/                    # Перечисления
│   ├── filter.dart
│   └── order.dart
└── utils/                    # Утилиты

android/app/
├── google-services.json      # ❌ Android Firebase конфигурация (НЕ коммитится)
└── google-services.json.example  # ✅ Пример конфигурации

ios/
├── Runner/
│   ├── GoogleService-Info.plist  # ❌ iOS Firebase конфигурация (НЕ коммитится)
│   ├── GoogleService-Info.plist.example  # ✅ Пример конфигурации
│   ├── Info.plist              # ❌ iOS конфигурация с Client ID (НЕ коммитится)
│   └── Info.plist.example      # ✅ Пример конфигурации
├── GoogleService-Info.plist     # ❌ iOS Firebase конфигурация (НЕ коммитится)
└── GoogleService-Info.plist.example  # ✅ Пример конфигурации

macos/
├── Runner/
│   ├── GoogleService-Info.plist  # ❌ macOS Firebase конфигурация (НЕ коммитится)
│   ├── GoogleService-Info.plist.example  # ✅ Пример конфигурации
│   ├── Info.plist              # ❌ macOS конфигурация с Client ID (НЕ коммитится)
│   └── Info.plist.example      # ✅ Пример конфигурации
├── GoogleService-Info.plist     # ❌ macOS Firebase конфигурация (НЕ коммитится)
└── GoogleService-Info.plist.example  # ✅ Пример конфигурации
```

**Легенда:**
- ❌ **Секретные файлы** - НЕ коммитятся в репозиторий
- ✅ **Примеры файлов** - Безопасны для коммита

## 🔧 Разработка

### Команды разработки

```bash
# Очистка проекта
flutter clean

# Установка зависимостей
flutter pub get

# Генерация MobX кода
flutter pub run build_runner build --delete-conflicting-outputs

# Запуск в режиме разработки
flutter run -d chrome --web-port=5000

# Сборка для продакшена
flutter build web
flutter build ios
flutter build apk
```

### Горячая перезагрузка

- **r** - Hot reload
- **R** - Hot restart
- **q** - Выход

## 📱 Поддерживаемые платформы

| Платформа | Статус | Примечания |
|-----------|--------|------------|
| 🌐 Web | ✅ Поддерживается | Chrome, Firefox, Safari |
| 📱 iOS | ✅ Поддерживается | iOS 15.0+ |
| 🤖 Android | ✅ Поддерживается | API 21+ |
| 🖥️ macOS | ✅ Поддерживается | macOS 10.15+ |

## 🚀 Развертывание

### Web (Firebase Hosting)

```bash
# Сборка для продакшена
flutter build web

# Развертывание на Firebase Hosting
firebase deploy
```

### iOS (App Store)

```bash
# Сборка для iOS
flutter build ios --release

# Откройте в Xcode и загрузите в App Store Connect
open ios/Runner.xcworkspace
```

### Android (Google Play)

```bash
# Сборка APK
flutter build apk --release

# Сборка App Bundle (рекомендуется)
flutter build appbundle --release
```

### macOS (App Store)

```bash
# Сборка для macOS
flutter build macos --release

# Откройте в Xcode и загрузите в App Store Connect
open macos/Runner.xcworkspace
```

**Примечание:** Для macOS требуется настройка development signing в Xcode:
1. Откройте `macos/Runner.xcworkspace` в Xcode
2. Выберите target "Runner"
3. Перейдите в "Signing & Capabilities"
4. Включите "Automatically manage signing"
5. Выберите вашу команду разработчика

## 🐛 Отладка

### Логи

```bash
# Запуск с подробными логами
flutter run -d chrome --verbose

# Просмотр логов устройства
flutter logs
```

## 📄 Лицензия

Этот проект лицензирован под MIT License - см. файл [LICENSE](LICENSE) для деталей.

## 👨‍💻 Автор

**Артем Лоскутников**
- GitHub: [@artlosk](https://github.com/artlosk)
- Email: artlosk@gmail.com
