package org.andyos.privacyguard;

import android.app.Service;
import android.content.Intent;
import android.os.IBinder;

public class PrivacyGuardService extends Service {
    @Override
    public IBinder onBind(Intent intent) {
        return null;
    }

    @Override
    public int onStartCommand(Intent intent, int flags, int startId) {
        // AndyOS Privacy Guard Firewall Service
        return START_STICKY;
    }
}
