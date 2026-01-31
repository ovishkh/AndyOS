// State management
let currentScreen = 'boot';
let currentApp = null;
const history = [];

// Clock update
function updateClock() {
    const now = new Date();
    const timeString = now.getHours().toString().padStart(2, '0') + ':' +
        now.getMinutes().toString().padStart(2, '0');
    document.getElementById('clock').textContent = timeString;

    const lockTime = document.querySelector('.lock-time');
    if (lockTime) {
        lockTime.textContent = timeString;
    }
}

setInterval(updateClock, 1000);
updateClock();

// Boot sequence
function startBootSequence() {
    setTimeout(() => {
        showScreen('lock');
    }, 3000);
}

// Show screen
function showScreen(screenName) {
    // Hide all screens
    document.querySelectorAll('.screen-view, .app-view, .panel').forEach(el => {
        el.style.display = 'none';
        el.classList.remove('active');
    });

    // Show target screen
    const screen = document.getElementById(`${screenName}-screen`);
    if (screen) {
        screen.style.display = 'flex';
        setTimeout(() => screen.classList.add('active'), 10);
        currentScreen = screenName;
        history.push(screenName);
    }
}

// Unlock device
function unlockDevice() {
    if (currentScreen === 'lock') {
        showScreen('home');
    }
}

// Open app
function openApp(appName) {
    const appView = document.getElementById(`app-${appName}`);
    if (appView) {
        appView.style.display = 'flex';
        setTimeout(() => appView.classList.add('active'), 10);
        currentApp = appName;
        history.push(`app-${appName}`);
    }
}

// Close app
function closeApp() {
    if (currentApp) {
        const appView = document.getElementById(`app-${currentApp}`);
        if (appView) {
            appView.classList.remove('active');
            setTimeout(() => appView.style.display = 'none', 300);
        }
        currentApp = null;
        history.pop();
    }
}

// Toggle panel
function togglePanel(panelName) {
    const panel = document.getElementById(panelName);
    if (panel) {
        const isActive = panel.classList.contains('active');

        // Close all panels first
        document.querySelectorAll('.panel').forEach(p => {
            p.classList.remove('active');
            setTimeout(() => {
                if (!p.classList.contains('active')) {
                    p.style.display = 'none';
                }
            }, 300);
        });

        if (!isActive) {
            panel.style.display = 'flex';
            setTimeout(() => panel.classList.add('active'), 10);
            history.push(panelName);
        } else {
            history.pop();
        }
    }
}

// Navigation functions
function goBack() {
    if (history.length > 1) {
        history.pop(); // Remove current
        const previous = history[history.length - 1];

        // Close current app or panel
        if (currentApp) {
            closeApp();
        } else {
            document.querySelectorAll('.panel.active').forEach(p => {
                p.classList.remove('active');
                setTimeout(() => p.style.display = 'none', 300);
            });
        }

        // Navigate to previous
        if (previous.startsWith('app-')) {
            const appName = previous.replace('app-', '');
            openApp(appName);
        } else if (previous.includes('-')) {
            togglePanel(previous);
        } else {
            showScreen(previous);
        }
    }
}

function goHome() {
    // Close all apps and panels
    document.querySelectorAll('.app-view, .panel').forEach(el => {
        el.classList.remove('active');
        setTimeout(() => el.style.display = 'none', 300);
    });

    currentApp = null;
    showScreen('home');
    history.length = 0;
    history.push('home');
}

// Show About Phone
function showAboutPhone() {
    const aboutPhone = document.getElementById('about-phone');
    if (aboutPhone) {
        aboutPhone.style.display = 'flex';
        setTimeout(() => aboutPhone.classList.add('active'), 10);
        history.push('about-phone');
    }
}

function closeAboutPhone() {
    const aboutPhone = document.getElementById('about-phone');
    if (aboutPhone) {
        aboutPhone.classList.remove('active');
        setTimeout(() => aboutPhone.style.display = 'none', 300);
        history.pop();
    }
}

// Event listeners
document.addEventListener('DOMContentLoaded', () => {
    // Start boot sequence
    startBootSequence();

    // Lock screen unlock
    const lockScreen = document.getElementById('lock-screen');
    if (lockScreen) {
        lockScreen.addEventListener('click', unlockDevice);
    }

    // Status bar - open quick settings
    const statusBar = document.getElementById('status-bar');
    if (statusBar) {
        statusBar.addEventListener('click', () => {
            if (currentScreen === 'home') {
                togglePanel('quick-settings');
            }
        });
    }

    // App icons - open apps
    document.querySelectorAll('.app-icon[data-app]').forEach(icon => {
        icon.addEventListener('click', (e) => {
            e.stopPropagation();
            const appName = icon.getAttribute('data-app');
            openApp(appName);
        });
    });

    // Drawer app items
    document.querySelectorAll('.drawer-app-item[data-app]').forEach(item => {
        item.addEventListener('click', (e) => {
            e.stopPropagation();
            const appName = item.getAttribute('data-app');
            togglePanel('app-drawer'); // Close drawer first
            setTimeout(() => openApp(appName), 300);
        });
    });

    // Search bar - open app drawer
    const searchBar = document.querySelector('.search-bar');
    if (searchBar) {
        searchBar.addEventListener('click', () => {
            togglePanel('app-drawer');
        });
    }

    // Dock swipe up gesture (simulated with click on dock area)
    const dock = document.querySelector('.dock');
    if (dock) {
        let touchStartY = 0;

        dock.addEventListener('touchstart', (e) => {
            touchStartY = e.touches[0].clientY;
        });

        dock.addEventListener('touchend', (e) => {
            const touchEndY = e.changedTouches[0].clientY;
            const deltaY = touchStartY - touchEndY;

            if (deltaY > 50) { // Swipe up
                togglePanel('app-drawer');
            }
        });
    }

    // Quick tile toggles
    document.querySelectorAll('.quick-tile').forEach(tile => {
        tile.addEventListener('click', () => {
            tile.classList.toggle('active');
        });
    });

    // Switch interactions with ripple effect
    document.querySelectorAll('.switch input').forEach(sw => {
        sw.addEventListener('change', (e) => {
            const card = e.target.closest('.feature-card');
            if (card) {
                card.style.transform = 'scale(0.98)';
                setTimeout(() => {
                    card.style.transform = 'scale(1)';
                }, 100);
            }
        });
    });

    // F-Droid install buttons
    document.querySelectorAll('.btn-install').forEach(btn => {
        btn.addEventListener('click', (e) => {
            e.stopPropagation();
            btn.textContent = 'Installing...';
            btn.disabled = true;

            setTimeout(() => {
                btn.textContent = 'Installed';
                btn.style.background = 'var(--text-tertiary)';
            }, 2000);
        });
    });

    // Drawer search functionality
    const drawerSearch = document.querySelector('.drawer-search input');
    if (drawerSearch) {
        drawerSearch.addEventListener('input', (e) => {
            const query = e.target.value.toLowerCase();
            document.querySelectorAll('.drawer-app-item').forEach(item => {
                const appName = item.querySelector('span').textContent.toLowerCase();
                if (appName.includes(query)) {
                    item.style.display = 'flex';
                } else {
                    item.style.display = 'none';
                }
            });
        });
    }

    // Prevent default touch behaviors for smoother experience
    document.addEventListener('touchmove', (e) => {
        if (e.target.closest('.panel, .app-view')) {
            // Allow scrolling in panels and apps
            return;
        }
        e.preventDefault();
    }, { passive: false });
});

// Keyboard shortcuts for demo
document.addEventListener('keydown', (e) => {
    switch (e.key) {
        case 'Escape':
            goBack();
            break;
        case 'h':
            goHome();
            break;
        case 'q':
            togglePanel('quick-settings');
            break;
        case 'd':
            togglePanel('app-drawer');
            break;
    }
});

// Export functions for inline onclick handlers
window.unlockDevice = unlockDevice;
window.openApp = openApp;
window.closeApp = closeApp;
window.togglePanel = togglePanel;
window.goBack = goBack;
window.goHome = goHome;
window.showAboutPhone = showAboutPhone;
window.closeAboutPhone = closeAboutPhone;
