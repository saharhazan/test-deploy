#!/bin/bash

# 🚀 GitHub Upload Script for Coming Soon Page
# This script will help you connect your local repository to GitHub and push the code

echo "🚀 Prompt-to-Automation Coming Soon Page - GitHub Upload"
echo "========================================================="
echo ""

# Check if we're in the right directory
if [ ! -f "index.html" ] || [ ! -f "package.json" ]; then
    echo "❌ Error: Please run this script from the coming-soon-deploy directory"
    echo "Usage: cd coming-soon-deploy && ./github_upload.sh"
    exit 1
fi

echo "✅ Found deployment files in current directory"
echo ""

# Get GitHub repository URL from user
echo "📝 Please provide your GitHub repository details:"
echo ""
read -p "Enter your GitHub username: " username
read -p "Enter repository name (default: prompt-automation-coming-soon): " repo_name

# Set default repo name if not provided
if [ -z "$repo_name" ]; then
    repo_name="prompt-automation-coming-soon"
fi

# Construct GitHub URL
github_url="https://github.com/$username/$repo_name.git"

echo ""
echo "🔗 GitHub Repository URL: $github_url"
echo ""

# Confirm before proceeding
read -p "Is this correct? (y/n): " confirm
if [ "$confirm" != "y" ] && [ "$confirm" != "Y" ]; then
    echo "❌ Aborted. Please run the script again with correct information."
    exit 1
fi

echo ""
echo "🔄 Setting up GitHub remote..."

# Check if remote already exists
if git remote get-url origin &> /dev/null; then
    echo "⚠️  Remote 'origin' already exists. Updating..."
    git remote set-url origin "$github_url"
else
    echo "➕ Adding remote 'origin'..."
    git remote add origin "$github_url"
fi

echo ""
echo "📤 Pushing to GitHub..."

# Push to GitHub
if git push -u origin main; then
    echo ""
    echo "🎉 SUCCESS! Your coming soon page has been uploaded to GitHub!"
    echo ""
    echo "📋 Next Steps:"
    echo "1. Visit: https://github.com/$username/$repo_name"
    echo "2. Verify all files are uploaded correctly"
    echo "3. Deploy to Vercel:"
    echo "   - Go to vercel.com"
    echo "   - Import your GitHub repository"
    echo "   - Deploy as a static site"
    echo ""
    echo "🌐 Your repository: https://github.com/$username/$repo_name"
    echo ""
else
    echo ""
    echo "❌ Error occurred during push. Please check:"
    echo "1. GitHub repository exists and is accessible"
    echo "2. You have push permissions"
    echo "3. Your GitHub credentials are correct"
    echo ""
    echo "🔧 Manual commands to try:"
    echo "git remote -v"
    echo "git push -u origin main"
fi
