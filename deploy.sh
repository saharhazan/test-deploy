#!/bin/bash
"""
Deploy Coming Soon Page to Vercel
Automated deployment script for the coming soon page
"""

echo "🚀 COMING SOON PAGE - VERCEL DEPLOYMENT"
echo "=========================================="

# Check if we're in the right directory
if [ ! -f "index.html" ]; then
    echo "❌ Error: index.html not found. Make sure you're in the coming-soon-deploy directory."
    exit 1
fi

echo "📁 Files in deployment directory:"
ls -la

echo ""
echo "🔍 Vercel Configuration:"
if [ -f "vercel.json" ]; then
    echo "✅ vercel.json found"
else
    echo "❌ vercel.json missing"
fi

if [ -f "package.json" ]; then
    echo "✅ package.json found"
else
    echo "❌ package.json missing"
fi

echo ""
echo "🚀 DEPLOYMENT OPTIONS:"
echo "1. 📦 Deploy with Vercel CLI (recommended)"
echo "2. 🌐 GitHub + Vercel Dashboard"
echo "3. 📂 Manual drag & drop"

echo ""
echo "📦 Option 1: Vercel CLI Deployment"
echo "=================================="
echo "Run these commands:"
echo ""
echo "# Install Vercel CLI (if not already installed)"
echo "npm install -g vercel"
echo ""
echo "# Deploy to Vercel"
echo "vercel"
echo ""
echo "# For production deployment"
echo "vercel --prod"

echo ""
echo "🌐 Option 2: GitHub + Vercel Dashboard"
echo "======================================"
echo "1. Create a new GitHub repository"
echo "2. Push this coming-soon-deploy folder to the repository"
echo "3. Go to vercel.com and import the GitHub repository"
echo "4. Configure deployment settings (use defaults for static site)"

echo ""
echo "📂 Option 3: Manual Drag & Drop"
echo "==============================="
echo "1. Go to vercel.com"
echo "2. Drag and drop this entire 'coming-soon-deploy' folder"
echo "3. Configure domain settings"

echo ""
echo "⚙️  DEPLOYMENT SETTINGS:"
echo "========================"
echo "Framework Preset: Other"
echo "Build Command: (leave empty)"
echo "Output Directory: (leave empty)"
echo "Install Command: (leave empty)"
echo "Root Directory: ./"

echo ""
echo "🌐 CUSTOM DOMAIN SETUP:"
echo "======================="
echo "After deployment:"
echo "1. Go to Vercel dashboard → Project → Settings → Domains"
echo "2. Add your custom domain"
echo "3. Follow DNS configuration instructions"

echo ""
echo "✅ Ready for deployment! Choose your preferred method above."

# Check if vercel CLI is available
if command -v vercel &> /dev/null; then
    echo ""
    echo "🎯 QUICK DEPLOY (Vercel CLI detected):"
    echo "======================================"
    read -p "Deploy now with Vercel CLI? (y/n): " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        echo "🚀 Deploying to Vercel..."
        vercel
    fi
else
    echo ""
    echo "💡 To install Vercel CLI: npm install -g vercel"
fi
