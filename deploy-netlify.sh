#!/bin/bash

# Netlify Deployment Script
# Usage: ./deploy-netlify.sh

set -e

echo "🚀 Starting deployment to Netlify..."
echo ""

# Check if Netlify CLI is installed
if ! command -v netlify &> /dev/null; then
    echo "📦 Installing Netlify CLI..."
    npm install -g netlify-cli
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

# Check if user is logged in
if ! netlify status &> /dev/null; then
    echo "🔐 Please login to Netlify..."
    netlify login
fi

echo "📤 Deploying to Netlify..."
netlify deploy --prod --dir=build/web

if [ $? -eq 0 ]; then
    echo ""
    echo "✅ Deployment successful!"
    echo ""
    echo "🌐 Your resume is now live!"
    echo "   Run 'netlify status' to see your URL"
    echo ""
else
    echo ""
    echo "❌ Deployment failed!"
fi
