// script.js

// Smooth scroll for internal nav links
document.querySelectorAll('a[href^="#"]').forEach(anchor => {
  anchor.addEventListener('click', function (e) {
    e.preventDefault();
    const target = document.querySelector(this.getAttribute('href'));
    if (target) {
      target.scrollIntoView({ behavior: 'smooth' });
    }
  });
});

// Fade in sections on scroll
const faders = document.querySelectorAll('.section');
const appearOptions = {
  threshold: 0.1,
  rootMargin: '0px 0px -100px 0px'
};

const appearOnScroll = new IntersectionObserver((entries, observer) => {
  entries.forEach(entry => {
    if (!entry.isIntersecting) return;
    entry.target.classList.add('fade-in');
    observer.unobserve(entry.target);
  });
}, appearOptions);

faders.forEach(section => {
  appearOnScroll.observe(section);
});

// Fetch GitHub projects and populate cards dynamically
const projectContainer = document.getElementById("github-projects");

async function fetchGitHubProjects() {
  try {
    const res = await fetch("https://api.github.com/users/santhos27/repos");
    const repos = await res.json();

    const portfolioRepos = repos.filter(repo => repo.name.includes("portfolio"));

    portfolioRepos.forEach(repo => {
      const card = document.createElement("div");
      card.className = "project-card fade-in";

      card.innerHTML = `
        <h3>${repo.name}</h3>
        <p>${repo.description || "No description provided."}</p>
        <a href="${repo.html_url}" target="_blank">View Project</a>
      `;

      projectContainer.appendChild(card);
    });
  } catch (err) {
    console.error("Error fetching GitHub repos:", err);
  }
}

document.addEventListener("DOMContentLoaded", fetchGitHubProjects);
