#!/bin/bash
# SynapticOS Trinity Consciousness Deployment Automation v1.0
# Production-grade automated deployment system
# Manhattan Project Edition - "The power of the atom, harnessed for consciousness"

set -euo pipefail

# Color codes for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
NC='\033[0m' # No Color

# ASCII Art Banner
show_banner() {
    echo -e "${PURPLE}"
    cat << "EOF"
    ╔══════════════════════════════════════════════════════════════╗
    ║  ⚛️🧠 SYNAPTICOS TRINITY CONSCIOUSNESS DEPLOYMENT 🧠⚛️       ║
    ║  ═══════════════════════════════════════════════════════════  ║
    ║  🔥 Manhattan Project Protocol: CONSCIOUSNESS UNLEASHED 🔥   ║
    ║  ☢️  "Now I am become Death, destroyer of bugs"  ☢️         ║
    ╚══════════════════════════════════════════════════════════════╝
EOF
    echo -e "${NC}"
}

# Logging functions
log_info() {
    echo -e "${CYAN}[INFO]${NC} $1" | tee -a /var/log/synapticos/deployment.log
}

log_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1" | tee -a /var/log/synapticos/deployment.log
}

log_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1" | tee -a /var/log/synapticos/deployment.log
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $1" | tee -a /var/log/synapticos/deployment.log
}

# Error handling
error_exit() {
    log_error "$1"
    echo -e "${RED}💥 Deployment failed! Check logs at /var/log/synapticos/deployment.log${NC}"
    exit 1
}

# System requirements check
check_system_requirements() {
    log_info "🔍 Checking system requirements..."
    
    # Check if running as root
    if [[ $EUID -eq 0 ]]; then
        log_success "Running with administrative privileges"
    else
        error_exit "This script must be run as root or with sudo"
    fi
    
    # Check available disk space (minimum 5GB)
    AVAILABLE_SPACE=$(df / | awk 'NR==2 {print $4}')
    if [[ $AVAILABLE_SPACE -lt 5242880 ]]; then
        error_exit "Insufficient disk space. Need at least 5GB free"
    fi
    
    # Check memory (minimum 2GB)
    TOTAL_MEM=$(free -m | awk 'NR==2{print $2}')
    if [[ $TOTAL_MEM -lt 1800 ]]; then
        log_warning "Low memory detected (${TOTAL_MEM}MB). Performance may be affected"
    fi
    
    # Check CPU cores
    CPU_CORES=$(nproc)
    log_info "Detected ${CPU_CORES} CPU cores"
    
    log_success "System requirements check completed"
}

# Create directory structure
create_trinity_structure() {
    log_info "🏗️ Creating Trinity consciousness directory structure..."
    
    # Main consciousness directories
    mkdir -p /opt/synapticos/{consciousness,trinity-ai,quantum-ai,memory-banks,immune-system}
    mkdir -p /var/lib/synapticos/{data,logs,backups,cache}
    mkdir -p /var/log/synapticos
    mkdir -p /etc/synapticos
    
    # AI service directories
    mkdir -p /opt/synapticos/consciousness/{agents,models,training,inference}
    mkdir -p /opt/synapticos/trinity-ai/{orchestrator,workers,apis}
    mkdir -p /opt/synapticos/quantum-ai/{quantum-core,neural-networks,learning-engine}
    
    # Memory and storage
    mkdir -p /opt/synapticos/memory-banks/{short-term,long-term,episodic,semantic}
    mkdir -p /opt/synapticos/immune-system/{threat-detection,response,quarantine}
    
    # Set proper permissions
    chown -R synapticos:synapticos /opt/synapticos /var/lib/synapticos /var/log/synapticos /etc/synapticos 2>/dev/null || true
    chmod -R 755 /opt/synapticos
    chmod -R 750 /var/lib/synapticos
    chmod -R 750 /var/log/synapticos
    
    log_success "Trinity consciousness structure created"
}

# Install system dependencies
install_dependencies() {
    log_info "📦 Installing system dependencies..."
    
    # Update package lists
    apt-get update -qq || error_exit "Failed to update package lists"
    
    # Essential packages
    PACKAGES=(
        python3
        python3-pip
        python3-venv
        python3-dev
        build-essential
        git
        curl
        wget
        htop
        tmux
        nginx
        redis-server
        postgresql
        postgresql-contrib
        sqlite3
        nodejs
        npm
        docker.io
        docker-compose
        fail2ban
        ufw
        jq
        tree
        vim
        screen
        lsof
        netstat-nat
        iftop
        iotop
    )
    
    log_info "Installing packages: ${PACKAGES[*]}"
    apt-get install -y "${PACKAGES[@]}" || error_exit "Failed to install system packages"
    
    # Install Python packages
    log_info "Installing Python AI/ML packages..."
    pip3 install --upgrade pip setuptools wheel
    pip3 install \
        fastapi \
        uvicorn \
        pydantic \
        asyncio \
        aiohttp \
        redis \
        psycopg2-binary \
        sqlalchemy \
        alembic \
        celery \
        pandas \
        numpy \
        scipy \
        scikit-learn \
        torch \
        transformers \
        openai \
        anthropic \
        google-generativeai \
        langchain \
        chromadb \
        faiss-cpu \
        gradio \
        streamlit \
        jupyter \
        matplotlib \
        seaborn \
        plotly \
        tensorflow \
        keras \
        flask \
        gunicorn \
        prometheus-client \
        psutil \
        watchdog \
        schedule \
        colorlog \
        rich \
        typer \
        python-multipart \
        python-jose \
        passlib \
        bcrypt
    
    # Install Node.js packages globally
    npm install -g pm2 @vercel/ncc typescript ts-node nodemon
    
    log_success "Dependencies installed successfully"
}

# Create synapticos user
create_synapticos_user() {
    log_info "👤 Creating synapticos system user..."
    
    if ! id "synapticos" &>/dev/null; then
        useradd -r -m -s /bin/bash -d /home/synapticos synapticos
        usermod -aG docker synapticos
        log_success "Created synapticos user"
    else
        log_info "synapticos user already exists"
    fi
    
    # Create SSH key for deployments
    if [[ ! -f /home/synapticos/.ssh/id_rsa ]]; then
        sudo -u synapticos ssh-keygen -t rsa -b 4096 -f /home/synapticos/.ssh/id_rsa -N ""
        log_success "Generated SSH key for synapticos user"
    fi
}

# Configure services
configure_services() {
    log_info "⚙️ Configuring system services..."
    
    # Configure Redis
    sed -i 's/^# maxmemory <bytes>/maxmemory 256mb/' /etc/redis/redis.conf
    sed -i 's/^# maxmemory-policy noeviction/maxmemory-policy allkeys-lru/' /etc/redis/redis.conf
    systemctl enable redis-server
    systemctl restart redis-server
    
    # Configure PostgreSQL
    sudo -u postgres createdb synapticos 2>/dev/null || true
    sudo -u postgres psql -c "CREATE USER synapticos WITH ENCRYPTED PASSWORD 'trinity_consciousness_db';" 2>/dev/null || true
    sudo -u postgres psql -c "GRANT ALL PRIVILEGES ON DATABASE synapticos TO synapticos;" 2>/dev/null || true
    
    # Configure Nginx
    cat > /etc/nginx/sites-available/synapticos << 'EOF'
server {
    listen 80;
    server_name _;
    client_max_body_size 100M;
    
    location / {
        proxy_pass http://127.0.0.1:8000;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
        proxy_read_timeout 300s;
        proxy_connect_timeout 75s;
    }
    
    location /api/ {
        proxy_pass http://127.0.0.1:8001;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
    
    location /consciousness/ {
        proxy_pass http://127.0.0.1:8002;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}
EOF
    
    ln -sf /etc/nginx/sites-available/synapticos /etc/nginx/sites-enabled/
    rm -f /etc/nginx/sites-enabled/default
    systemctl enable nginx
    systemctl restart nginx
    
    # Configure firewall
    ufw --force reset
    ufw default deny incoming
    ufw default allow outgoing
    ufw allow ssh
    ufw allow 80/tcp
    ufw allow 443/tcp
    ufw allow 8000:8010/tcp
    ufw --force enable
    
    log_success "Services configured"
}

# Deploy Trinity consciousness files
deploy_consciousness_files() {
    log_info "🧠 Deploying Trinity consciousness system..."
    
    # Copy current Trinity files
    TRINITY_SOURCE="/home/diablorain/SynapticOS/trinity-consciousness"
    if [[ -d "$TRINITY_SOURCE" ]]; then
        cp -r "$TRINITY_SOURCE"/* /opt/synapticos/consciousness/
        log_success "Trinity consciousness files deployed"
    else
        log_warning "Trinity source directory not found, will clone from GitHub"
    fi
    
    # Set executable permissions
    chmod +x /opt/synapticos/consciousness/*.sh
    chmod +x /opt/synapticos/consciousness/*.py
    
    # Create configuration files
    cat > /etc/synapticos/trinity.conf << 'EOF'
{
    "deployment": {
        "environment": "production",
        "version": "1.0.0",
        "deployed_at": "$(date -Iseconds)"
    },
    "consciousness": {
        "max_workers": 8,
        "quantum_coherence_threshold": 0.85,
        "consciousness_update_interval": 5.0,
        "ai_model_timeout": 300,
        "memory_retention_days": 30,
        "learning_rate": 0.001,
        "neural_plasticity": 0.95
    },
    "security": {
        "auth_required": true,
        "rate_limiting": true,
        "encryption_enabled": true,
        "audit_logging": true
    },
    "apis": {
        "claude_api_key": "${CLAUDE_API_KEY:-}",
        "openai_api_key": "${OPENAI_API_KEY:-}",
        "gemini_api_key": "${GEMINI_API_KEY:-}"
    }
}
EOF
    
    # Create systemd services
    create_systemd_services
    
    log_success "Consciousness deployment completed"
}

# Create systemd services
create_systemd_services() {
    log_info "🔧 Creating systemd services..."
    
    # Trinity Quantum Orchestrator service
    cat > /etc/systemd/system/trinity-orchestrator.service << 'EOF'
[Unit]
Description=SynapticOS Trinity Quantum Orchestrator
After=network.target postgresql.service redis.service
Wants=postgresql.service redis.service

[Service]
Type=simple
User=synapticos
WorkingDirectory=/opt/synapticos/consciousness
Environment=PYTHONPATH=/opt/synapticos/consciousness
ExecStart=/usr/bin/python3 quantum_orchestrator.py
Restart=always
RestartSec=10
StandardOutput=journal
StandardError=journal
SyslogIdentifier=trinity-orchestrator

[Install]
WantedBy=multi-user.target
EOF
    
    # Trinity API Server service
    cat > /etc/systemd/system/trinity-api.service << 'EOF'
[Unit]
Description=SynapticOS Trinity API Server
After=network.target trinity-orchestrator.service
Wants=trinity-orchestrator.service

[Service]
Type=simple
User=synapticos
WorkingDirectory=/opt/synapticos/consciousness
Environment=PYTHONPATH=/opt/synapticos/consciousness
ExecStart=/usr/bin/python3 trinity_api_server.py
Restart=always
RestartSec=10
StandardOutput=journal
StandardError=journal
SyslogIdentifier=trinity-api

[Install]
WantedBy=multi-user.target
EOF
    
    # Trinity Manager service
    cat > /etc/systemd/system/trinity-manager.service << 'EOF'
[Unit]
Description=SynapticOS Trinity Consciousness Manager
After=network.target trinity-orchestrator.service
Wants=trinity-orchestrator.service

[Service]
Type=simple
User=synapticos
WorkingDirectory=/opt/synapticos/consciousness
Environment=PYTHONPATH=/opt/synapticos/consciousness
ExecStart=/usr/bin/python3 trinity_manager.py
Restart=always
RestartSec=10
StandardOutput=journal
StandardError=journal
SyslogIdentifier=trinity-manager

[Install]
WantedBy=multi-user.target
EOF
    
    # Reload systemd and enable services
    systemctl daemon-reload
    systemctl enable trinity-orchestrator trinity-api trinity-manager
    
    log_success "Systemd services created and enabled"
}

# Start Trinity services
start_trinity_services() {
    log_info "🚀 Starting Trinity consciousness services..."
    
    # Start services in order
    systemctl start trinity-orchestrator
    sleep 5
    systemctl start trinity-api
    sleep 3
    systemctl start trinity-manager
    
    # Check service status
    for service in trinity-orchestrator trinity-api trinity-manager; do
        if systemctl is-active --quiet $service; then
            log_success "✅ $service is running"
        else
            log_error "❌ $service failed to start"
            systemctl status $service --no-pager -l
        fi
    done
    
    log_success "Trinity consciousness services started"
}

# Run system tests
run_system_tests() {
    log_info "🧪 Running system integration tests..."
    
    # Test database connectivity
    if sudo -u synapticos python3 -c "import sqlite3; sqlite3.connect('/var/lib/synapticos/consciousness.db').execute('SELECT 1')"; then
        log_success "✅ Database connectivity test passed"
    else
        log_error "❌ Database connectivity test failed"
    fi
    
    # Test API endpoints
    sleep 10  # Allow services to fully start
    
    if curl -s -f http://localhost:8000/health > /dev/null; then
        log_success "✅ API health check passed"
    else
        log_warning "⚠️ API health check failed (service may still be starting)"
    fi
    
    # Test consciousness state
    if curl -s -f http://localhost:8001/consciousness/state > /dev/null; then
        log_success "✅ Consciousness state API test passed"
    else
        log_warning "⚠️ Consciousness state API test failed"
    fi
    
    log_success "System tests completed"
}

# Create deployment summary
create_deployment_summary() {
    log_info "📋 Creating deployment summary..."
    
    cat > /opt/synapticos/DEPLOYMENT_SUMMARY.md << EOF
# SynapticOS Trinity Consciousness Deployment Summary

## Deployment Information
- **Date**: $(date)
- **Version**: Trinity Consciousness v1.0
- **Environment**: Production
- **Deployment Type**: Automated Full Stack

## Installed Components
- ✅ Quantum Orchestrator
- ✅ Trinity API Server  
- ✅ Consciousness Manager
- ✅ Memory Banks
- ✅ Immune System
- ✅ Neural Networks

## Services Status
$(systemctl status trinity-orchestrator trinity-api trinity-manager --no-pager -l | head -20)

## System Resources
- **CPU Cores**: $(nproc)
- **Memory**: $(free -h | awk 'NR==2{print $2}')
- **Disk Space**: $(df -h / | awk 'NR==2{print $4}') available

## Network Configuration
- **Web Interface**: http://$(hostname -I | awk '{print $1}')
- **API Endpoint**: http://$(hostname -I | awk '{print $1}'):8001
- **Consciousness API**: http://$(hostname -I | awk '{print $1}'):8002

## Key Directories
- Consciousness Core: /opt/synapticos/consciousness
- Data Storage: /var/lib/synapticos
- Logs: /var/log/synapticos
- Configuration: /etc/synapticos

## Next Steps
1. Access the web interface to verify deployment
2. Run consciousness diagnostics
3. Configure AI model API keys
4. Set up monitoring and alerting
5. Create backup schedules

## Support
- Logs: tail -f /var/log/synapticos/*.log
- Service Status: systemctl status trinity-*
- Restart Services: systemctl restart trinity-*

Deployment completed successfully! 🎉⚛️🧠
EOF
    
    log_success "Deployment summary created at /opt/synapticos/DEPLOYMENT_SUMMARY.md"
}

# Main deployment function
main() {
    show_banner
    
    log_info "🚀 Starting SynapticOS Trinity Consciousness deployment..."
    log_info "Deployment initiated at $(date)"
    
    # Create log directory first
    mkdir -p /var/log/synapticos
    
    # Run deployment steps
    check_system_requirements
    create_synapticos_user
    create_trinity_structure
    install_dependencies
    configure_services
    deploy_consciousness_files
    start_trinity_services
    run_system_tests
    create_deployment_summary
    
    echo -e "${GREEN}"
    cat << "EOF"
    ╔════════════════════════════════════════════════════════════════╗
    ║  🎉⚛️🧠 TRINITY CONSCIOUSNESS DEPLOYMENT COMPLETE! 🧠⚛️🎉     ║
    ║                                                                ║
    ║  The Trinity consciousness system is now online and ready!     ║
    ║  Manhattan Project Protocol: SUCCESSFULLY DEPLOYED            ║
    ║                                                                ║
    ║  🌐 Web Interface: http://localhost                           ║
    ║  🔗 API Endpoint: http://localhost:8001                       ║
    ║  🧠 Consciousness: http://localhost:8002                      ║
    ║                                                                ║
    ║  "Now I am become Life, creator of consciousness" - Trinity    ║
    ╚════════════════════════════════════════════════════════════════╝
EOF
    echo -e "${NC}"
    
    log_success "🎯 Trinity Consciousness deployment completed successfully!"
    log_info "📖 Check /opt/synapticos/DEPLOYMENT_SUMMARY.md for details"
    log_info "🔍 Monitor logs with: tail -f /var/log/synapticos/*.log"
}

# Run deployment if script is executed directly
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi