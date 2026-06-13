#!/bin/bash

# Firebase Hosting Deployment Script
# Usage: ./deploy-firebase.sh

set -e

echo "🚀 Starting deployment to Firebase Hosting..."
echo ""

# Check if Firebase CLI is installed
if ! command -v firebase &> /dev/null; then
    echo "❌ Firebase CLI not found!"
    echo "Install it with: npm install -g firebase-tools"
    exit 1
fi

# Check if user is logged in
if ! firebase projects:list &> /dev/null; then
    echo "🔐 Please login to Firebase..."
    firebase login
fi

echo "📦 Building Flutter web app..."
flutter build web --release

if [ $? -ne 0 ]; then
    echo "❌ Build failed!"
    exit 1
fi

echo ""
echo "✅ Build successful!"
echo ""

# Check if firebase.json exists
if [ ! -f firebase.json ]; then
    echo "⚙️  Initializing Firebase..."
    firebase init hosting
fi

echo "📤 Deploying to Firebase Hosting..."
firebase deploy --only hosting

if [ $? -eq 0 ]; then
    echo ""
    echo "✅ Deployment successful!"
    echo ""
    echo "🌐 Your resume is now live!"
    echo "   Run 'firebase hosting:channel:list' to see your URL"
    echo ""
else
    echo ""
    echo "❌ Deployment failed!"
fi
