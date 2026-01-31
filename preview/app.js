// Clock update
function updateClock() {
    const now = new Date();
    const clock = document.getElementById('clock');
    clock.textContent = now.getHours().toString().padStart(2, '0') + ':' +
        now.getMinutes().toString().padStart(2, '0');
}

setInterval(updateClock, 1000);
updateClock();

// Navigation functions
function nextStep() {
    document.getElementById('setup-wizard').style.display = 'none';
    document.getElementById('privacy-guard').style.display = 'block';
}

function prevStep() {
    document.getElementById('setup-wizard').style.display = 'block';
    document.getElementById('privacy-guard').style.display = 'none';
}

function showHome() {
    document.getElementById('privacy-guard').style.display = 'none';
    document.getElementById('home-screen').style.display = 'block';
}

function restartDemo() {
    document.getElementById('home-screen').style.display = 'none';
    document.getElementById('setup-wizard').style.display = 'block';
}

// Add subtle interaction feedback
document.addEventListener('DOMContentLoaded', () => {
    const switches = document.querySelectorAll('.switch input');
    switches.forEach(sw => {
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
});
