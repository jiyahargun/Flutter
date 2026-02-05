plugins {
    id("com.android.application")
    id("kotlin-android")
    id("com.google.gms.google-services")   // ✅ Firebase REQUIRED
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.example.whatsapp_saver"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        applicationId = "com.example.whatsapp_saver"

        minSdk = flutter.minSdkVersion                 // ✅ ONLY ONCE
        targetSdk = flutter.targetSdkVersion

        versionCode = flutter.versionCode
        versionName = flutter.versionName

        multiDexEnabled = true      // ✅ REQUIRED
    }

    buildTypes {
        release {
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}

flutter {
    source = "../.."
}

dependencies {
    implementation("androidx.multidex:multidex:2.0.1")
}
