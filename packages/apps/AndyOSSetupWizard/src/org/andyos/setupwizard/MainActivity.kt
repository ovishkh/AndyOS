package org.andyos.setupwizard

import android.content.Intent
import android.os.Bundle
import android.provider.Settings
import android.widget.Button
import android.widget.CheckBox
import android.widget.RadioGroup
import androidx.appcompat.app.AppCompatActivity
import androidx.viewpager2.widget.ViewPager2

/**
 * AndyOS Setup Wizard
 * 
 * Privacy-focused onboarding flow:
 * 1. Welcome screen
 * 2. Privacy agreement
 * 3. WiFi setup
 * 4. DNS provider selection
 * 5. Encryption setup
 * 6. F-Droid initialization
 */
class MainActivity : AppCompatActivity() {
    
    private lateinit var viewPager: ViewPager2
    private lateinit var nextButton: Button
    private lateinit var skipButton: Button
    
    private var currentStep = 0
    
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        
        initializeViews()
        setupViewPager()
    }
    
    private fun initializeViews() {
        viewPager = findViewById(R.id.view_pager)
        nextButton = findViewById(R.id.next_button)
        skipButton = findViewById(R.id.skip_button)
        
        nextButton.setOnClickListener { goToNextStep() }
        skipButton.setOnClickListener { skipSetup() }
    }
    
    private fun setupViewPager() {
        val fragments = listOf(
            WelcomeFragment(),
            PrivacyAgreementFragment(),
            WiFiSetupFragment(),
            DnsProviderFragment(),
            EncryptionFragment(),
            FDroidSetupFragment()
        )
        
        // TODO: Create ViewPager adapter
        // viewPager.adapter = SetupPagerAdapter(this, fragments)
        
        viewPager.registerOnPageChangeCallback(object : ViewPager2.OnPageChangeCallback() {
            override fun onPageSelected(position: Int) {
                currentStep = position
                updateButtons()
            }
        })
    }
    
    private fun goToNextStep() {
        when (currentStep) {
            0 -> viewPager.currentItem = 1 // Welcome -> Privacy
            1 -> {
                if (validatePrivacyAgreement()) {
                    viewPager.currentItem = 2 // Privacy -> WiFi
                }
            }
            2 -> viewPager.currentItem = 3 // WiFi -> DNS
            3 -> {
                applyDnsSettings()
                viewPager.currentItem = 4 // DNS -> Encryption
            }
            4 -> {
                setupEncryption()
                viewPager.currentItem = 5 // Encryption -> F-Droid
            }
            5 -> finishSetup() // Complete
        }
    }
    
    private fun validatePrivacyAgreement(): Boolean {
        // TODO: Check if user accepted privacy terms
        return true
    }
    
    private fun applyDnsSettings() {
        // Set privacy-respecting DNS (Quad9 by default)
        Settings.Global.putString(
            contentResolver,
            Settings.Global.PRIVATE_DNS_MODE,
            "hostname"
        )
        Settings.Global.putString(
            contentResolver,
            Settings.Global.PRIVATE_DNS_SPECIFIER,
            "dns.quad9.net"
        )
    }
    
    private fun setupEncryption() {
        // TODO: Trigger encryption setup if not already encrypted
        // This typically requires a reboot
    }
    
    private fun finishSetup() {
        // Mark setup as complete
        Settings.Global.putInt(
            contentResolver,
            Settings.Global.DEVICE_PROVISIONED,
            1
        )
        
        Settings.Secure.putInt(
            contentResolver,
            Settings.Secure.USER_SETUP_COMPLETE,
            1
        )
        
        // Launch home screen
        val homeIntent = Intent(Intent.ACTION_MAIN).apply {
            addCategory(Intent.CATEGORY_HOME)
            flags = Intent.FLAG_ACTIVITY_NEW_TASK
        }
        startActivity(homeIntent)
        finish()
    }
    
    private fun skipSetup() {
        // Show warning dialog about skipping privacy setup
        // TODO: Implement confirmation dialog
        finishSetup()
    }
    
    private fun updateButtons() {
        when (currentStep) {
            0 -> {
                nextButton.text = "Get Started"
                skipButton.visibility = Button.GONE
            }
            5 -> {
                nextButton.text = "Finish"
                skipButton.visibility = Button.GONE
            }
            else -> {
                nextButton.text = "Next"
                skipButton.visibility = Button.VISIBLE
            }
        }
    }
}

// Fragment classes (placeholders)
class WelcomeFragment : androidx.fragment.app.Fragment()
class PrivacyAgreementFragment : androidx.fragment.app.Fragment()
class WiFiSetupFragment : androidx.fragment.app.Fragment()
class DnsProviderFragment : androidx.fragment.app.Fragment()
class EncryptionFragment : androidx.fragment.app.Fragment()
class FDroidSetupFragment : androidx.fragment.app.Fragment()
