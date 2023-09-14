package com.example.ui_ux_pet

import android.os.Build
import android.os.Bundle
import android.window.SplashScreenView
import androidx.core.splashscreen.SplashScreen.Companion.installSplashScreen
import androidx.core.splashscreen.SplashScreenViewProvider
import androidx.core.view.WindowCompat
import io.flutter.embedding.android.FlutterActivity

class MainActivity : FlutterActivity() {

    @Override
    protected override fun onCreate(savedInstanceState: Bundle?) {
        val splashScreen = installSplashScreen()
        // Aligns the Flutter view vertically with the window.
        WindowCompat.setDecorFitsSystemWindows(window, false)

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
            // Disable the Android splash screen fade out animation to avoid
            // a flicker before the similar frame is drawn in Flutter.
            splashScreen
                .setOnExitAnimationListener { splashScreenView: SplashScreenViewProvider -> splashScreenView.remove() }
        }
        super.onCreate(savedInstanceState)
    }
}
