# Deployment Guide - Resume Web Page

This guide will help you deploy your Flutter resume web page and get a shareable link.

## Quick Start - Recommended Options

### Option 1: GitHub Pages (FREE & Easy)
**Best for: Quick deployment with custom domain support**

#### Steps:

1. **Build your Flutter web app:**
   ```bash
   flutter build web --release --base-href "/my_resume_web_page/"
   ```

2. **Create a GitHub repository:**
   - Go to https://github.com/new
   - Name it: `my_resume_web_page`
   - Make it public
   - Don't initialize with README

3. **Push your code:**
   ```bash
   git init
   git add .
   git commit -m "Initial commit - Resume web page"
   git branch -M main
   git remote add origin https://github.com/YOUR_USERNAME/my_resume_web_page.git
   git push -u origin main
   ```

4. **Deploy to GitHub Pages:**
   ```bash
   # Install gh-pages (if not already installed)
   npm install -g gh-pages
   
   # Deploy the build/web folder
   cd build/web
   git init
   git add .
   git commit -m "Deploy"
   git branch -M gh-pages
   git remote add origin https://github.com/YOUR_USERNAME/my_resume_web_page.git
   git push -f origin gh-pages
   ```

5. **Enable GitHub Pages:**
   - Go to your repository settings
   - Scroll to "Pages" section
   - Source: Deploy from branch `gh-pages`
   - Click Save

6. **Your site will be live at:**
   ```
   https://YOUR_USERNAME.github.io/my_resume_web_page/
   ```

---

### Option 2: Firebase Hosting (FREE & Fast)
**Best for: Professional hosting with custom domain**

#### Steps:

1. **Install Firebase CLI:**
   ```bash
   npm install -g firebase-tools
   ```

2. **Login to Firebase:**
   ```bash
   firebase login
   ```

3. **Initialize Firebase in your project:**
   ```bash
   firebase init hosting
   ```
   - Select "Create a new project" or use existing
   - Public directory: `build/web`
   - Configure as single-page app: Yes
   - Set up automatic builds: No

4. **Build your app:**
   ```bash
   flutter build web --release
   ```

5. **Deploy:**
   ```bash
   firebase deploy
   ```

6. **Your site will be live at:**
   ```
   https://YOUR_PROJECT_ID.web.app
   ```

---

### Option 3: Netlify (FREE & Easiest)
**Best for: Drag-and-drop deployment**

#### Steps:

1. **Build your app:**
   ```bash
   flutter build web --release
   ```

2. **Go to Netlify:**
   - Visit https://app.netlify.com/drop
   - Drag and drop the `build/web` folder
   - Done! You'll get a link instantly

3. **Your site will be live at:**
   ```
   https://random-name-12345.netlify.app
   ```

4. **Optional - Custom domain:**
   - Go to Site settings > Domain management
   - Add custom domain or change site name

---

### Option 4: Vercel (FREE & Fast)
**Best for: Automatic deployments from GitHub**

#### Steps:

1. **Build your app:**
   ```bash
   flutter build web --release
   ```

2. **Install Vercel CLI:**
   ```bash
   npm install -g vercel
   ```

3. **Deploy:**
   ```bash
   cd build/web
   vercel
   ```

4. **Follow the prompts:**
   - Login with GitHub/Email
   - Set up and deploy

5. **Your site will be live at:**
   ```
   https://your-project.vercel.app
   ```

---

## Automated Deployment Script

I'll create a script to make deployment easier:

### For GitHub Pages:
```bash
#!/bin/bash
# deploy-github.sh

echo "Building Flutter web app..."
flutter build web --release --base-href "/my_resume_web_page/"

echo "Deploying to GitHub Pages..."
cd build/web
git init
git add .
git commit -m "Deploy $(date)"
git branch -M gh-pages
git remote add origin https://github.com/YOUR_USERNAME/my_resume_web_page.git
git push -f origin gh-pages

echo "Deployed! Visit: https://YOUR_USERNAME.github.io/my_resume_web_page/"
```

### For Firebase:
```bash
#!/bin/bash
# deploy-firebase.sh

echo "Building Flutter web app..."
flutter build web --release

echo "Deploying to Firebase..."
firebase deploy

echo "Deployed! Check your Firebase console for the URL"
```

---

## Custom Domain Setup

### For GitHub Pages:
1. Buy a domain (e.g., from Namecheap, GoDaddy)
2. Add a `CNAME` file in `build/web` with your domain
3. Configure DNS:
   - Add CNAME record: `www` → `YOUR_USERNAME.github.io`
   - Add A records for apex domain to GitHub IPs

### For Firebase/Netlify/Vercel:
- Go to domain settings in the platform
- Follow their custom domain setup wizard
- Update DNS records as instructed

---

## Recommended: GitHub Pages

**Why?**
- ✅ Completely free
- ✅ Easy to update (just push to gh-pages branch)
- ✅ Custom domain support
- ✅ HTTPS by default
- ✅ Good for portfolio/resume sites

**Your final URL will be:**
```
https://shubhamaryanbansal.github.io/my_resume_web_page/
```

Or with custom domain:
```
https://shubhambansal.dev
```

---

## Quick Commands Reference

```bash
# Build for web
flutter build web --release

# Build with base href (for GitHub Pages)
flutter build web --release --base-href "/my_resume_web_page/"

# Test locally before deploying
flutter run -d chrome

# Check build output
ls -la build/web
```

---

## Troubleshooting

### Issue: Assets not loading
**Solution:** Make sure you built with correct base-href:
```bash
flutter build web --release --base-href "/REPO_NAME/"
```

### Issue: Blank page after deployment
**Solution:** Check browser console for errors. Usually a base-href issue.

### Issue: Images not showing
**Solution:** Verify assets are in pubspec.yaml and rebuild:
```bash
flutter clean
flutter pub get
flutter build web --release
```

---

## Next Steps

1. Choose a hosting platform (I recommend GitHub Pages for simplicity)
2. Follow the steps above
3. Get your shareable link
4. Add it to your LinkedIn profile
5. Share with recruiters!

Let me know which option you'd like to use, and I can help you set it up!
