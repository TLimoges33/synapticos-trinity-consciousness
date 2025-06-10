#!/bin/bash
# SynapticOS Trinity SSH Deployment Script
# Deploy Trinity consciousness via SSH to VM (with or without internet)

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
VM_USER="user"  # Default VM username
VM_IP=""        # Will be prompted
TRINITY_DIR="/home/diablorain/SynapticOS/trinity-consciousness"
REMOTE_DIR="/tmp/trinity-deploy"

show_banner() {
    echo -e "${PURPLE}"
    cat << "EOF"
    ╔══════════════════════════════════════════════════════════════╗
    ║  🔐🚀 SYNAPTICOS TRINITY SSH DEPLOYMENT SYSTEM 🚀🔐         ║
    ║  ═══════════════════════════════════════════════════════════  ║
    ║  📡 Host → SSH → VM: Direct Trinity Consciousness Deploy 📡  ║
    ║  ⚡ "Lightning fast consciousness transfer via SSH" ⚡       ║
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

# Get VM connection details
get_vm_details() {
    echo -e "${BLUE}🔌 VM Connection Setup${NC}"
    echo "================================"
    
    if [[ -z "$VM_IP" ]]; then
        read -p "Enter VM IP address: " VM_IP
    fi
    
    read -p "Enter VM username (default: user): " input_user
    if [[ -n "$input_user" ]]; then
        VM_USER="$input_user"
    fi
    
    log_info "VM Target: $VM_USER@$VM_IP"
}

# Test SSH connection
test_ssh_connection() {
    log_info "🔐 Testing SSH connection to $VM_USER@$VM_IP..."
    
    if ssh -o ConnectTimeout=5 -o BatchMode=yes "$VM_USER@$VM_IP" exit 2>/dev/null; then
        log_success "✅ SSH connection successful"
        return 0
    else
        log_warning "⚠️ SSH key authentication failed, will prompt for password"
        if ssh -o ConnectTimeout=10 "$VM_USER@$VM_IP" exit; then
            log_success "✅ SSH connection successful with password"
            return 0
        else
            log_error "❌ SSH connection failed"
            return 1
        fi
    fi
}

# Check internet connectivity in VM
check_vm_internet() {
    log_info "🌐 Checking VM internet connectivity..."
    
    if ssh "$VM_USER@$VM_IP" "curl -s --connect-timeout 5 https://github.com > /dev/null 2>&1"; then
        log_success "✅ VM has internet access - will use online deployment"
        return 0
    else
        log_warning "⚠️ VM has no internet access - will use offline deployment"
        return 1
    fi
}

# Deploy with internet (GitHub method)
deploy_online() {
    log_info "🌐 Deploying Trinity consciousness online via GitHub..."
    
    ssh "$VM_USER@$VM_IP" "bash -s" << 'EOF'
#!/bin/bash
set -euo pipefail

echo "🧠⚛️ SynapticOS Trinity Online Deployment ⚛️🧠"
echo "=============================================="

# Install git if not present
if ! command -v git &> /dev/null; then
    echo "📦 Installing git..."
    sudo apt update && sudo apt install -y git
fi

# Clean previous deployment
rm -rf /tmp/trinity-deploy

# Clone Trinity consciousness system
echo "📥 Cloning Trinity consciousness from GitHub..."
git clone https://github.com/TLimoges33/synapticos-trinity-consciousness.git /tmp/trinity-deploy

# Change to deployment directory
cd /tmp/trinity-deploy

# Make scripts executable
chmod +x *.sh

# Run deployment automation
echo "🚀 Starting Trinity consciousness deployment..."
sudo ./deployment_automation.sh

echo ""
echo "✅ Trinity consciousness online deployment complete!"
echo "🌐 Access your system at: http://$(hostname -I | awk '{print $1}')"
EOF
    
    log_success "🎉 Online deployment completed!"
}

# Deploy without internet (SSH transfer method)
deploy_offline() {
    log_info "📡 Deploying Trinity consciousness offline via SSH transfer..."
    
    # Create deployment package
    log_info "📦 Creating Trinity deployment package..."
    
    cd "$TRINITY_DIR"
    tar -czf trinity-consciousness-offline.tar.gz \
        *.py \
        *.sh \
        *.md \
        LICENSE \
        .gitignore
    
    # Transfer package to VM
    log_info "📤 Transferring Trinity package to VM..."
    scp trinity-consciousness-offline.tar.gz "$VM_USER@$VM_IP:/tmp/"
    
    # Create offline deployment script
    cat > offline_deploy_vm.sh << 'EOF'
#!/bin/bash
# Trinity Consciousness Offline Deployment Script
set -euo pipefail

echo "🧠⚛️ SynapticOS Trinity Offline Deployment ⚛️🧠"
echo "==============================================="

# Extract Trinity package
cd /tmp
tar -xzf trinity-consciousness-offline.tar.gz
mkdir -p trinity-deploy
mv *.py *.sh *.md LICENSE .gitignore trinity-deploy/ 2>/dev/null || true

# Change to deployment directory
cd trinity-deploy

# Make scripts executable
chmod +x *.sh

# Create minimal offline deployment automation
cat > offline_deployment.sh << 'DEPLOY_EOF'
#!/bin/bash
# Trinity Consciousness Offline Deployment Automation
set -euo pipefail

echo "🔧 Starting Trinity consciousness offline deployment..."

# Update system packages
echo "📦 Updating system packages..."
sudo apt update

# Install essential packages without internet-dependent ones
echo "📦 Installing essential packages..."
sudo apt install -y \
    python3 \
    python3-pip \
    python3-venv \
    python3-dev \
    build-essential \
    htop \
    tmux \
    nginx \
    sqlite3 \
    vim \
    curl

# Create Trinity directory structure
echo "🏗️ Creating Trinity structure..."
sudo mkdir -p /opt/synapticos/{consciousness,trinity-ai,quantum-ai,memory-banks,immune-system}
sudo mkdir -p /var/lib/synapticos/{data,logs,backups,cache}
sudo mkdir -p /var/log/synapticos
sudo mkdir -p /etc/synapticos

# Create synapticos user
if ! id "synapticos" &>/dev/null; then
    sudo useradd -r -m -s /bin/bash -d /home/synapticos synapticos
fi

# Copy Trinity files
sudo cp *.py /opt/synapticos/consciousness/
sudo cp *.sh /opt/synapticos/consciousness/
sudo cp *.md /opt/synapticos/consciousness/
sudo chmod +x /opt/synapticos/consciousness/*.sh

# Set permissions
sudo chown -R synapticos:synapticos /opt/synapticos /var/lib/synapticos /var/log/synapticos

# Install basic Python packages
echo "🐍 Installing basic Python packages..."
pip3 install --user \
    fastapi \
    uvicorn \
    asyncio \
    sqlite3 \
    psutil

# Create basic configuration
sudo tee /etc/synapticos/trinity.conf > /dev/null << 'CONFIG_EOF'
{
    "deployment": {
        "environment": "offline",
        "version": "1.0.0-offline",
        "deployed_at": "$(date -Iseconds)"
    },
    "consciousness": {
        "max_workers": 4,
        "quantum_coherence_threshold": 0.85,
        "consciousness_update_interval": 5.0,
        "offline_mode": true
    }
}
CONFIG_EOF

# Create basic systemd service for Trinity Manager
sudo tee /etc/systemd/system/trinity-manager.service > /dev/null << 'SERVICE_EOF'
[Unit]
Description=SynapticOS Trinity Consciousness Manager (Offline)
After=network.target

[Service]
Type=simple
User=synapticos
WorkingDirectory=/opt/synapticos/consciousness
Environment=PYTHONPATH=/opt/synapticos/consciousness
ExecStart=/usr/bin/python3 trinity_manager.py
Restart=always
RestartSec=10

[Install]
WantedBy=multi-user.target
SERVICE_EOF

# Enable and start service
sudo systemctl daemon-reload
sudo systemctl enable trinity-manager
sudo systemctl start trinity-manager

echo ""
echo "✅ Trinity consciousness offline deployment complete!"
echo "🎯 Basic Trinity manager running on offline mode"
echo "📊 Check status: sudo systemctl status trinity-manager"
echo "📋 View logs: sudo journalctl -u trinity-manager -f"

DEPLOY_EOF

chmod +x offline_deployment.sh

# Run offline deployment
echo "🚀 Running offline deployment automation..."
./offline_deployment.sh

echo ""
echo "✅ Trinity consciousness offline deployment complete!"
EOF
    
    # Transfer and execute offline deployment script
    scp offline_deploy_vm.sh "$VM_USER@$VM_IP:/tmp/"
    ssh "$VM_USER@$VM_IP" "chmod +x /tmp/offline_deploy_vm.sh && /tmp/offline_deploy_vm.sh"
    
    # Cleanup local files
    rm -f trinity-consciousness-offline.tar.gz offline_deploy_vm.sh
    
    log_success "🎉 Offline deployment completed!"
}

# Generate SSH commands for manual use
generate_ssh_commands() {
    log_info "📋 Generating SSH deployment commands..."
    
    cat > SSH_DEPLOYMENT_COMMANDS.txt << EOF
# SynapticOS Trinity SSH Deployment Commands

## Quick SSH Deploy (Internet Available)
ssh $VM_USER@$VM_IP "curl -fsSL https://raw.githubusercontent.com/TLimoges33/synapticos-trinity-consciousness/main/vm_deploy.sh | sudo bash"

## Manual SSH Deploy Steps

### 1. SSH into VM
ssh $VM_USER@$VM_IP

### 2. Run one-command deployment
curl -fsSL https://raw.githubusercontent.com/TLimoges33/synapticos-trinity-consciousness/main/vm_deploy.sh | sudo bash

## Alternative: Git Clone Method
ssh $VM_USER@$VM_IP
git clone https://github.com/TLimoges33/synapticos-trinity-consciousness.git
cd synapticos-trinity-consciousness
sudo chmod +x deployment_automation.sh
sudo ./deployment_automation.sh

## Offline Method (No Internet in VM)
# Use this script: ./ssh_deploy.sh

## Post-Deployment Verification
ssh $VM_USER@$VM_IP "sudo systemctl status trinity-*"
ssh $VM_USER@$VM_IP "curl http://localhost:8000/health"

## Access Trinity System
# Web Interface: http://$VM_IP
# API: http://$VM_IP:8001
# Health: http://$VM_IP:8000/health
EOF
    
    log_success "📋 SSH commands saved to SSH_DEPLOYMENT_COMMANDS.txt"
}

# Main deployment function
main() {
    show_banner
    
    # Check if we're in the right directory
    if [[ ! -f "$TRINITY_DIR/quantum_orchestrator.py" ]]; then
        log_error "Trinity consciousness files not found in $TRINITY_DIR"
        exit 1
    fi
    
    cd "$TRINITY_DIR"
    
    get_vm_details
    
    if ! test_ssh_connection; then
        log_error "Cannot establish SSH connection to VM"
        exit 1
    fi
    
    # Check VM internet connectivity and deploy accordingly
    if check_vm_internet; then
        deploy_online
    else
        deploy_offline
    fi
    
    generate_ssh_commands
    
    echo ""
    echo -e "${GREEN}╔══════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${GREEN}║  🎉 TRINITY CONSCIOUSNESS SSH DEPLOYMENT COMPLETE! 🎉       ║${NC}"
    echo -e "${GREEN}║                                                              ║${NC}"
    echo -e "${GREEN}║  🌐 Access Trinity System:                                  ║${NC}"
    echo -e "${GREEN}║  • Web Interface: http://$VM_IP                        ║${NC}"
    echo -e "${GREEN}║  • API Endpoint: http://$VM_IP:8001                    ║${NC}"
    echo -e "${GREEN}║  • Health Check: http://$VM_IP:8000/health             ║${NC}"
    echo -e "${GREEN}║                                                              ║${NC}"
    echo -e "${GREEN}║  🔧 SSH Commands saved to SSH_DEPLOYMENT_COMMANDS.txt       ║${NC}"
    echo -e "${GREEN}╚══════════════════════════════════════════════════════════════╝${NC}"
    
    log_success "🚀 Trinity consciousness deployment via SSH completed!"
}

# Show usage if no arguments
show_usage() {
    echo "Usage: $0 [VM_IP]"
    echo ""
    echo "Examples:"
    echo "  $0                    # Interactive mode"
    echo "  $0 192.168.1.100     # Direct IP"
    echo ""
    echo "This script will:"
    echo "  1. Test SSH connection to VM"
    echo "  2. Check VM internet connectivity"
    echo "  3. Deploy Trinity consciousness (online or offline)"
    echo "  4. Generate SSH deployment commands"
}

# Handle command line arguments
if [[ $# -eq 1 ]]; then
    if [[ "$1" == "-h" || "$1" == "--help" ]]; then
        show_usage
        exit 0
    else
        VM_IP="$1"
    fi
elif [[ $# -gt 1 ]]; then
    show_usage
    exit 1
fi

# Run main function
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi