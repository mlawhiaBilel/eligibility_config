<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Amaris - Login</title>

  <!-- Bootstrap + Icons -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">

  <style>
    /* ======= Styles (copiés et affinés depuis login.html original) ======= */
    :root {
      --primary-color: #2a2c7c;
      --secondary-color: #1a1c5c;
      --accent-color: #2a2c7c;
      --light-color: #ffffff;
      --dark-color: #071224;
      --transition: 220ms ease;
    }

    html, body { height: 100%; }

    body {
      margin: 0;
      font-family: Inter, system-ui, "Segoe UI", Roboto, Arial, sans-serif;
      background: var(--light-color);
      color: #111;
      transition: background-color var(--transition), color var(--transition);
    }

    body.dark {
      background: var(--dark-color);
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
      top: 0; left: 0; right: 0; bottom: 0;
      background:
        radial-gradient(circle at 20% 80%, rgba(120,119,198,0.3) 0%, transparent 50%),
        radial-gradient(circle at 80% 20%, rgba(255,119,198,0.2) 0%, transparent 50%),
        radial-gradient(circle at 40% 40%, rgba(120,219,255,0.15) 0%, transparent 50%);
      animation: float 20s ease-in-out infinite;
      pointer-events: none;
    }

    @keyframes float {
      0%, 100% { transform: translateY(0px) rotate(0deg); }
      33% { transform: translateY(-20px) rotate(120deg); }
      66% { transform: translateY(20px) rotate(240deg); }
    }

    .login-card {
      background: rgba(255,255,255,0.95);
      backdrop-filter: blur(10px);
      border-radius: 20px;
      box-shadow: 0 20px 40px rgba(0,0,0,0.1);
      overflow: hidden;
      width: 100%;
      max-width: 440px;
      transition: all 0.4s cubic-bezier(0.4,0,0.2,1);
      border: 1px solid rgba(255,255,255,0.3);
      animation: fadeIn 0.8s cubic-bezier(0.4,0,0.2,1) 0.2s both;
    }

    .login-card:hover {
      transform: translateY(-8px) scale(1.02);
      box-shadow: 0 30px 60px rgba(0,0,0,0.15);
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
      top: -50%; left: -50%;
      width: 200%; height: 200%;
      background: linear-gradient(45deg, transparent, rgba(255,255,255,0.1), transparent);
      transform: rotate(45deg);
      animation: shine 3s ease-in-out infinite;
    }
    @keyframes shine {
      0%, 100% { transform: rotate(45deg) translateX(-100%); }
      50% { transform: rotate(45deg) translateX(100%); }
    }

    .logo-container { margin-bottom: 1.5rem; display:flex; justify-content:center; align-items:center; z-index:2; }
    .logo { height: 80px; width: auto; object-fit: contain; filter: drop-shadow(0 4px 8px rgba(0,0,0,0.2)); transition: all .3s; }
    .login-header h1 { font-size: 1.75rem; margin:0; font-weight:600; letter-spacing:.5px; z-index:2; text-shadow: 0 2px 4px rgba(0,0,0,0.3); }

    .login-body { padding: 2.5rem 2rem 2rem; }
    .form-group { margin-bottom: 1.5rem; position:relative; }
    .form-label { font-weight:500; margin-bottom:.5rem; display:flex; align-items:center; gap:.5rem; color:#495057; transition: color var(--transition); }
    body.dark .form-label { color: #cbd5e1; }

    .form-control {
      padding: .75rem 1rem; border-radius:8px; border:1px solid #ddd; transition: all var(--transition);
      font-size:1rem; background: rgba(255,255,255,0.9); width:100%;
    }
    .form-control:focus { border-color: var(--accent-color); box-shadow: 0 0 0 3px rgba(42,44,124,0.2); outline:none; }

    body.dark .form-control { background: rgba(45,55,72,0.9); border-color:#4a5568; color:#e6eef7; }

    .btn-login {
      background: linear-gradient(135deg, var(--primary-color) 0%, var(--secondary-color) 100%);
      border: none; color:white; padding:1rem 2rem; border-radius:12px; font-weight:600; font-size:1.1rem; width:100%;
      transition: all .3s; margin-top:.5rem; cursor:pointer;
    }
    .btn-login:hover { transform: translateY(-3px); box-shadow: 0 15px 30px rgba(42,44,124,0.4); }

    .btn-sso {
      background: #2a2c7c; border:1px solid #1a1c5c; color:white; padding:.75rem 1.5rem; border-radius:8px; font-weight:500;
      width:100%; transition: all var(--transition); display:flex; align-items:center; justify-content:center; gap:.75rem; margin-top:1rem; text-decoration:none;
    }
    .btn-sso img { height:20px; width:auto; }

    .divider { display:flex; align-items:center; margin:1.5rem 0; color:#6b7280; font-size:.875rem; }
    .divider::before, .divider::after { content:""; flex:1; border-bottom:1px solid #e5e7eb; }
    .divider span { padding:0 1rem; background: rgba(255,255,255,0.9); border-radius:20px; }

    .theme-toggle { position:absolute; bottom:1.5rem; left:1.5rem; background: rgba(255,255,255,0.25); border:2px solid rgba(255,255,255,0.3); color:white; border-radius:50%; width:50px; height:50px; display:flex; align-items:center; justify-content:center; cursor:pointer; z-index:10; backdrop-filter: blur(10px); font-size:1.2rem; }
    .language-selector { position:absolute; top:1.5rem; right:1.5rem; z-index:10; }

    .dropdown-menu { min-width:160px; background: rgba(255,255,255,0.95); backdrop-filter: blur(20px); border-radius:12px; box-shadow:0 20px 40px rgba(0,0,0,0.15); overflow:hidden; }
    .dropdown-item { display:flex; align-items:center; gap:.75rem; padding:.75rem 1rem; transition: all .2s ease; cursor:pointer; color:#333; }
    .dropdown-item:hover { background: linear-gradient(135deg, var(--primary-color), var(--secondary-color)); color:white; }
    .dropdown-item img { height:16px; width:auto; border-radius:2px; }

    @keyframes fadeIn { from{opacity:0; transform:translateY(30px) scale(.98);} to{opacity:1; transform:translateY(0) scale(1);} }

    /* Dark specifics */
    body.dark .login-container { background: linear-gradient(-45deg, #0f1720, #1e293b, #334155, #475569); background-size:400% 400%; }
    body.dark .login-card { background: rgba(30,41,59,0.95); border:1px solid rgba(255,255,255,0.1); }
    body.dark .dropdown-menu { background: rgba(30,41,59,0.95); border:1px solid rgba(255,255,255,0.1); }
    body.dark .dropdown-item { color: #e6eef7; }

    /* RTL support */
    body[dir="rtl"] .form-label { justify-content:flex-end; }
    body[dir="rtl"] .d-flex.justify-content-between { flex-direction:row-reverse; }
    body[dir="rtl"] .dropdown-menu { text-align:right; }
  </style>
</head>

<body>
  <div class="login-container">
    <!-- Language Selector -->
    <div class="language-selector">
      <div class="dropdown">
        <button class="btn lang-btn dropdown-toggle" id="loginLangDrop" data-bs-toggle="dropdown" aria-expanded="false">
          <img src="https://flagcdn.com/20x15/us.png" alt="EN" id="currentFlag" style="height:14px;margin-right:.5rem;">
          <span id="currentLang">EN</span>
        </button>
        <ul class="dropdown-menu" aria-labelledby="loginLangDrop">
          <li><a class="dropdown-item" href="#" data-lang="en"><img src="https://flagcdn.com/20x15/us.png"> English</a></li>
          <li><a class="dropdown-item" href="#" data-lang="fr"><img src="https://flagcdn.com/20x15/fr.png"> Français</a></li>
          <li><a class="dropdown-item" href="#" data-lang="ar"><img src="https://flagcdn.com/20x15/sa.png"> العربية</a></li>
        </ul>
      </div>
    </div>

    <!-- Theme Toggle -->
    <button class="theme-toggle" id="loginThemeToggle" aria-label="Toggle theme"><i class="bi bi-moon-fill"></i></button>

    <!-- Login Card -->
    <div class="login-card">
      <div class="login-header">
        <div class="logo-container">
          <img src="https://amaris.com/wp-content/themes/amaris/dist/images/amaris-logo-pink.svg" alt="Amaris" class="logo">
        </div>
        <h1 id="pageTitle">Eligibility Tool</h1>
      </div>

      <div class="login-body">
        <#if message?has_content>
          <div class="alert alert-${message.type}">
            <i class="bi bi-exclamation-triangle-fill me-2"></i>
            <span>${message.summary}</span>
          </div>
        </#if>

        <form id="kc-form-login" action="${url.loginAction}" method="post">
          <div class="form-group">
            <label for="username" class="form-label">
              <i class="bi bi-person-fill"></i>
              <span id="lblUsername">
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
              id="username"
              name="username"
              class="form-control"
              value="${(login.username!'')}"
              <#if !usernameEditDisabled??>autofocus</#if>
              <#if usernameEditDisabled??>disabled</#if>
              autocomplete="username"
            />
          </div>

          <div class="form-group">
            <label for="password" class="form-label">
              <i class="bi bi-lock-fill"></i>
              <span id="lblPassword">${msg("password")}</span>
            </label>
            <input
              type="password"
              id="password"
              name="password"
              class="form-control"
              autocomplete="current-password"
            />
          </div>

          <div class="d-flex justify-content-between align-items-center mb-3">
            <#if realm.rememberMe && !usernameEditDisabled??>
              <div class="form-check">
                <input
                  class="form-check-input"
                  type="checkbox"
                  id="rememberMe"
                  name="rememberMe"
                  <#if login.rememberMe??>checked</#if>
                />
                <label class="form-check-label" id="lblRemember" for="rememberMe">${msg("rememberMe")}</label>
              </div>
            </#if>

            <#if realm.resetPasswordAllowed>
              <a id="forgotLink" href="${url.loginResetCredentialsUrl}" style="font-size:.875rem; text-decoration:none;">${msg("doForgotPassword")}</a>
            </#if>
          </div>

          <button type="submit" class="btn-login" name="login">
            <i class="bi bi-box-arrow-in-right me-2"></i>
            <span id="lblLogin">${msg("doLogIn")}</span>
          </button>

          <!-- Divider + SSO buttons -->
          <div class="divider"><span id="lblOr">Or continue with</span></div>

          <!-- If social.providers present, list them. Otherwise, show a visible fallback SSO button. -->
          <#if social.providers?? && (social.providers?size > 0)>
            <#list social.providers as p>
              <a href="${p.loginUrl}" class="btn-sso" title="${p.displayName!}">
                <img src="${url.resourcesPath}/img/mantu.png" alt="${p.displayName!}"> 
                <span>${p.displayName!} — <span id="lblSSO">Use your Mantu account</span></span>
              </a>
            </#list>
          <#else>
            <!-- Fallback visible SSO button (useful during dev / if providers not configured) -->
            <a class="btn-sso" href="#" id="fallbackSSO">
              <img src="${url.resourcesPath}/img/mantu.png" alt="Mantu">
              <span id="lblSSOFallback">Use your Mantu account</span>
            </a>
          </#if>
        </form>
      </div>
    </div>
  </div>

  <!-- Bootstrap bundle -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

  <script>
    // ===== Translations used for dynamic labels/placeholders =====
    const loginI18n = {
      en: {
        title: "Eligibility Tool",
        usernameLabel: (realm) => {
          // We keep Keycloak-provided label text where possible
          return document.getElementById('lblUsername').textContent || "Username or Email";
        },
        usernamePlaceholder: "Enter your username or email",
        password: "Password",
        passwordPlaceholder: "Enter your password",
        remember: "Remember me",
        forgot: "Forgot password?",
        signin: "Sign In",
        or: "Or continue with",
        mantuSignIn: "Use your Mantu account"
      },
      fr: {
        title: "Outil d'Éligibilité",
        usernameLabel: (realm) => document.getElementById('lblUsername').textContent || "Nom d'utilisateur ou Email",
        usernamePlaceholder: "Entrez votre nom d'utilisateur ou email",
        password: "Mot de passe",
        passwordPlaceholder: "Entrez votre mot de passe",
        remember: "Se souvenir de moi",
        forgot: "Mot de passe oublié ?",
        signin: "Se connecter",
        or: "Ou continuer avec",
        mantuSignIn: "Utiliser votre compte Mantu"
      },
      ar: {
        title: "أداة الأهلية",
        usernameLabel: (realm) => document.getElementById('lblUsername').textContent || "اسم المستخدم أو البريد الإلكتروني",
        usernamePlaceholder: "أدخل اسم المستخدم أو البريد الإلكتروني",
        password: "كلمة المرور",
        passwordPlaceholder: "أدخل كلمة المرور",
        remember: "تذكرني",
        forgot: "نسيت كلمة المرور؟",
        signin: "تسجيل الدخول",
        or: "أو المتابعة باستخدام",
        mantuSignIn: "استخدم حسابك في Mantu"
      }
    };

    const flags = {
      en: "https://flagcdn.com/20x15/us.png",
      fr: "https://flagcdn.com/20x15/fr.png",
      ar: "https://flagcdn.com/20x15/sa.png"
    };

    // Initialize on DOM loaded
    document.addEventListener('DOMContentLoaded', () => {
      initTheme();
      initLanguage();
      wireFallbackSSO();
    });

    // ===== THEME (dark) =====
    function initTheme() {
      const themeToggle = document.getElementById('loginThemeToggle');
      const themeIcon = themeToggle.querySelector('i');
      const saved = localStorage.getItem('app.theme.dark') === 'true';

      if (saved) {
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

    // ===== LANGUAGE =====
    function initLanguage() {
      // If Keycloak passed kc_locale in URL, use it; else fallback to saved or 'en'
      const urlParams = new URLSearchParams(window.location.search);
      const kcLocale = (urlParams.get('kc_locale') || '').split('-')[0];
      const saved = localStorage.getItem('app.lang');
      const initial = kcLocale || saved || 'en';

      applyLanguage(initial);

      // wire dropdown items (they are regular anchors with data-lang)
      const items = document.querySelectorAll('.dropdown-item');
      items.forEach(item => {
        const lang = item.getAttribute('data-lang') || (item.textContent || '').trim().slice(0,2).toLowerCase();
        // add attribute if missing (keeps compatibility)
        if (!item.hasAttribute('data-lang')) item.setAttribute('data-lang', lang);

        item.addEventListener('click', (ev) => {
          ev.preventDefault();
          const chosen = item.getAttribute('data-lang');
          localStorage.setItem('app.lang', chosen);
          applyLanguage(chosen);
        });
      });
    }

    function applyLanguage(lang) {
      const t = loginI18n[lang] || loginI18n.en;

      // Title
      const titleEl = document.getElementById('pageTitle');
      if (titleEl) titleEl.textContent = t.title;

      // Labels (username may be rendered by Keycloak messages; we keep them but override placeholders)
      const lblUsername = document.getElementById('lblUsername');
      if (lblUsername) {
        // If Keycloak message exists, don't fully override text that might include variables; we prefer i18n fallback
        lblUsername.textContent = (lang === 'fr' ? "Nom d'utilisateur ou Email" : (lang === 'ar' ? "اسم المستخدم أو البريد الإلكتروني" : "Username or Email"));
      }

      const lblPassword = document.getElementById('lblPassword');
      if (lblPassword) lblPassword.textContent = (lang === 'fr' ? "Mot de passe" : (lang === 'ar' ? "كلمة المرور" : "Password"));

      const lblRemember = document.getElementById('lblRemember');
      if (lblRemember) lblRemember.textContent = (lang === 'fr' ? "Se souvenir de moi" : (lang === 'ar' ? "تذكرني" : "Remember me"));

      const forgotLink = document.getElementById('forgotLink');
      if (forgotLink) forgotLink.textContent = (lang === 'fr' ? "Mot de passe oublié ?" : (lang === 'ar' ? "نسيت كلمة المرور؟" : "Forgot password?"));

      const loginBtnText = document.getElementById('lblLogin');
      if (loginBtnText) loginBtnText.textContent = (lang === 'fr' ? "Se connecter" : (lang === 'ar' ? "تسجيل الدخول" : "Sign In"));

      const orText = document.getElementById('lblOr');
      if (orText) orText.textContent = (lang === 'fr' ? "Ou continuer avec" : (lang === 'ar' ? "أو المتابعة باستخدام" : "Or continue with"));

      const ssoSpan = document.getElementById('lblSSO');
      if (ssoSpan) ssoSpan.textContent = (lang === 'fr' ? "Utiliser votre compte Mantu" : (lang === 'ar' ? "استخدم حسابك في Mantu" : "Use your Mantu account"));

      const ssoFallback = document.getElementById('lblSSOFallback');
      if (ssoFallback) ssoFallback.textContent = ssoSpan ? ssoSpan.textContent : (lang === 'fr' ? "Utiliser votre compte Mantu" : (lang === 'ar' ? "استخدم حسابك في Mantu" : "Use your Mantu account"));

      // placeholders
      const usernameInput = document.getElementById('username');
      const passwordInput = document.getElementById('password');
      if (usernameInput) usernameInput.placeholder = (lang === 'fr' ? "Entrez votre nom d'utilisateur ou email" : (lang === 'ar' ? "أدخل اسم المستخدم أو البريد الإلكتروني" : "Enter your username or email"));
      if (passwordInput) passwordInput.placeholder = (lang === 'fr' ? "Entrez votre mot de passe" : (lang === 'ar' ? "أدخل كلمة المرور" : "Enter your password"));

      // flag + code
      const flag = document.getElementById('currentFlag');
      const langCode = document.getElementById('currentLang');
      if (flag && lang && (lang in {en:1,fr:1,ar:1})) flag.src = (lang === 'fr' ? 'https://flagcdn.com/20x15/fr.png' : (lang === 'ar' ? 'https://flagcdn.com/20x15/sa.png' : 'https://flagcdn.com/20x15/us.png'));
      if (langCode) langCode.textContent = (lang || 'en').toUpperCase();

      // dir (rtl for arabic)
      document.body.setAttribute('dir', lang === 'ar' ? 'rtl' : 'ltr');
    }

    // ===== Fallback SSO behavior for dev/testing (non-blocking) =====
    function wireFallbackSSO() {
      const fallback = document.getElementById('fallbackSSO');
      if (!fallback) return;
      fallback.addEventListener('click', (e) => {
        e.preventDefault();
        // display small alert to user (client-side) — Keycloak will handle real SSO
        const orig = fallback.innerHTML;
        fallback.innerHTML = '<i class="bi bi-arrow-repeat spinner"></i> Redirecting...';
        fallback.disabled = true;
        setTimeout(() => {
          fallback.innerHTML = orig;
          fallback.disabled = false;
        }, 1200);
      });
    }

    // Ensure initial language respects URL kc_locale if present
    (function ensureInitialLangFromUrl() {
      const urlParams = new URLSearchParams(window.location.search);
      const kc = urlParams.get('kc_locale');
      if (kc && !localStorage.getItem('app.lang')) {
        localStorage.setItem('app.lang', kc.split('-')[0]);
      }
      // If no saved lang, default to 'en'
      if (!localStorage.getItem('app.lang')) localStorage.setItem('app.lang', 'en');
    })();
  </script>
</body>
</html>
