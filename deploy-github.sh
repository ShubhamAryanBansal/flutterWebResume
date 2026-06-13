#!/bin/bash

# GitHub Pages Deployment Script
# Usage: ./deploy-github.sh

set -e

echo "🚀 Starting deployment to GitHub Pages..."
echo ""

# Check if git is initialized
if [ ! -d .git ]; then
    echo "❌ Git repository not initialized!"
    echo "Please run: git init"
    exit 1
fi

# Get GitHub username
read -p "Enter your GitHub username: " GITHUB_USERNAME

if [ -z "$GITHUB_USERNAME" ]; then
    echo "❌ GitHub username is required!"
    exit 1
fi

REPO_NAME="my_resume_web_page"
BASE_HREF="/$REPO_NAME/"

echo ""
echo "📦 Building Flutter web app..."
flutter build web --release --base-href "$BASE_HREF"

if [ $? -ne 0 ]; then
    echo "❌ Build failed!"
    exit 1
fi

echo ""
echo "✅ Build successful!"
echo ""
echo "📤 Deploying to GitHub Pages..."

# Navigate to build directory
cd build/web

# Initialize git in build directory
rm -rf .git
git init
git add .
git commit -m "Deploy: $(date '+%Y-%m-%d %H:%M:%S')"
git branch -M gh-pages

# Add remote (remove if exists)
git remote remove origin 2>/dev/null || true
git remote add origin "https://github.com/$GITHUB_USERNAME/$REPO_NAME.git"

# Push to gh-pages branch
echo ""
echo "Pushing to gh-pages branch..."
git push -f origin gh-pages

if [ $? -eq 0 ]; then
    echo ""
    echo "✅ Deployment successful!"
    echo ""
    echo "🌐 Your resume will be available at:"
    echo "   https://$GITHUB_USERNAME.github.io/$REPO_NAME/"
    echo ""
    echo "⏳ Note: It may take a few minutes for GitHub Pages to update."
    echo ""
    echo "📝 Next steps:"
    echo "   1. Go to https://github.com/$GITHUB_USERNAME/$REPO_NAME/settings/pages"
    echo "   2. Ensure 'Source' is set to 'Deploy from branch: gh-pages'"
    echo "   3. Wait a few minutes and visit your site!"
else
    echo ""
    echo "❌ Deployment failed!"
    echo "Please check your GitHub credentials and repository access."
fi

cd ../..
