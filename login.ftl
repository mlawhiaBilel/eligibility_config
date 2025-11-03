<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Amaris - Login</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">

  <style>
    :root {
      --primary-color: #2a2c7c;
      --secondary-color: #1a1c5c;
      --accent-color: #2a2c7c;
      --transition: 220ms ease;
    }

    body {
      margin: 0;
      font-family: Inter, system-ui, Segoe UI, Roboto, Arial;
      background: #ffffff;
      color: #111;
      transition: background-color var(--transition);
    }

    body.dark {
      background: #071224;
      color: #e6eef7;
    }

    .login-container {
      min-height: 100vh;
      display: flex;
      align-items: center;
      justify-content: center;
      background: linear-gradient(-45deg, #2a2c7c, #1a1c5c, #3a3c9c, #4a4cbc);
      background-size: 400% 400%;
      animation: gradientShift 15s ease infinite;
      padding: 1rem;
      position: relative;
      overflow: hidden;
    }

    @keyframes gradientShift {
      0% { background-position: 0% 50%; }
      50% { background-position: 100% 50%; }
      100% { background-position: 0% 50%; }
    }

    .login-container::before {
      content: '';
      position: absolute;
      top: 0;
      left: 0;
      right: 0;
      bottom: 0;
      background: 
        radial-gradient(circle at 20% 80%, rgba(120, 119, 198, 0.3) 0%, transparent 50%),
        radial-gradient(circle at 80% 20%, rgba(255, 119, 198, 0.2) 0%, transparent 50%);
      animation: float 20s ease-in-out infinite;
      pointer-events: none;
    }

    @keyframes float {
      0%, 100% { transform: translateY(0px); }
      50% { transform: translateY(-20px); }
    }

    .login-card {
      background: rgba(255, 255, 255, 0.95);
      backdrop-filter: blur(10px);
      border-radius: 20px;
      box-shadow: 0 20px 40px rgba(0, 0, 0, 0.1);
      overflow: hidden;
      width: 100%;
      max-width: 440px;
      transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1);
      border: 1px solid rgba(255, 255, 255, 0.3);
    }

    .login-card:hover {
      transform: translateY(-8px);
      box-shadow: 0 30px 60px rgba(0, 0, 0, 0.15);
    }

    .login-header {
      background: linear-gradient(135deg, var(--primary-color) 0%, var(--secondary-color) 100%);
      padding: 2.5rem 1.5rem 1.5rem;
      text-align: center;
      color: white;
      position: relative;
      overflow: hidden;
    }

    .login-header::before {
      content: '';
      position: absolute;
      top: -50%;
      left: -50%;
      width: 200%;
      height: 200%;
      background: linear-gradient(45deg, transparent, rgba(255, 255, 255, 0.1), transparent);
      animation: shine 3s ease-in-out infinite;
    }

    @keyframes shine {
      0%, 100% { transform: translateX(-100%); }
      50% { transform: translateX(100%); }
    }

    .logo-container {
      margin-bottom: 1.5rem;
      display: flex;
      justify-content: center;
      align-items: center;
      position: relative;
      z-index: 2;
    }

    .logo {
      height: 80px;
      width: auto;
      max-width: 100%;
      object-fit: contain;
      filter: drop-shadow(0 4px 8px rgba(0, 0, 0, 0.2));
      transition: all 0.3s ease;
    }

    .login-header h1 {
      font-size: 1.75rem;
      margin: 0;
      font-weight: 600;
      letter-spacing: 0.5px;
      position: relative;
      z-index: 2;
      text-shadow: 0 2px 4px rgba(0, 0, 0, 0.3);
    }

    .login-body {
      padding: 2.5rem 2rem 2rem;
    }

    .form-group {
      margin-bottom: 1.5rem;
      position: relative;
    }

    .form-label {
      font-weight: 500;
      margin-bottom: 0.5rem;
      display: flex;
      align-items: center;
      gap: 0.5rem;
      color: #495057;
      transition: color var(--transition);
    }

    body.dark .form-label {
      color: #cbd5e1;
    }

    .form-control {
      padding: 0.75rem 1rem;
      border-radius: 8px;
      border: 1px solid #ddd;
      transition: all var(--transition);
      font-size: 1rem;
      background: rgba(255, 255, 255, 0.9);
      width: 100%;
    }

    .form-control:focus {
      border-color: var(--accent-color);
      box-shadow: 0 0 0 3px rgba(42, 44, 124, 0.2);
      outline: none;
    }

    body.dark .form-control {
      background: rgba(45, 55, 72, 0.9);
      border-color: #4a5568;
      color: #e6eef7;
    }

    .btn-login {
      background: linear-gradient(135deg, var(--primary-color) 0%, var(--secondary-color) 100%);
      border: none;
      color: white;
      padding: 1rem 2rem;
      border-radius: 12px;
      font-weight: 600;
      font-size: 1.1rem;
      width: 100%;
      transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
      margin-top: 0.5rem;
      cursor: pointer;
    }

    .btn-login:hover {
      transform: translateY(-3px);
      box-shadow: 0 15px 30px rgba(42, 44, 124, 0.4);
    }

    .btn-sso {
      background: #2a2c7c;
      border: 1px solid #1a1c5c;
      color: white;
      padding: 0.75rem 1.5rem;
      border-radius: 8px;
      font-weight: 500;
      width: 100%;
      transition: all var(--transition);
      display: flex;
      align-items: center;
      justify-content: center;
      gap: 0.75rem;
      margin-top: 1rem;
      text-decoration: none;
      cursor: pointer;
    }

    .btn-sso:hover {
      background: #1a1c5c;
      transform: translateY(-2px);
      color: white;
    }

    .divider {
      display: flex;
      align-items: center;
      margin: 1.5rem 0;
      color: #6b7280;
      font-size: 0.875rem;
    }

    .divider::before,
    .divider::after {
      content: "";
      flex: 1;
      border-bottom: 1px solid #e5e7eb;
    }

    .divider span {
      padding: 0 1rem;
      background: rgba(255, 255, 255, 0.9);
      border-radius: 20px;
    }

    body.dark .divider::before,
    body.dark .divider::after {
      border-bottom-color: #4b5563;
    }

    body.dark .divider span {
      background: rgba(30, 41, 59, 0.9);
      color: #9ca3af;
    }

    .theme-toggle {
      position: absolute;
      bottom: 1.5rem;
      left: 1.5rem;
      background: rgba(255, 255, 255, 0.25);
      border: 2px solid rgba(255, 255, 255, 0.3);
      color: white;
      border-radius: 50%;
      width: 50px;
      height: 50px;
      display: flex;
      align-items: center;
      justify-content: center;
      cursor: pointer;
      transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
      z-index: 10;
      backdrop-filter: blur(10px);
      font-size: 1.2rem;
    }

    .theme-toggle:hover {
      background: rgba(255, 255, 255, 0.4);
      transform: scale(1.1) rotate(15deg);
    }

    .language-selector {
      position: absolute;
      top: 1.5rem;
      right: 1.5rem;
      z-index: 10;
    }

    .lang-btn {
      background: rgba(255, 255, 255, 0.25);
      border: 2px solid rgba(255, 255, 255, 0.3);
      color: white;
      border-radius: 12px;
      padding: 0.6rem 1rem;
      display: flex;
      align-items: center;
      gap: 0.6rem;
      cursor: pointer;
      transition: all 0.3s ease;
      font-size: 0.9rem;
      font-weight: 500;
      backdrop-filter: blur(10px);
    }

    .lang-btn:hover {
      background: rgba(255, 255, 255, 0.4);
      transform: translateY(-2px);
    }

    .lang-btn img {
      height: 16px;
      width: auto;
      border-radius: 2px;
    }

    .dropdown-menu {
      min-width: 160px;
      background: rgba(255, 255, 255, 0.95);
      backdrop-filter: blur(20px);
      border: 1px solid rgba(255, 255, 255, 0.3);
      border-radius: 12px;
      box-shadow: 0 20px 40px rgba(0, 0, 0, 0.15);
      overflow: hidden;
    }

    .dropdown-item {
      display: flex;
      align-items: center;
      gap: 0.75rem;
      padding: 0.75rem 1rem;
      transition: all 0.2s ease;
      cursor: pointer;
      color: #333;
    }

    .dropdown-item:hover {
      background: linear-gradient(135deg, var(--primary-color) 0%, var(--secondary-color) 100%);
      color: white;
    }

    .dropdown-item img {
      height: 16px;
      width: auto;
    }

    .alert {
      padding: 0.75rem 1rem;
      border-radius: 8px;
      margin-bottom: 1rem;
      font-size: 0.875rem;
      display: flex;
      align-items: center;
      gap: 0.5rem;
    }

    .alert-error {
      background-color: #fed7d7;
      border: 1px solid #feb2b2;
      color: #c53030;
    }

    body.dark .alert-error {
      background-color: #742a2a;
      border-color: #9b2c2c;
      color: #fc8181;
    }

    .alert-warning {
      background-color: #fef3c7;
      border: 1px solid #fcd34d;
      color: #92400e;
    }

    .mantu-logo {
      height: 20px;
      width: auto;
    }

    .form-check-input:checked {
      background-color: var(--primary-color);
      border-color: var(--primary-color);
    }

    @keyframes fadeIn {
      from { opacity: 0; transform: translateY(30px); }
      to { opacity: 1; transform: translateY(0); }
    }

    .login-card {
      animation: fadeIn 0.8s cubic-bezier(0.4, 0, 0.2, 1) 0.2s both;
    }

    body.dark .login-container {
      background: linear-gradient(-45deg, #0f1720, #1e293b, #334155, #475569);
      background-size: 400% 400%;
    }

    body.dark .login-card {
      background: rgba(30, 41, 59, 0.95);
      border: 1px solid rgba(255, 255, 255, 0.1);
    }

    body.dark .dropdown-menu {
      background: rgba(30, 41, 59, 0.95);
    }

    body.dark .dropdown-item {
      color: #e6eef7;
    }

    @media (max-width: 575px) {
      .login-card {
        max-width: 100%;
        margin: 0.5rem;
      }
      
      .login-header {
        padding: 2rem 1rem 1rem;
      }
      
      .login-body {
        padding: 2rem 1.5rem 1.5rem;
      }
      
      .logo {
        height: 70px;
      }
    }
  </style>
</head>

<body>
  <div class="login-container">
    <!-- Language Selector -->
    <div class="language-selector">
      <div class="dropdown">
        <button class="lang-btn dropdown-toggle" type="button" id="loginLangDrop" data-bs-toggle="dropdown">
          <img src="https://flagcdn.com/20x15/us.png" alt="EN" id="currentFlag">
          <span id="currentLang">EN</span>
        </button>
        <ul class="dropdown-menu">
          <li><a class="dropdown-item" href="?kc_locale=en"><img src="https://flagcdn.com/20x15/us.png" alt="EN"> English</a></li>
          <li><a class="dropdown-item" href="?kc_locale=fr"><img src="https://flagcdn.com/20x15/fr.png" alt="FR"> Français</a></li>
          <li><a class="dropdown-item" href="?kc_locale=ar"><img src="https://flagcdn.com/20x15/sa.png" alt="AR"> العربية</a></li>
        </ul>
      </div>
    </div>

    <!-- Theme Toggle -->
    <button class="theme-toggle" type="button" id="loginThemeToggle">
      <i class="bi bi-moon-fill"></i>
    </button>

    <!-- Login Card -->
    <div class="login-card">
      <div class="login-header">
        <div class="logo-container">
          <img src="https://amaris.com/wp-content/themes/amaris/dist/images/amaris-logo-pink.svg"
            alt="Amaris Consulting" class="logo">
        </div>
        <h1>Eligibility Tool</h1>
      </div>

      <div class="login-body">
        <#if message?has_content>
          <div class="alert alert-${message.type}">
            <i class="bi bi-exclamation-triangle-fill"></i>
            <span>${message.summary}</span>
          </div>
        </#if>

        <form id="kc-form-login" action="${url.loginAction}" method="post">
          <div class="form-group">
            <label for="username" class="form-label">
              <i class="bi bi-person-fill"></i>
              <span>
                <#if !realm.loginWithEmailAllowed>
                  ${msg("username")}
                <#elseif !realm.registrationEmailAsUsername>
                  ${msg("usernameOrEmail")}
                <#else>
                  ${msg("email")}
                </#if>
              </span>
            </label>
            <input 
              type="text" 
              class="form-control" 
              id="username" 
              name="username" 
              value="${(login.username!'')}" 
              <#if !usernameEditDisabled??>autofocus</#if>
              <#if usernameEditDisabled??>disabled</#if>
              autocomplete="username"
            />
          </div>

          <div class="form-group">
            <label for="password" class="form-label">
              <i class="bi bi-lock-fill"></i>
              <span>${msg("password")}</span>
            </label>
            <input 
              type="password" 
              class="form-control" 
              id="password" 
              name="password" 
              autocomplete="current-password"
            />
          </div>

          <div class="d-flex justify-content-between align-items-center mb-3">
            <#if realm.rememberMe && !usernameEditDisabled??>
              <div class="form-check">
                <input 
                  type="checkbox" 
                  class="form-check-input" 
                  id="rememberMe" 
                  name="rememberMe"
                  <#if login.rememberMe??>checked</#if>
                >
                <label class="form-check-label" for="rememberMe">
                  ${msg("rememberMe")}
                </label>
              </div>
            </#if>
            
            <#if realm.resetPasswordAllowed>
              <a href="${url.loginResetCredentialsUrl}" style="font-size: 0.875rem; text-decoration: none;">
                ${msg("doForgotPassword")}
              </a>
            </#if>
          </div>

          <button type="submit" class="btn-login" name="login">
            <i class="bi bi-box-arrow-in-right me-2"></i>
            <span>${msg("doLogIn")}</span>
          </button>

          <#if realm.password && social.providers??>
            <div class="divider">
              <span>Or continue with</span>
            </div>

            <#list social.providers as p>
              <a href="${p.loginUrl}" class="btn-sso">
                <img src="${url.resourcesPath}/img/mantu.png" alt="${p.displayName!}" class="mantu-logo">
                <span>Use your Mantu account</span>
              </a>
            </#list>
          </#if>
        </form>
      </div>
    </div>
  </div>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
  <script>
    document.addEventListener('DOMContentLoaded', () => {
      initTheme();
      updateLanguageFlag();
    });

    function updateLanguageFlag() {
      const flagUrls = {
        'en': 'https://flagcdn.com/20x15/us.png',
        'fr': 'https://flagcdn.com/20x15/fr.png',
        'ar': 'https://flagcdn.com/20x15/sa.png'
      };

      const urlParams = new URLSearchParams(window.location.search);
      const locale = urlParams.get('kc_locale') || 'en';
      const lang = locale.split('-')[0];

      const currentFlag = document.getElementById('currentFlag');
      const currentLang = document.getElementById('currentLang');
      
      if (currentFlag && flagUrls[lang]) {
        currentFlag.src = flagUrls[lang];
      }
      if (currentLang) {
        currentLang.textContent = lang.toUpperCase();
      }

      if (lang === 'ar') {
        document.body.setAttribute('dir', 'rtl');
      }
    }

    function initTheme() {
      const themeToggle = document.getElementById('loginThemeToggle');
      const themeIcon = themeToggle.querySelector('i');
      
      const isDark = localStorage.getItem('app.theme.dark') === 'true';
      if (isDark) {
        document.body.classList.add('dark');
        themeIcon.classList.remove('bi-moon-fill');
        themeIcon.classList.add('bi-sun-fill');
      }
      
      themeToggle.addEventListener('click', (e) => {
        e.preventDefault();
        
        const nowDark = document.body.classList.toggle('dark');
        localStorage.setItem('app.theme.dark', nowDark ? 'true' : 'false');
        
        if (nowDark) {
          themeIcon.classList.remove('bi-moon-fill');
          themeIcon.classList.add('bi-sun-fill');
        } else {
          themeIcon.classList.remove('bi-sun-fill');
          themeIcon.classList.add('bi-moon-fill');
        }
      });
    }
  </script>
</body>
</html>