# ============================
# Auto Commit & Push Script
# Local Repo: D:\ERS_Logs
# Remote Repo: GitHub (EAB_Logs)
# ============================

# Go to your local repository
Set-Location "D:\ERS_Logs"

# Verify .git exists (if not, initialize and set remote)
if (-not (Test-Path ".git")) {
    Write-Host "⚠️ .git folder not found. Initializing Git repo..." -ForegroundColor Yellow
    
    git init
    
    Write-Host "🔗 Connecting to GitHub remote repository..."
    git remote add origin "https://github.com/KalpeshMevada03062019/EAB_Logs.git"
    git branch -M main
}

# Timestamp for commit message
$timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

Write-Host "➕ Staging all changes..."
git add .

Write-Host "📝 Committing changes..."
git commit -m "Auto-update: $timestamp"

Write-Host "⬇️ Pulling latest updates from GitHub..."
git pull origin main

Write-Host "⬆️ Pushing to GitHub..."
git push origin main

Write-Host "✅ Done! Changes pushed successfully." -ForegroundColor Green