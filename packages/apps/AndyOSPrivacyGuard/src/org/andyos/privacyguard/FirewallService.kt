package org.andyos.privacyguard

import android.app.Service
import android.content.Intent
import android.os.IBinder

/**
 * Background service for network firewall
 * Manages iptables/nftables rules
 */
class FirewallService : Service() {
    
    override fun onBind(intent: Intent?): IBinder? = null
    
    override fun onStartCommand(intent: Intent?, flags: Int, startId: Int): Int {
        when (intent?.action) {
            ACTION_ENABLE_FIREWALL -> enableFirewall()
            ACTION_DISABLE_FIREWALL -> disableFirewall()
            ACTION_BLOCK_APP -> {
                val packageName = intent.getStringExtra(EXTRA_PACKAGE_NAME)
                packageName?.let { blockApp(it) }
            }
            ACTION_UNBLOCK_APP -> {
                val packageName = intent.getStringExtra(EXTRA_PACKAGE_NAME)
                packageName?.let { unblockApp(it) }
            }
        }
        return START_STICKY
    }
    
    private fun enableFirewall() {
        // TODO: Execute iptables commands to enable firewall
        // Example: iptables -A OUTPUT -j DROP (default deny)
    }
    
    private fun disableFirewall() {
        // TODO: Flush iptables rules
        // Example: iptables -F OUTPUT
    }
    
    private fun blockApp(packageName: String) {
        // TODO: Block specific app by UID
        // Example: iptables -A OUTPUT -m owner --uid-owner [app_uid] -j DROP
    }
    
    private fun unblockApp(packageName: String) {
        // TODO: Remove block rule for app
        // Example: iptables -D OUTPUT -m owner --uid-owner [app_uid] -j DROP
    }
    
    companion object {
        const val ACTION_ENABLE_FIREWALL = "org.andyos.privacyguard.ENABLE_FIREWALL"
        const val ACTION_DISABLE_FIREWALL = "org.andyos.privacyguard.DISABLE_FIREWALL"
        const val ACTION_BLOCK_APP = "org.andyos.privacyguard.BLOCK_APP"
        const val ACTION_UNBLOCK_APP = "org.andyos.privacyguard.UNBLOCK_APP"
        const val EXTRA_PACKAGE_NAME = "package_name"
    }
}
