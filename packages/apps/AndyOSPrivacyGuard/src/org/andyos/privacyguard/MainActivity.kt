package org.andyos.privacyguard

import android.os.Bundle
import androidx.appcompat.app.AppCompatActivity
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import com.google.android.material.switchmaterial.SwitchMaterial
import com.google.android.material.tabs.TabLayout

/**
 * AndyOS Privacy Guard - Main Activity
 * 
 * Features:
 * - Per-app network firewall (iptables/nftables)
 * - Tracker blocking (Exodus Privacy database)
 * - Permission monitoring
 * - Network activity logging
 */
class MainActivity : AppCompatActivity() {
    
    private lateinit var tabLayout: TabLayout
    private lateinit var appListRecycler: RecyclerView
    private lateinit var masterFirewallSwitch: SwitchMaterial
    private lateinit var trackerBlockingSwitch: SwitchMaterial
    
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        
        initializeViews()
        setupFirewall()
        loadInstalledApps()
    }
    
    private fun initializeViews() {
        tabLayout = findViewById(R.id.tab_layout)
        appListRecycler = findViewById(R.id.app_list_recycler)
        masterFirewallSwitch = findViewById(R.id.master_firewall_switch)
        trackerBlockingSwitch = findViewById(R.id.tracker_blocking_switch)
        
        // Setup tabs
        tabLayout.addTab(tabLayout.newTab().setText("Apps"))
        tabLayout.addTab(tabLayout.newTab().setText("Trackers"))
        tabLayout.addTab(tabLayout.newTab().setText("Network"))
        tabLayout.addTab(tabLayout.newTab().setText("Logs"))
        
        // Setup RecyclerView
        appListRecycler.layoutManager = LinearLayoutManager(this)
    }
    
    private fun setupFirewall() {
        masterFirewallSwitch.setOnCheckedChangeListener { _, isChecked ->
            if (isChecked) {
                enableFirewall()
            } else {
                disableFirewall()
            }
        }
        
        trackerBlockingSwitch.setOnCheckedChangeListener { _, isChecked ->
            if (isChecked) {
                enableTrackerBlocking()
            } else {
                disableTrackerBlocking()
            }
        }
        
        // Load current state
        loadFirewallState()
    }
    
    private fun loadInstalledApps() {
        val packageManager = packageManager
        val apps = packageManager.getInstalledApplications(0)
            .filter { !it.packageName.startsWith("com.google") }
            .sortedBy { packageManager.getApplicationLabel(it).toString() }
        
        // TODO: Create adapter and bind to RecyclerView
        // appListRecycler.adapter = AppListAdapter(apps, this)
    }
    
    private fun enableFirewall() {
        // TODO: Implement iptables/nftables rules
        // Example: iptables -A OUTPUT -m owner --uid-owner [app_uid] -j DROP
    }
    
    private fun disableFirewall() {
        // TODO: Remove iptables/nftables rules
    }
    
    private fun enableTrackerBlocking() {
        // TODO: Load Exodus Privacy tracker database
        // TODO: Block known tracker domains via /etc/hosts or DNS
    }
    
    private fun disableTrackerBlocking() {
        // TODO: Remove tracker blocking rules
    }
    
    private fun loadFirewallState() {
        // TODO: Read current firewall state from system
        // TODO: Update UI switches accordingly
    }
}
