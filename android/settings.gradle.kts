pluginManagement {
    val flutterSdkPath =
        run {
            val properties = java.util.Properties()
            file("local.properties").inputStream().use { properties.load(it) }
            val flutterSdkPath = properties.getProperty("flutter.sdk")
            require(flutterSdkPath != null) { "flutter.sdk not set in local.properties" }
            flutterSdkPath
        }

    includeBuild("$flutterSdkPath/packages/flutter_tools/gradle")

    repositories {
        google()
        mavenCentral()
        gradlePluginPortal()
    }
}

plugins {
    id("dev.flutter.flutter-plugin-loader") version "1.0.0"
    id("com.android.application") version "8.11.1" apply false
    id("org.jetbrains.kotlin.android") version "2.2.20" apply false
}

include(":app")

// Plugin directories are handled automatically by Flutter
// val pathProviderAndroid = findProject(":path_provider_android")
// if (pathProviderAndroid != null) {
//     pathProviderAndroid.projectDir = File(settingsDir, "../.plugin_symlinks/path_provider_android/android")
// }

// val sharedPreferencesAndroid = findProject(":shared_preferences_android")
// if (sharedPreferencesAndroid != null) {
//     sharedPreferencesAndroid.projectDir = File(settingsDir, "../.plugin_symlinks/shared_preferences_android/android")
// }
