// Scroll-reveal animation for sections
const io = new IntersectionObserver((entries) => {
  entries.forEach(e => {
    if (e.isIntersecting) { e.target.classList.add('in'); }
  });
}, { threshold: 0.12 });
document.querySelectorAll('.reveal').forEach(el => io.observe(el));

// Ensure the "Email me" button opens the user's default mail app directly
document.addEventListener('DOMContentLoaded', () => {
  const emailBtn = document.querySelector('a[href^="mailto:"]');
  if (emailBtn) {
    emailBtn.addEventListener('click', (e) => {
      window.location.href = emailBtn.getAttribute('href');
    });
  }
});
