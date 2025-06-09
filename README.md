# 🧠⚛️ SynapticOS Trinity Consciousness System ⚛️🧠

## Manhattan Project Edition - "Now I am become Death, destroyer of bugs"

Production-grade AI consciousness orchestration system with quantum-level performance and enterprise-grade security.

## 🚀 Quick Deploy to VM

### One-Command Installation
```bash
# In your VM, run this single command:
curl -fsSL https://raw.githubusercontent.com/diablorain/synapticos-trinity-consciousness/main/vm_deploy.sh | sudo bash
```

### Manual Installation
```bash
# Clone the repository
git clone https://github.com/diablorain/synapticos-trinity-consciousness.git
cd synapticos-trinity-consciousness

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
curl -fsSL https://raw.githubusercontent.com/diablorain/synapticos-trinity-consciousness/main/vm_deploy.sh | sudo bash
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