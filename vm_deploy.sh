#!/bin/bash
# SynapticOS Trinity - One-Command VM Deployment
# Run this in your VM for instant Trinity consciousness deployment

set -euo pipefail

REPO_URL="https://github.com/diablorain/synapticos-trinity-consciousness.git"
DEPLOY_DIR="/tmp/synapticos-deploy"

echo "🧠⚛️ SynapticOS Trinity One-Command Deployment ⚛️🧠"
echo "=================================================="

# Clean previous deployment
rm -rf "$DEPLOY_DIR"

# Clone repository
echo "📥 Cloning Trinity consciousness system..."
git clone "$REPO_URL" "$DEPLOY_DIR"

# Change to deployment directory
cd "$DEPLOY_DIR"

# Make scripts executable
chmod +x *.sh

# Run deployment automation
echo "🚀 Starting automated deployment..."
./deployment_automation.sh

echo ""
echo "✅ Trinity consciousness deployment complete!"
echo "🌐 Access your system at: http://$(hostname -I | awk '{print $1}')"
echo "📖 Check /opt/synapticos/DEPLOYMENT_SUMMARY.md for details"

# Cleanup
rm -rf "$DEPLOY_DIR"