#!/bin/bash

function coraltpu {
  param=$1
  
  if [ ! -d /usr/local/lib/python3.7/dist-packages/edgetpu/ ] ; then
    warn "Error: the Coral TPU python environment is not installed"
    echo "You can install it using the command:"
    echo "$(basename "$0") coraltpu install"
    echo ""
    echo "To install them manually, run:";    
    echo "sudo apt-get update"
    echo "wget https://dl.google.com/coral/edgetpu_api/edgetpu_api_latest.tar.gz -O edgetpu_api.tar.gz --trust-server-names"
    echo "tar xzf edgetpu_api.tar.gz"
    echo "sudo edgetpu_api/install.sh"
  fi

if [ -e /sys/bus/iio/devices/iio:device0 ]; then # Checks if board is attached
  case "$param" in
    "demo-on") # Start the demo until next reboot
      nohup python3 /usr/lib/python3/dist-packages/coral/enviro/enviro_demo.py &>/dev/null &
      echo "Success: the Coral Environmental board is now displaying sensor information.";
      echo "The board's display will turn off on reboot."
      ;;
    "demo-always-on") # Starts the demo, and activates it on reboot
      nohup python3 /usr/lib/python3/dist-packages/coral/enviro/enviro_demo.py &>/dev/null &
      ( crontab -l | grep -v -F "$cronjob" ; echo "$cronjob" ) | crontab -
      echo "Success: the Coral Environmental board is now displaying sensor information.";
      echo "The board's display will persist on reboot."
      ;;
    "demo-off") # Stops the demo and deactivates it on reboot
      ( crontab -l | grep -v -F "$croncmd" ) | crontab -
      pkill enviro_demo;
      echo "Success: the Coral Environmental board demo is now stopped.";
      echo "The board's display will turn off on reboot."
      ;;
    "install") # Installs the prequisite packages
      grep -qF 'deb https://packages.cloud.google.com/apt coral-cloud-stable main' '/etc/apt/sources.list.d/treehouses.list' || echo 'deb https://packages.cloud.google.com/apt coral-cloud-stable main' | tee -a '/etc/apt/sources.list.d/treehouses.list'
      curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -;
      apt update;
      apt install -y python3-coral-enviro;
      reboot_needed;
      echo "Please reboot your Raspberry Pi."
      ;;
    *)
      echo "Error: only 'demo-on', 'demo-always-on', 'demo-off' and 'install' options are supported"
      ;;
    esac
  else
    echo "Coral Environmmental Board not detected" && exit 1
  fi
}

# Prints the options for the "coralenv" command
function coralenv_help {
  echo ""
  echo "Usage: $(basename "$0") coralenv <demo-on|demo-always-on|demo-off|help>"
  echo ""
  echo "Controls the Environmental Board"
  echo ""
  echo "Example:"
  echo "  $(basename "$0") coralenv install"
  echo "      Installs the for coral environmental board necessary python packages."
  echo ""
  echo "  $(basename "$0") coralenv demo-on"
  echo "      Starts the Coral Environmental board demo."
  echo "      The Coral Environmental board will be displaying sensor information."
  echo "      The board's display will turn off on reboot."
  echo ""
  echo "  $(basename "$0") coralenv demo-always-on"
  echo "      Starts the Coral Environmental board demo."
  echo "      The board's display will persist on reboot."
  echo ""
  echo "  $(basename "$0") coralenv demo-off"
  echo "      Stops the demo and the board's display will turn off on reboot."
} 