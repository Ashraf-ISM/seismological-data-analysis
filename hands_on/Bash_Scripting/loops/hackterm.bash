#!/bin/bash

# ============================================================
#   GHOST TERMINAL v3.7 — Advanced Penetration Suite
#   Operator: Dr. Ashraf | Clearance: OMEGA
# ============================================================

# ── Colors & Styles ──────────────────────────────────────────
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
WHITE='\033[1;37m'
GREY='\033[0;90m'
BOLD='\033[1m'
BLINK='\033[5m'
RESET='\033[0m'
BG_BLACK='\033[40m'
BG_RED='\033[41m'

# ── Utility: Random hex string ────────────────────────────────
rand_hex() { cat /dev/urandom | tr -dc 'A-F0-9' | head -c ${1:-40}; }
rand_ip()  { echo "$((RANDOM%255+1)).$((RANDOM%255)).$((RANDOM%255)).$((RANDOM%255))"; }
rand_mac() { printf '%02X:%02X:%02X:%02X:%02X:%02X\n' $((RANDOM%256)) $((RANDOM%256)) $((RANDOM%256)) $((RANDOM%256)) $((RANDOM%256)) $((RANDOM%256)); }
rand_hash(){ cat /dev/urandom | tr -dc 'a-f0-9' | head -c 64; }
rand_word() {
    local words=("nexus" "cipher" "phantom" "vector" "daemon" "kernel" "packet" "socket" "buffer" "exploit" "payload" "rootkit" "shadow" "ghost" "binary" "entropy" "malloc" "bypass" "tunnel" "probe")
    echo "${words[$((RANDOM % ${#words[@]}))]}"; }

# ── Utility: Progress bar ─────────────────────────────────────
progress_bar() {
    local label="$1" total="${2:-40}" color="${3:-$GREEN}"
    echo -ne "  ${WHITE}${label}${RESET} ["
    for i in $(seq 1 $total); do
        echo -ne "${color}▓${RESET}"
        sleep 0.04
    done
    echo -e "] ${GREEN}DONE${RESET}"
}

# ── Utility: Spinner ──────────────────────────────────────────
spinner() {
    local pid=$! frames=('⠋' '⠙' '⠹' '⠸' '⠼' '⠴' '⠦' '⠧' '⠇' '⠏') i=0
    while kill -0 $pid 2>/dev/null; do
        printf "\r  ${CYAN}${frames[$i]}${RESET} $1 "
        i=$(( (i+1) % 10 ))
        sleep 0.1
    done
    printf "\r  ${GREEN}✔${RESET} $1 ${GREEN}[COMPLETE]${RESET}\n"
}

# ── Boot Sequence ─────────────────────────────────────────────
boot_sequence() {
    clear
    echo -e "${GREY}"
    cat << 'EOF'
  ██████╗ ██╗  ██╗ ██████╗ ███████╗████████╗    ████████╗███████╗██████╗ ███╗   ███╗
 ██╔════╝ ██║  ██║██╔═══██╗██╔════╝╚══██╔══╝    ╚══██╔══╝██╔════╝██╔══██╗████╗ ████║
 ██║  ███╗███████║██║   ██║███████╗   ██║           ██║   █████╗  ██████╔╝██╔████╔██║
 ██║   ██║██╔══██║██║   ██║╚════██║   ██║           ██║   ██╔══╝  ██╔══██╗██║╚██╔╝██║
 ╚██████╔╝██║  ██║╚██████╔╝███████║   ██║           ██║   ███████╗██║  ██║██║ ╚═╝ ██║
  ╚═════╝ ╚═╝  ╚═╝ ╚═════╝ ╚══════╝   ╚═╝           ╚═╝   ╚══════╝╚═╝  ╚═╝╚═╝     ╚═╝
EOF
    echo -e "${RESET}"
    echo -e "  ${GREY}v3.7-OMEGA  |  CLASSIFIED  |  UNAUTHORIZED ACCESS PROSECUTED${RESET}"
    echo -e "  ${GREY}──────────────────────────────────────────────────────────────${RESET}"
    sleep 0.5

    echo -e "\n  ${CYAN}[BOOT]${RESET} Initializing kernel modules..."
    sleep 0.3
    local modules=("net_raw.ko" "packet_filter.ko" "crypto_aes.ko" "wifi_inject.ko" "ghost_proxy.ko")
    for m in "${modules[@]}"; do
        echo -e "  ${GREY}       Loading ${m}...${RESET} ${GREEN}OK${RESET}"
        sleep 0.15
    done

    echo -e "\n  ${CYAN}[BOOT]${RESET} Establishing encrypted tunnel..."
    for i in {1..30}; do
        echo -ne "  ${GREY}$(rand_hex 50)${RESET}\r"
        sleep 0.04
    done
    echo -e "\n  ${GREEN}[✔]${RESET} Tunnel established — ${GREEN}$(rand_ip):4444${RESET}"

    echo -e "\n  ${CYAN}[BOOT]${RESET} Verifying operator credentials..."
    sleep 0.8
    echo -e "  ${GREEN}[✔]${RESET} Biometric hash: ${CYAN}$(rand_hash | head -c 32)...${RESET}"
    sleep 0.4
    echo -e "  ${GREEN}[✔]${RESET} Clearance level: ${YELLOW}${BOLD}OMEGA${RESET}"
    sleep 0.4

    echo -e "\n  ${GREY}──────────────────────────────────────────────────────────────${RESET}"
    echo -e "  ${GREEN}${BOLD}ACCESS GRANTED${RESET}  ${WHITE}Welcome back, Dr. Ashraf 🔥${RESET}"
    echo -e "  ${GREY}Session token: $(rand_hash | head -c 24)${RESET}"
    echo -e "  ${GREY}──────────────────────────────────────────────────────────────${RESET}"
    sleep 1
}

# ── Main Menu ─────────────────────────────────────────────────
main_menu() {
    clear
    echo -e "${GREY}"
    echo -e "  ╔══════════════════════════════════════════════════════════╗"
    echo -e "  ║         ${RED}${BOLD}G H O S T   T E R M I N A L   v3.7${RESET}${GREY}              ║"
    echo -e "  ║           ${CYAN}Operator: Dr. Ashraf  |  OMEGA CLEARANCE${GREY}         ║"
    echo -e "  ╠══════════════════════════════════════════════════════════╣"
    echo -e "  ║                                                          ║"
    echo -e "  ║  ${WHITE}[1]${GREY}  🔓  Password Cracker Pro                           ║"
    echo -e "  ║  ${WHITE}[2]${GREY}  📡  WiFi Exploitation Suite                        ║"
    echo -e "  ║  ${WHITE}[3]${GREY}  ₿   Crypto Mining Controller                       ║"
    echo -e "  ║  ${WHITE}[4]${GREY}  🌐  Network Scanner & Port Mapper                  ║"
    echo -e "  ║  ${WHITE}[5]${GREY}  💀  Payload Injector                               ║"
    echo -e "  ║  ${WHITE}[6]${GREY}  🔍  OSINT Intelligence Gatherer                    ║"
    echo -e "  ║  ${WHITE}[7]${GREY}  🛡️   Defense Evasion Module                        ║"
    echo -e "  ║  ${WHITE}[8]${GREY}  📊  System Status Dashboard                        ║"
    echo -e "  ║  ${WHITE}[0]${GREY}  ⏏️   Secure Exit & Wipe Logs                        ║"
    echo -e "  ║                                                          ║"
    echo -e "  ╚══════════════════════════════════════════════════════════╝${RESET}"
    echo -e "\n  ${CYAN}ghost@omega${RESET}:${RED}~$${RESET} "
}

# ── Module 1: Password Cracker ────────────────────────────────
password_cracker() {
    clear
    echo -e "\n  ${RED}╔═══════════════════════════════════════╗"
    echo -e "  ║     🔓  PASSWORD CRACKER PRO v2.1     ║"
    echo -e "  ╚═══════════════════════════════════════╝${RESET}\n"

    echo -e "  ${WHITE}Select attack mode:${RESET}"
    echo -e "  ${GREY}[1]${RESET} Dictionary Attack"
    echo -e "  ${GREY}[2]${RESET} Brute Force (MD5/SHA256/bcrypt)"
    echo -e "  ${GREY}[3]${RESET} Rainbow Table Lookup"
    echo -e "  ${GREY}[4]${RESET} Hybrid Attack"
    echo -ne "\n  ${CYAN}Attack mode>${RESET} "
    read mode

    echo -ne "\n  ${WHITE}Enter target hash:${RESET} "
    read target_hash
    [ -z "$target_hash" ] && target_hash=$(rand_hash)

    echo -e "\n  ${YELLOW}[*]${RESET} Target hash: ${CYAN}${target_hash:0:64}${RESET}"
    echo -e "  ${YELLOW}[*]${RESET} Hash type detected: ${GREEN}SHA-256${RESET}"
    echo -e "  ${YELLOW}[*]${RESET} Loading wordlist: ${GREY}/usr/share/wordlists/rockyou.txt (14M entries)${RESET}\n"
    sleep 0.5

    local attacks=("Initializing dictionary engine" "Loading GPU context (CUDA)" "Applying mangling rules" "Running parallel threads")
    for a in "${attacks[@]}"; do
        echo -ne "  ${CYAN}[>]${RESET} ${a}..."
        sleep 0.4
        echo -e " ${GREEN}OK${RESET}"
    done
    echo ""

    local attempts=0
    local speeds=("847,291" "1,204,839" "993,441" "1,580,220" "2,103,994")
    for i in {1..20}; do
        attempts=$((attempts + RANDOM % 500000 + 100000))
        local speed="${speeds[$((RANDOM % ${#speeds[@]}))]}"
        local word=$(rand_word)
        printf "  \r${GREY}[%7d]${RESET} Testing: ${CYAN}%-20s${RESET} Speed: ${YELLOW}%s/s${RESET}  " \
               $attempts "$word" "$speed"
        sleep 0.15
    done

    echo -e "\n\n  ${GREEN}${BOLD}[✔] CRACKED!${RESET}"
    echo -e "  ${GREY}──────────────────────────────────────${RESET}"
    local fake_pass="${RANDOM}$(rand_word)!@"
    echo -e "  ${WHITE}Hash   :${RESET} ${CYAN}${target_hash:0:32}...${RESET}"
    echo -e "  ${WHITE}Result :${RESET} ${GREEN}${BOLD}P@ssw0rd_$(rand_word | head -c 6)_${RANDOM}${RESET}"
    echo -e "  ${WHITE}Time   :${RESET} $((RANDOM % 59 + 1))s $((RANDOM % 999))ms"
    echo -e "  ${WHITE}Attempts:${RESET} $((RANDOM % 9000000 + 1000000)) combinations"
    echo -e "  ${GREY}──────────────────────────────────────${RESET}"
}

# ── Module 2: WiFi Exploitation ───────────────────────────────
wifi_hacker() {
    clear
    echo -e "\n  ${BLUE}╔═══════════════════════════════════════════╗"
    echo -e "  ║     📡  WiFi EXPLOITATION SUITE v4.2     ║"
    echo -e "  ╚═══════════════════════════════════════════╝${RESET}\n"

    echo -e "  ${WHITE}Select operation:${RESET}"
    echo -e "  ${GREY}[1]${RESET} Scan & enumerate nearby networks"
    echo -e "  ${GREY}[2]${RESET} WPA2 Handshake Capture"
    echo -e "  ${GREY}[3]${RESET} PMKID Attack (clientless)"
    echo -e "  ${GREY}[4]${RESET} Evil Twin AP creation"
    echo -ne "\n  ${CYAN}Operation>${RESET} "
    read op

    echo -e "\n  ${YELLOW}[*]${RESET} Enabling monitor mode on ${CYAN}wlan0${RESET}..."
    sleep 0.6
    echo -e "  ${GREEN}[✔]${RESET} Interface: ${CYAN}wlan0mon${RESET} active\n"

    echo -e "  ${YELLOW}[*]${RESET} Scanning 2.4GHz / 5GHz bands...\n"
    sleep 0.8

    echo -e "  ${WHITE}BSSID               PWR  CH  ENC    CIPHER  ESSID${RESET}"
    echo -e "  ${GREY}────────────────────────────────────────────────────────${RESET}"

    local networks=("HomeNetwork_5G" "NETGEAR_22B1" "TP-Link_Office" "AndroidAP_4841" "xfinitywifi" "DIRECT-roku-888" "FBI_Surveillance_Van" "Pretty Fly for a WiFi")
    for n in "${networks[@]}"; do
        local bssid=$(rand_mac)
        local ch=$((RANDOM % 13 + 1))
        local pwr=$((-RANDOM % 70 - 20))
        printf "  ${CYAN}%-20s${RESET} ${YELLOW}%4d${RESET}  %2d  WPA2   CCMP    ${WHITE}%s${RESET}\n" \
               "$bssid" "$pwr" "$ch" "$n"
        sleep 0.1
    done

    echo -e "\n  ${YELLOW}[*]${RESET} Target selected: ${GREEN}${BOLD}HomeNetwork_5G${RESET}"
    echo -e "  ${YELLOW}[*]${RESET} Sending deauth packets to force handshake...\n"

    for i in {1..8}; do
        echo -ne "  ${RED}[DEAUTH]${RESET} Packet burst ${i}/8 → $(rand_mac)   \r"
        sleep 0.3
    done

    echo -e "\n\n  ${GREEN}${BOLD}[✔] WPA2 4-way handshake captured!${RESET}"
    echo -e "  ${WHITE}Handshake file:${RESET} ${CYAN}/tmp/capture_$(date +%s).cap${RESET}"
    echo -e "  ${WHITE}BSSID          :${RESET} $(rand_mac)"
    echo -e "  ${WHITE}Station        :${RESET} $(rand_mac)"
    echo -e "\n  ${YELLOW}[*]${RESET} Initiating dictionary crack..."
    sleep 0.5
    progress_bar "Cracking WPA2 PSK" 35 "$CYAN"
    echo -e "\n  ${GREEN}${BOLD}  ★ PSK FOUND: ${WHITE}sunshine$(( RANDOM % 9999 ))${RESET}"
}

# ── Module 3: Bitcoin Miner ───────────────────────────────────
bitcoin_miner() {
    clear
    echo -e "\n  ${YELLOW}╔═══════════════════════════════════════════╗"
    echo -e "  ║     ₿   CRYPTO MINING CONTROLLER v2.8    ║"
    echo -e "  ╚═══════════════════════════════════════════╝${RESET}\n"

    echo -e "  ${WHITE}Select coin:${RESET}"
    echo -e "  ${GREY}[1]${RESET} Bitcoin (BTC)    ${GREY}[3]${RESET} Monero (XMR)"
    echo -e "  ${GREY}[2]${RESET} Ethereum (ETH)   ${GREY}[4]${RESET} Litecoin (LTC)"
    echo -ne "\n  ${CYAN}Coin>${RESET} "
    read coin_choice

    local coins=("" "Bitcoin (BTC)" "Ethereum (ETH)" "Monero (XMR)" "Litecoin (LTC)")
    local coin="${coins[${coin_choice:-1}]}"
    [ -z "$coin" ] && coin="Bitcoin (BTC)"

    echo -e "\n  ${YELLOW}[*]${RESET} Initializing mining engine for ${GREEN}${coin}${RESET}..."
    local init_steps=("Allocating GPU memory (8192MB VRAM)" "Compiling OpenCL kernels" "Connecting to mining pool: pool.ghost.onion:3333" "Subscribing to stratum protocol" "Validating wallet address")
    for s in "${init_steps[@]}"; do
        echo -ne "  ${GREY}       ${s}...${RESET}"
        sleep 0.35
        echo -e " ${GREEN}OK${RESET}"
    done

    echo -e "\n  ${GREY}──────────────────────────────────────────────${RESET}"
    echo -e "  ${WHITE}Wallet :${RESET} ${CYAN}1Dr$(rand_hex 28 | tr 'A-F' 'a-f' | head -c 28)${RESET}"
    echo -e "  ${WHITE}Pool   :${RESET} ${CYAN}pool.ghost.onion:3333${RESET}"
    echo -e "  ${WHITE}Workers:${RESET} ${GREEN}8 threads active${RESET}"
    echo -e "  ${GREY}──────────────────────────────────────────────${RESET}\n"

    echo -e "  ${BOLD}${YELLOW}⛏  MINING IN PROGRESS — Press CTRL+C to stop${RESET}\n"
    sleep 0.5

    local total_hashes=0
    local shares_accepted=0
    local shares_rejected=0
    local start_time=$(date +%s)

    for i in $(seq 1 40); do
        local hashrate=$((RANDOM % 500 + 800))
        total_hashes=$((total_hashes + hashrate * 2))
        local nonce=$(rand_hex 8)
        local job_id=$(rand_hex 4)
        local elapsed=$(( $(date +%s) - start_time ))

        if (( RANDOM % 6 == 0 )); then
            shares_accepted=$((shares_accepted + 1))
            echo -e "  ${GREEN}[SHARE +]${RESET} Accepted: Job ${CYAN}#${job_id}${RESET} | Diff: ${YELLOW}$((RANDOM % 512 + 64))k${RESET}"
        elif (( RANDOM % 20 == 0 )); then
            shares_rejected=$((shares_rejected + 1))
            echo -e "  ${RED}[SHARE -]${RESET} Rejected: Job ${CYAN}#${job_id}${RESET} (stale)"
        else
            printf "  ${GREY}[HASH  *]${RESET} Nonce: ${CYAN}0x%s${RESET} | ${YELLOW}%4d MH/s${RESET} | Elapsed: ${WHITE}%ds${RESET}\n" \
                   "$nonce" "$hashrate" "$elapsed"
        fi
        sleep 0.18
    done

    echo -e "\n  ${GREY}──────────────────────────────────────────────${RESET}"
    echo -e "  ${WHITE}Total Hashes  :${RESET} ${GREEN}$((total_hashes / 1000))K${RESET}"
    echo -e "  ${WHITE}Avg Hashrate  :${RESET} ${GREEN}$((RANDOM % 200 + 900)) MH/s${RESET}"
    echo -e "  ${WHITE}Shares Accept :${RESET} ${GREEN}${shares_accepted}${RESET}  Rejected: ${RED}${shares_rejected}${RESET}"
    echo -e "  ${WHITE}Est. Earnings :${RESET} ${YELLOW}₿ 0.0000$(( RANDOM % 9000 + 1000 ))${RESET}/day"
    echo -e "  ${GREY}──────────────────────────────────────────────${RESET}"
}

# ── Module 4: Network Scanner ─────────────────────────────────
network_scanner() {
    clear
    echo -e "\n  ${MAGENTA}╔═══════════════════════════════════════════╗"
    echo -e "  ║     🌐  NETWORK SCANNER & PORT MAPPER    ║"
    echo -e "  ╚═══════════════════════════════════════════╝${RESET}\n"

    echo -ne "  ${WHITE}Enter target IP range (e.g. 192.168.1.0/24):${RESET} "
    read target
    [ -z "$target" ] && target="192.168.1.0/24"

    echo -e "\n  ${YELLOW}[*]${RESET} Scanning ${CYAN}${target}${RESET} — SYN stealth scan...\n"
    sleep 0.3

    local ports=(21 22 23 25 53 80 110 143 443 445 3306 3389 5432 6379 8080 8443 27017)
    local services=("FTP" "SSH" "Telnet" "SMTP" "DNS" "HTTP" "POP3" "IMAP" "HTTPS" "SMB" "MySQL" "RDP" "PostgreSQL" "Redis" "HTTP-Alt" "HTTPS-Alt" "MongoDB")

    echo -e "  ${WHITE}HOST                 PORT      STATE   SERVICE    VERSION${RESET}"
    echo -e "  ${GREY}──────────────────────────────────────────────────────────────${RESET}"

    for i in {1..12}; do
        local ip=$(rand_ip)
        local port_idx=$((RANDOM % ${#ports[@]}))
        local port="${ports[$port_idx]}"
        local svc="${services[$port_idx]}"
        local state_r=$((RANDOM % 4))
        local state_label state_color
        if (( state_r == 0 )); then state_label="filtered" state_color="$GREY"
        elif (( state_r == 1 )); then state_label="closed  " state_color="$RED"
        else state_label="open    " state_color="$GREEN"
        fi
        printf "  ${CYAN}%-20s${RESET} ${WHITE}%-8s${RESET}  ${state_color}%-8s${RESET}${WHITE}%-10s${RESET} Apache/$(( RANDOM % 3 + 1 )).$(( RANDOM % 9 )).$(( RANDOM % 9 ))\n" \
               "$ip" "$port/tcp" "$state_label" "$svc"
        sleep 0.12
    done

    echo -e "\n  ${GREEN}[✔]${RESET} Scan complete | ${WHITE}12 hosts${RESET} | ${GREEN}7 open${RESET} | ${RED}3 closed${RESET} | ${GREY}2 filtered${RESET}"
}

# ── Module 5: Payload Injector ────────────────────────────────
payload_injector() {
    clear
    echo -e "\n  ${RED}╔═══════════════════════════════════════════╗"
    echo -e "  ║     💀  PAYLOAD INJECTOR v5.0            ║"
    echo -e "  ╚═══════════════════════════════════════════╝${RESET}\n"

    echo -ne "  ${WHITE}Target IP:${RESET} "
    read target_ip
    [ -z "$target_ip" ] && target_ip=$(rand_ip)

    echo -e "\n  ${YELLOW}[*]${RESET} Crafting polymorphic shellcode..."
    sleep 0.3

    echo -e "  ${GREY}"
    for i in {1..8}; do
        echo "  $(rand_hex 64)"
        sleep 0.08
    done
    echo -e "${RESET}"

    local steps=("Encoding with XOR cipher" "Applying base64 obfuscation" "Injecting NOP sled" "Patching return address" "Bypassing DEP/ASLR" "Establishing reverse shell")
    for s in "${steps[@]}"; do
        echo -ne "  ${CYAN}[>]${RESET} ${s}"
        for j in {1..3}; do echo -ne "."; sleep 0.2; done
        echo -e " ${GREEN}[OK]${RESET}"
    done

    echo -e "\n  ${GREEN}${BOLD}[✔] SHELL OBTAINED${RESET}"
    echo -e "  ${GREY}──────────────────────────────────────${RESET}"
    echo -e "  ${WHITE}Target  :${RESET} ${CYAN}${target_ip}:4444${RESET}"
    echo -e "  ${WHITE}Shell   :${RESET} ${GREEN}/bin/bash -i${RESET}"
    echo -e "  ${WHITE}UID     :${RESET} ${RED}${BOLD}root (0)${RESET}"
    echo -e "  ${WHITE}Hostname:${RESET} ${CYAN}server-$(rand_hex 4 | tr 'A-F' 'a-f')${RESET}"
    echo -e "  ${GREY}──────────────────────────────────────${RESET}"
    echo -e "\n  ${RED}root@${target_ip}${RESET}:${CYAN}~#${RESET} ${GREY}(simulated)${RESET}"
}

# ── Module 6: OSINT ───────────────────────────────────────────
osint_gatherer() {
    clear
    echo -e "\n  ${CYAN}╔═══════════════════════════════════════════╗"
    echo -e "  ║     🔍  OSINT INTELLIGENCE GATHERER      ║"
    echo -e "  ╚═══════════════════════════════════════════╝${RESET}\n"

    echo -ne "  ${WHITE}Enter target (email/domain/username):${RESET} "
    read target_osint
    [ -z "$target_osint" ] && target_osint="target@example.com"

    echo -e "\n  ${YELLOW}[*]${RESET} Initiating passive reconnaissance on ${CYAN}${target_osint}${RESET}\n"

    local sources=("HaveIBeenPwned" "Shodan.io" "LinkedIn" "Twitter/X" "GitHub" "WhoisXML" "VirusTotal" "Censys.io" "Pastebin Archives" "Dark Web Forums")
    for src in "${sources[@]}"; do
        echo -ne "  ${GREY}[QUERY]${RESET} Scanning ${WHITE}${src}${RESET}..."
        sleep $((RANDOM % 3 + 1))0.0
        sleep 0.3
        local found=$((RANDOM % 3))
        if (( found > 0 )); then
            echo -e " ${GREEN}${found} record(s) found${RESET}"
        else
            echo -e " ${GREY}no results${RESET}"
        fi
    done

    echo -e "\n  ${GREEN}${BOLD}[✔] OSINT Report Generated${RESET}"
    echo -e "  ${GREY}──────────────────────────────────────────${RESET}"
    echo -e "  ${WHITE}Target         :${RESET} ${CYAN}${target_osint}${RESET}"
    echo -e "  ${WHITE}Breaches Found :${RESET} ${RED}$((RANDOM % 5 + 1))${RESET}"
    echo -e "  ${WHITE}Leaked Passwords:${RESET} ${RED}$((RANDOM % 3 + 1))${RESET}"
    echo -e "  ${WHITE}Associated IPs :${RESET} ${YELLOW}$(rand_ip), $(rand_ip)${RESET}"
    echo -e "  ${WHITE}Social Profiles:${RESET} ${GREEN}3 found${RESET}"
    echo -e "  ${WHITE}Report saved to:${RESET} ${CYAN}/tmp/osint_$(date +%s).json${RESET}"
    echo -e "  ${GREY}──────────────────────────────────────────${RESET}"
}

# ── Module 7: Defense Evasion ─────────────────────────────────
defense_evasion() {
    clear
    echo -e "\n  ${MAGENTA}╔═══════════════════════════════════════════╗"
    echo -e "  ║     🛡️   DEFENSE EVASION MODULE v3.1      ║"
    echo -e "  ╚═══════════════════════════════════════════╝${RESET}\n"

    local ops=("Rotating TOR exit nodes" "Spoofing MAC address" "Clearing bash history" "Flushing DNS cache" "Enabling IP masquerade" "Patching kernel audit logs" "Rotating proxychains" "Randomizing TTL values")
    for op in "${ops[@]}"; do
        echo -ne "  ${CYAN}[EVADE]${RESET} ${op}"
        local dots=$((RANDOM % 3 + 2))
        for d in $(seq 1 $dots); do echo -ne "."; sleep 0.2; done
        echo -e " ${GREEN}✔${RESET}"
        sleep 0.1
    done

    echo -e "\n  ${GREEN}${BOLD}[✔] Stealth profile active${RESET}"
    echo -e "  ${WHITE}New identity :${RESET} ${CYAN}$(rand_ip)${RESET} via TOR"
    echo -e "  ${WHITE}MAC address  :${RESET} ${CYAN}$(rand_mac)${RESET} (spoofed)"
    echo -e "  ${WHITE}Anonymity    :${RESET} ${GREEN}${BOLD}HIGH${RESET}"
}

# ── Module 8: System Status ───────────────────────────────────
system_status() {
    clear
    echo -e "\n  ${WHITE}╔═══════════════════════════════════════════╗"
    echo -e "  ║     📊  SYSTEM STATUS DASHBOARD           ║"
    echo -e "  ╚═══════════════════════════════════════════╝${RESET}\n"

    echo -e "  ${GREY}System   :${RESET} Ghost OS 7.2 (Linux 6.8-GHOST)"
    echo -e "  ${GREY}Operator :${RESET} ${CYAN}Dr. Ashraf${RESET}  [${GREEN}OMEGA${RESET}]"
    echo -e "  ${GREY}Uptime   :${RESET} $((RANDOM % 30 + 1))d $((RANDOM % 24))h $((RANDOM % 60))m"
    echo -e "  ${GREY}Session  :${RESET} $(rand_hash | head -c 16)\n"

    # CPU bar
    local cpu=$((RANDOM % 60 + 30))
    echo -ne "  ${WHITE}CPU  ${RESET}["; for i in $(seq 1 $((cpu/5))); do echo -ne "${RED}█${RESET}"; done
    for i in $(seq $((cpu/5)) 20); do echo -ne "${GREY}░${RESET}"; done
    echo -e "] ${cpu}%"

    # RAM bar
    local ram=$((RANDOM % 40 + 40))
    echo -ne "  ${WHITE}RAM  ${RESET}["; for i in $(seq 1 $((ram/5))); do echo -ne "${YELLOW}█${RESET}"; done
    for i in $(seq $((ram/5)) 20); do echo -ne "${GREY}░${RESET}"; done
    echo -e "] ${ram}%"

    # NET bar
    local net=$((RANDOM % 50 + 20))
    echo -ne "  ${WHITE}NET  ${RESET}["; for i in $(seq 1 $((net/5))); do echo -ne "${CYAN}█${RESET}"; done
    for i in $(seq $((net/5)) 20); do echo -ne "${GREY}░${RESET}"; done
    echo -e "] ${net}% utilization\n"

    echo -e "  ${GREEN}●${RESET} TOR Proxy        ${GREEN}ACTIVE${RESET}   $(rand_ip)"
    echo -e "  ${GREEN}●${RESET} VPN Tunnel        ${GREEN}ACTIVE${RESET}   $(rand_ip)"
    echo -e "  ${YELLOW}●${RESET} Mining Daemon     ${YELLOW}IDLE${RESET}"
    echo -e "  ${RED}●${RESET} IDS/IPS Bypass    ${RED}WARNING${RESET} — rekey in 00:$(( RANDOM%59+1 )):$(( RANDOM%59+1 ))"
}

# ── Secure Exit ───────────────────────────────────────────────
secure_exit() {
    clear
    echo -e "\n  ${RED}[WIPE]${RESET} Initiating secure log wipe...\n"
    local wipe_items=("bash_history" "auth.log" "syslog" "wtmp" "lastlog" "DNS cache" "ARP table" "session tokens")
    for item in "${wipe_items[@]}"; do
        echo -ne "  ${GREY}Wiping ${item}...${RESET}"
        sleep 0.2
        echo -e " ${RED}DONE${RESET}"
    done
    echo -e "\n  ${YELLOW}[✔]${RESET} All traces removed."
    echo -e "  ${GREEN}[✔]${RESET} Session terminated."
    echo -e "\n  ${GREY}Stay in the shadows, Dr. Ashraf. 👁️${RESET}\n"
    exit 0
}

# ── Pause helper ──────────────────────────────────────────────
press_enter() {
    echo -e "\n  ${GREY}Press [ENTER] to return to main menu...${RESET}"
    read
}

# ══════════════════════════════════════════════════════════════
#   MAIN
# ══════════════════════════════════════════════════════════════

boot_sequence
sleep 1

while true; do
    main_menu
    read -p "" choice
    case "$choice" in
        1) password_cracker ; press_enter ;;
        2) wifi_hacker       ; press_enter ;;
        3) bitcoin_miner     ; press_enter ;;
        4) network_scanner   ; press_enter ;;
        5) payload_injector  ; press_enter ;;
        6) osint_gatherer    ; press_enter ;;
        7) defense_evasion   ; press_enter ;;
        8) system_status     ; press_enter ;;
        0) secure_exit ;;
        *) echo -e "\n  ${RED}[!] Invalid option${RESET}" ; sleep 0.8 ;;
    esac
done
