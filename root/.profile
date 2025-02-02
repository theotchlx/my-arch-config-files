
source .bashrc

#---

neofetch

#---

# Function to get CPU temperature (if available)
get_cpu_temp() {
    if [ -f /sys/class/thermal/thermal_zone0/temp ]; then
        temp=$(cat /sys/class/thermal/thermal_zone0/temp)
        echo "CPU Temp: $((temp / 1000))°C"
    else
        echo "CPU Temp: Not available"
    fi
}

# Function to get fan speed (if available)
get_fan_speed() {
    fan_speed_file=$(find /sys/class/hwmon/ -name "fan*_input" 2>/dev/null | head -n 1)
    if [ -n "$fan_speed_file" ]; then
        speed=$(cat "$fan_speed_file")
        echo "Fan Speed: $speed RPM"
    else
        echo "Fan Speed: Not available"
    fi
}

# Function to get battery status (if available)
get_battery_status() {
    if [ -d /sys/class/power_supply/BAT0 ]; then
        charge=$(cat /sys/class/power_supply/BAT0/capacity)
        status=$(cat /sys/class/power_supply/BAT0/status)
        echo "Battery: $charge% ($status)"
    else
        echo "Battery: No battery detected"
    fi
}

# Show once.
echo "System Monitor (using /sys)"
echo "---------------------------"
get_cpu_temp
get_fan_speed
get_battery_status
echo "---------------------------"

#---

cal -w -n 2 -c 1
echo "Who's the boss again?"

#---

