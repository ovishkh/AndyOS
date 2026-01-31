function updateClock() {
    const now = new Date();
    const clock = document.getElementById('clock');
    clock.textContent = now.getHours().toString().padStart(2, '0') + ':' +
        now.getMinutes().toString().padStart(2, '0');
}

setInterval(updateClock, 1000);
updateClock();

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

// Add a subtle parallax effect to the glow orbs
document.addEventListener('mousemove', (e) => {
    const x = e.clientX / window.innerWidth;
    const y = e.clientY / window.innerHeight;

    const orbs = document.querySelectorAll('.glow-orb');
    orbs.forEach((orb, index) => {
        const speed = (index + 1) * 20;
        orb.style.transform = `translate(${x * speed}px, ${y * speed}px)`;
    });
});
