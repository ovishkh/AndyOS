# Contributing to AndyOS

Thank you for your interest in contributing to AndyOS! This document provides guidelines for contributing to the project.

## Code of Conduct

- Be respectful and inclusive
- Focus on constructive feedback
- Prioritize privacy and security in all contributions
- Follow the project's privacy-first philosophy

## How to Contribute

### Reporting Issues

1. Check existing issues to avoid duplicates
2. Use the issue template (if available)
3. Provide detailed reproduction steps
4. Include system information (device, Android version, build number)
5. Attach logs when relevant (sanitize personal data)

### Submitting Pull Requests

1. **Fork the repository**
   ```bash
   git clone https://github.com/ovishkh/AndyOS.git
   cd AndyOS
   git checkout -b feature/your-feature-name
   ```

2. **Make your changes**
   - Follow existing code style
   - Write clear commit messages
   - Test your changes thoroughly
   - Update documentation as needed

3. **Commit guidelines**
   ```
   type(scope): brief description
   
   Detailed explanation of changes
   
   - Bullet points for key changes
   - Reference issues: Fixes #123
   ```
   
   Types: `feat`, `fix`, `docs`, `style`, `refactor`, `test`, `chore`

4. **Push and create PR**
   ```bash
   git push origin feature/your-feature-name
   ```
   - Open PR against `main` branch
   - Fill out PR template
   - Link related issues

### Development Setup

```bash
# Install dependencies (Ubuntu 22.04)
sudo apt-get install -y \
    git-core gnupg flex bison build-essential zip curl \
    zlib1g-dev gcc-multilib g++-multilib libc6-dev-i386 \
    libncurses5 lib32ncurses5-dev x11proto-core-dev \
    libx11-dev lib32z1-dev libgl1-mesa-dev libxml2-utils \
    xsltproc unzip fontconfig python3

# Initialize repo
repo init -u https://android.googlesource.com/platform/manifest -b android-14.0.0_r1
repo sync -c -j$(nproc --all)

# Build
./build/build-andyos.sh panther user
```

### Areas for Contribution

#### High Priority
- **Privacy Hardening**: Remove additional Google dependencies
- **Security Patches**: Kernel hardening, SELinux policies
- **Device Support**: Add support for more Pixel devices
- **App Development**: Improve Privacy Guard, Setup Wizard
- **Documentation**: Installation guides, troubleshooting

#### Medium Priority
- **Performance**: Optimize build size, boot time
- **UI/UX**: Improve system apps, settings interface
- **Testing**: Automated tests, CI/CD pipelines
- **Translations**: Internationalization support

#### Low Priority
- **Themes**: Custom icon packs, wallpapers
- **Features**: Additional privacy tools
- **Integrations**: Third-party app compatibility

## Code Style

### Kotlin (Android Apps)
```kotlin
// Use 4 spaces for indentation
class PrivacyGuard {
    private val TAG = "PrivacyGuard"
    
    fun blockTracker(packageName: String) {
        // Clear, descriptive variable names
        val isBlocked = firewallService.block(packageName)
        Log.d(TAG, "Blocked $packageName: $isBlocked")
    }
}
```

### Shell Scripts
```bash
#!/bin/bash
# Use 2 spaces for indentation
# Add comments for complex logic

function build_rom() {
  local device=$1
  local variant=$2
  
  echo "Building AndyOS for ${device}..."
  # Build logic here
}
```

### Makefiles
```makefile
# Follow AOSP conventions
# Use tabs for indentation

PRODUCT_PACKAGES += \
    PrivacyGuard \
    SetupWizard \
    Updater
```

## Privacy Guidelines

All contributions must adhere to these privacy principles:

1. **No Tracking**: Never add analytics, telemetry, or tracking
2. **No Google**: Avoid dependencies on Google services
3. **Minimal Permissions**: Request only essential permissions
4. **Local First**: Prefer on-device processing over cloud
5. **Open Source**: Use open-source libraries when possible
6. **Transparency**: Document all network connections

## Security Guidelines

1. **Input Validation**: Sanitize all user inputs
2. **Secure Defaults**: Enable security features by default
3. **Least Privilege**: Run with minimal permissions
4. **Code Review**: All PRs require review
5. **Vulnerability Disclosure**: Report security issues privately

## Testing

Before submitting:

```bash
# Build test
./build/build-andyos.sh panther userdebug

# Flash to device
fastboot flashall -w

# Verify privacy
adb shell "tcpdump -i any host google.com"  # Should show no traffic

# Check for trackers
# Use Exodus Privacy or ClassyShark
```

## Documentation

- Update README.md for user-facing changes
- Update docs/ for technical changes
- Add inline comments for complex logic
- Update CHANGELOG.md

## License

By contributing, you agree that your contributions will be licensed under the Apache License 2.0.

## Questions?

- Open a discussion on GitHub
- Join our community chat (if available)
- Email: [contact info]

---

**Thank you for helping make AndyOS better!**
