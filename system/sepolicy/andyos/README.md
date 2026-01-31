# AndyOS SELinux Policies

Custom SELinux policies for AndyOS system apps and privacy features.

## Policies

### Privacy Guard
- Network firewall permissions
- Packet filtering capabilities
- System app monitoring

### System Services
- AndyOS daemon contexts
- Privacy service permissions
- Secure IPC policies

## Building
Policies are automatically compiled during AOSP build.

## Testing
```bash
# Check policy violations
adb shell dmesg | grep avc

# Verify enforcing mode
adb shell getenforce
```
