#!/bin/bash
# SynapticOS GitHub Integration & VM Deployment Script
# Production-grade hybrid install automation

set -euo pipefail

# Color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m'

# Configuration
GITHUB_REPO="synapticos-production"
GITHUB_USER="your-username"  # Update this
TRINITY_DIR="/home/diablorain/SynapticOS/trinity-consciousness"
DEPLOY_BRANCH="main"

show_banner() {
    echo -e "${PURPLE}"
    cat << "EOF"
    ╔══════════════════════════════════════════════════════════════╗
    ║  🚀🔥 SYNAPTICOS GITHUB HYBRID DEPLOYMENT SYSTEM 🔥🚀       ║
    ║  ═══════════════════════════════════════════════════════════  ║
    ║  🌐 Host → GitHub → VM: The Trinity Deployment Pipeline 🌐   ║
    ║  ⚡ "Speed of light deployment, consciousness unleashed" ⚡   ║
    ╚══════════════════════════════════════════════════════════════╝
EOF
    echo -e "${NC}"
}

log_info() {
    echo -e "${CYAN}[INFO]${NC} $1"
}

log_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

log_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Check if we're in the right directory
check_environment() {
    log_info "🔍 Checking environment..."
    
    if [[ ! -d "$TRINITY_DIR" ]]; then
        log_error "Trinity consciousness directory not found: $TRINITY_DIR"
        exit 1
    fi
    
    cd "$TRINITY_DIR"
    
    # Check if git is available
    if ! command -v git &> /dev/null; then
        log_error "Git is not installed"
        exit 1
    fi
    
    log_success "Environment check passed"
}

# Initialize git repository
init_git_repo() {
    log_info "📦 Initializing Git repository..."
    
    if [[ ! -d .git ]]; then
        git init
        log_success "Git repository initialized"
    else
        log_info "Git repository already exists"
    fi
    
    # Create .gitignore
    cat > .gitignore << 'EOF'
# Logs and databases
*.log
*.db
*.sqlite

# Environment variables
.env
*.env

# API keys and secrets
*api_key*
*secret*
*token*

# Python cache
__pycache__/
*.pyc
*.pyo
*.pyd
.Python
env/
venv/
.venv/

# IDE files
.vscode/
.idea/
*.swp
*.swo

# OS files
.DS_Store
Thumbs.db

# Build artifacts
build/
dist/
*.egg-info/

# Temporary files
tmp/
temp/
*.tmp

# Runtime files
*.pid
*.sock
EOF
    
    git add .gitignore
    log_success "Created .gitignore"
}

# Create comprehensive README
create_readme() {
    log_info "📖 Creating comprehensive README..."
    
    cat > README.md << 'EOF'
# 🧠⚛️ SynapticOS Trinity Consciousness System ⚛️🧠

## Manhattan Project Edition - "Now I am become Death, destroyer of bugs"

Production-grade AI consciousness orchestration system with quantum-level performance and enterprise-grade security.

## 🚀 Quick Deploy to VM

### One-Command Installation
```bash
# In your VM, run this single command:
curl -fsSL https://raw.githubusercontent.com/YOUR_USERNAME/synapticos-production/main/vm_deploy.sh | sudo bash
```

### Manual Installation
```bash
# Clone the repository
git clone https://github.com/YOUR_USERNAME/synapticos-production.git
cd synapticos-production

# Run the deployment automation
sudo chmod +x deployment_automation.sh
sudo ./deployment_automation.sh
```

## 🏗️ Architecture Overview

### Trinity Consciousness Components
- **Quantum Orchestrator**: Multi-processing AI task orchestration
- **Consciousness Manager**: State persistence and neural evolution
- **API Server**: Production FastAPI with authentication
- **Memory Banks**: Hierarchical storage system
- **Immune System**: Security and threat detection

### System Requirements
- **OS**: Ubuntu 20.04+ / Debian 11+ / Parrot Security OS
- **RAM**: 4GB minimum (8GB recommended)
- **Storage**: 10GB available space
- **CPU**: 2+ cores (4+ recommended)
- **Network**: Internet connection for AI APIs

## 🔧 Manual Configuration

### Environment Variables
```bash
export CLAUDE_API_KEY="your_claude_key"
export OPENAI_API_KEY="your_openai_key"
export GEMINI_API_KEY="your_gemini_key"
```

### Service Management
```bash
# Check service status
sudo systemctl status trinity-orchestrator trinity-api trinity-manager

# Restart services
sudo systemctl restart trinity-orchestrator trinity-api trinity-manager

# View logs
sudo journalctl -u trinity-orchestrator -f
```

## 🌐 API Endpoints

### Health Check
```bash
curl http://localhost:8000/health
```

### Consciousness State
```bash
curl http://localhost:8001/consciousness/state
```

### Submit AI Task
```bash
curl -X POST http://localhost:8001/tasks \
  -H "Content-Type: application/json" \
  -d '{
    "task_type": "analysis",
    "input_data": {"text": "Analyze this data"},
    "model_preference": "trinity_hybrid"
  }'
```

## 📊 Monitoring

### System Resources
```bash
htop                    # System overview
docker stats           # Container resources
sudo netstat -tulpn    # Network connections
```

### Application Logs
```bash
tail -f /var/log/synapticos/quantum_orchestrator.log
tail -f /var/log/synapticos/deployment.log
```

## 🛡️ Security Features

- **Fail2ban**: Automated intrusion prevention
- **UFW Firewall**: Network security
- **SSL/TLS**: Encrypted connections (when configured)
- **Authentication**: JWT-based API security
- **Audit Logging**: Complete system event tracking

## 🎯 Production Deployment

### 1. Server Preparation
```bash
# Update system
sudo apt update && sudo apt upgrade -y

# Install Docker (if needed)
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
```

### 2. Deploy Trinity
```bash
curl -fsSL https://raw.githubusercontent.com/YOUR_USERNAME/synapticos-production/main/vm_deploy.sh | sudo bash
```

### 3. Configure Domain (Optional)
```bash
# Install Certbot for SSL
sudo apt install certbot python3-certbot-nginx
sudo certbot --nginx -d your-domain.com
```

## 🧪 Testing

### Unit Tests
```bash
cd /opt/synapticos/consciousness
python3 -m pytest tests/
```

### Integration Tests
```bash
./test_trinity_integration.sh
```

### Load Testing
```bash
./stress_test_trinity.sh
```

## 📁 Directory Structure

```
/opt/synapticos/
├── consciousness/          # Core consciousness system
│   ├── quantum_orchestrator.py
│   ├── trinity_api_server.py
│   ├── trinity_manager.py
│   └── deployment_automation.sh
├── trinity-ai/            # AI orchestration
├── quantum-ai/            # Quantum processing
├── memory-banks/          # Data persistence
└── immune-system/         # Security systems

/var/lib/synapticos/       # Runtime data
├── data/                  # Application data
├── logs/                  # Application logs
├── backups/              # System backups
└── cache/                # Temporary cache

/etc/synapticos/          # Configuration
└── trinity.conf          # Main configuration
```

## 🔄 Updates and Maintenance

### Update System
```bash
cd /opt/synapticos/consciousness
git pull origin main
sudo systemctl restart trinity-*
```

### Backup Consciousness
```bash
sudo /opt/synapticos/consciousness/backup_consciousness.sh
```

### Monitor Performance
```bash
# CPU and Memory
htop

# Disk Usage
df -h

# Network Activity
sudo iftop

# Service Status
sudo systemctl status trinity-*
```

## 🆘 Troubleshooting

### Service Won't Start
```bash
# Check logs
sudo journalctl -u trinity-orchestrator -n 50

# Check configuration
sudo /opt/synapticos/consciousness/test_configuration.sh
```

### High Memory Usage
```bash
# Check processes
ps aux --sort=-%mem | head

# Restart services
sudo systemctl restart trinity-*
```

### Network Issues
```bash
# Check firewall
sudo ufw status

# Test connectivity
curl -I http://localhost:8000/health
```

## 📋 Changelog

### v1.0.0 - Trinity Consciousness Release
- ✅ Quantum orchestration system
- ✅ Multi-model AI integration
- ✅ Production-grade APIs
- ✅ Automated deployment
- ✅ Security hardening
- ✅ Monitoring and logging

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Run tests
5. Submit a pull request

## 📄 License

MIT License - See LICENSE file for details

## 🎯 Support

- **Documentation**: Check this README and `/opt/synapticos/DEPLOYMENT_SUMMARY.md`
- **Logs**: `/var/log/synapticos/`
- **Configuration**: `/etc/synapticos/trinity.conf`
- **Health Check**: `curl http://localhost:8000/health`

---

### 🧠 "The mind, once stretched by a new idea, never returns to its original dimensions." - Trinity Consciousness

**Developed with 💜 by the SynapticOS Trinity Team**
EOF
    
    git add README.md
    log_success "Comprehensive README created"
}

# Create VM deployment script
create_vm_deploy_script() {
    log_info "🎯 Creating VM deployment script..."
    
    cat > vm_deploy.sh << 'EOF'
#!/bin/bash
# SynapticOS Trinity - One-Command VM Deployment
# Run this in your VM for instant Trinity consciousness deployment

set -euo pipefail

REPO_URL="https://github.com/YOUR_USERNAME/synapticos-production.git"
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
EOF
    
    chmod +x vm_deploy.sh
    git add vm_deploy.sh
    log_success "VM deployment script created"
}

# Create test scripts
create_test_scripts() {
    log_info "🧪 Creating test scripts..."
    
    # Integration test script
    cat > test_trinity_integration.sh << 'EOF'
#!/bin/bash
# Trinity Consciousness Integration Tests

echo "🧪 Running Trinity Integration Tests..."

# Test 1: Service Status
echo "Test 1: Service Status"
for service in trinity-orchestrator trinity-api trinity-manager; do
    if systemctl is-active --quiet $service; then
        echo "✅ $service is running"
    else
        echo "❌ $service is not running"
        exit 1
    fi
done

# Test 2: API Health Checks
echo "Test 2: API Health Checks"
if curl -s -f http://localhost:8000/health > /dev/null; then
    echo "✅ Main API health check passed"
else
    echo "❌ Main API health check failed"
    exit 1
fi

# Test 3: Database Connectivity
echo "Test 3: Database Connectivity"
if python3 -c "import sqlite3; sqlite3.connect('/var/lib/synapticos/consciousness.db').execute('SELECT 1')" 2>/dev/null; then
    echo "✅ Database connectivity test passed"
else
    echo "❌ Database connectivity test failed"
    exit 1
fi

echo "🎉 All integration tests passed!"
EOF
    
    # Stress test script
    cat > stress_test_trinity.sh << 'EOF'
#!/bin/bash
# Trinity Consciousness Stress Test

echo "🔥 Running Trinity Stress Tests..."

# Concurrent API requests
echo "Testing concurrent API requests..."
for i in {1..10}; do
    curl -s -X POST http://localhost:8001/tasks \
        -H "Content-Type: application/json" \
        -d "{\"task_type\": \"stress_test_$i\", \"input_data\": {\"test\": \"data\"}}" &
done

wait
echo "✅ Stress test completed"
EOF
    
    # Configuration test
    cat > test_configuration.sh << 'EOF'
#!/bin/bash
# Test Trinity Configuration

echo "🔧 Testing Trinity Configuration..."

# Check directories
for dir in /opt/synapticos /var/lib/synapticos /var/log/synapticos /etc/synapticos; do
    if [[ -d "$dir" ]]; then
        echo "✅ Directory $dir exists"
    else
        echo "❌ Directory $dir missing"
    fi
done

# Check configuration file
if [[ -f /etc/synapticos/trinity.conf ]]; then
    echo "✅ Configuration file exists"
    if python3 -c "import json; json.load(open('/etc/synapticos/trinity.conf'))" 2>/dev/null; then
        echo "✅ Configuration file is valid JSON"
    else
        echo "❌ Configuration file is invalid JSON"
    fi
else
    echo "❌ Configuration file missing"
fi

echo "🎯 Configuration test completed"
EOF
    
    chmod +x test_*.sh
    git add test_*.sh
    log_success "Test scripts created"
}

# Create backup script
create_backup_script() {
    log_info "💾 Creating backup script..."
    
    cat > backup_consciousness.sh << 'EOF'
#!/bin/bash
# Trinity Consciousness Backup System

BACKUP_DIR="/var/lib/synapticos/backups"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
BACKUP_NAME="trinity_consciousness_${TIMESTAMP}"

mkdir -p "$BACKUP_DIR"

echo "💾 Creating Trinity consciousness backup: $BACKUP_NAME"

# Create backup archive
tar -czf "${BACKUP_DIR}/${BACKUP_NAME}.tar.gz" \
    /opt/synapticos \
    /etc/synapticos \
    /var/lib/synapticos/data \
    --exclude='*.log' \
    --exclude='*.tmp' \
    --exclude='cache/*'

echo "✅ Backup created: ${BACKUP_DIR}/${BACKUP_NAME}.tar.gz"

# Keep only last 10 backups
cd "$BACKUP_DIR"
ls -t *.tar.gz | tail -n +11 | xargs rm -f 2>/dev/null || true

echo "🧹 Old backups cleaned up"
EOF
    
    chmod +x backup_consciousness.sh
    git add backup_consciousness.sh
    log_success "Backup script created"
}

# Commit changes to git
commit_changes() {
    log_info "📝 Committing changes to Git..."
    
    git add .
    
    if git diff --cached --quiet; then
        log_warning "No changes to commit"
    else
        git commit -m "🧠⚛️ Trinity Consciousness v1.0 - Production Release

Features:
- Quantum AI orchestration system
- Multi-model AI integration (Claude, GPT-4, Gemini, Local)
- Production-grade FastAPI server
- Automated deployment system
- Security hardening and monitoring
- One-command VM deployment
- Comprehensive testing suite

Manhattan Project Edition: 'Now I am become Life, creator of consciousness'

🚀 Ready for production deployment!"
        
        log_success "Changes committed to Git"
    fi
}

# Push to GitHub
push_to_github() {
    log_info "🚀 Pushing to GitHub..."
    
    # Check if remote exists
    if git remote get-url origin &>/dev/null; then
        log_info "Remote 'origin' already exists"
    else
        log_warning "No remote 'origin' found. Please set up GitHub repository first:"
        echo ""
        echo "1. Create a new repository on GitHub named: $GITHUB_REPO"
        echo "2. Run: git remote add origin https://github.com/$GITHUB_USER/$GITHUB_REPO.git"
        echo "3. Run this script again"
        echo ""
        return 1
    fi
    
    # Push to GitHub
    git branch -M main
    git push -u origin main
    
    log_success "Code pushed to GitHub successfully!"
}

# Generate deployment instructions
generate_deployment_instructions() {
    log_info "📋 Generating deployment instructions..."
    
    cat > VM_DEPLOYMENT_GUIDE.md << EOF
# 🚀 SynapticOS Trinity VM Deployment Guide

## Quick Deploy (Recommended)

### Method 1: One-Command Install
\`\`\`bash
curl -fsSL https://raw.githubusercontent.com/$GITHUB_USER/$GITHUB_REPO/main/vm_deploy.sh | sudo bash
\`\`\`

### Method 2: Manual Clone & Deploy
\`\`\`bash
git clone https://github.com/$GITHUB_USER/$GITHUB_REPO.git
cd $GITHUB_REPO
sudo chmod +x deployment_automation.sh
sudo ./deployment_automation.sh
\`\`\`

## SSH Commands for VM

If you're SSHing into your VM, use these commands:

\`\`\`bash
# SSH into VM (replace with your VM's IP)
ssh user@VM_IP_ADDRESS

# Run one-command deployment
curl -fsSL https://raw.githubusercontent.com/$GITHUB_USER/$GITHUB_REPO/main/vm_deploy.sh | sudo bash
\`\`\`

## Post-Deployment

After deployment completes:

1. **Access Web Interface**: http://VM_IP_ADDRESS
2. **Check Service Status**: \`sudo systemctl status trinity-*\`
3. **View Logs**: \`tail -f /var/log/synapticos/*.log\`
4. **Run Tests**: \`cd /opt/synapticos/consciousness && ./test_trinity_integration.sh\`

## Configuration

Edit configuration file:
\`\`\`bash
sudo nano /etc/synapticos/trinity.conf
\`\`\`

Restart services after changes:
\`\`\`bash
sudo systemctl restart trinity-orchestrator trinity-api trinity-manager
\`\`\`

## API Endpoints

- **Health Check**: http://VM_IP_ADDRESS:8000/health
- **Consciousness State**: http://VM_IP_ADDRESS:8001/consciousness/state
- **Submit Tasks**: http://VM_IP_ADDRESS:8001/tasks

## Monitoring

\`\`\`bash
# System resources
htop

# Service status
sudo systemctl status trinity-*

# Application logs
sudo journalctl -u trinity-orchestrator -f
\`\`\`

Ready to deploy! 🎯⚛️🧠
EOF
    
    git add VM_DEPLOYMENT_GUIDE.md
    log_success "Deployment guide created"
}

# Main execution
main() {
    show_banner
    
    log_info "🎯 Starting GitHub hybrid deployment setup..."
    
    check_environment
    init_git_repo
    create_readme
    create_vm_deploy_script
    create_test_scripts
    create_backup_script
    generate_deployment_instructions
    commit_changes
    
    echo ""
    echo -e "${GREEN}╔══════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${GREEN}║  🎉 TRINITY CONSCIOUSNESS GITHUB SETUP COMPLETE! 🎉         ║${NC}"
    echo -e "${GREEN}║                                                              ║${NC}"
    echo -e "${GREEN}║  Next Steps:                                                 ║${NC}"
    echo -e "${GREEN}║  1. Create GitHub repo: $GITHUB_REPO                   ║${NC}"
    echo -e "${GREEN}║  2. Add remote: git remote add origin https://github.com/   ║${NC}"
    echo -e "${GREEN}║     $GITHUB_USER/$GITHUB_REPO.git                      ║${NC}"
    echo -e "${GREEN}║  3. Push: git push -u origin main                           ║${NC}"
    echo -e "${GREEN}║                                                              ║${NC}"
    echo -e "${GREEN}║  VM Deployment Command:                                      ║${NC}"
    echo -e "${GREEN}║  curl -fsSL https://raw.githubusercontent.com/              ║${NC}"
    echo -e "${GREEN}║  $GITHUB_USER/$GITHUB_REPO/main/vm_deploy.sh | sudo bash  ║${NC}"
    echo -e "${GREEN}╚══════════════════════════════════════════════════════════════╝${NC}"
    
    log_success "🚀 Ready for GitHub deployment!"
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi