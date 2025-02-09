#!/bin/bash

SCRIPTPATH=$(realpath "$0")
SCRIPTFOLDER=$(dirname "$SCRIPTPATH")

source "$SCRIPTFOLDER/modules/detectrpi.sh" 
source "$SCRIPTFOLDER/modules/globals.sh"
source "$SCRIPTFOLDER/modules/ap.sh"
source "$SCRIPTFOLDER/modules/apchannel.sh"
source "$SCRIPTFOLDER/modules/bluetooth.sh"
source "$SCRIPTFOLDER/modules/bluetoothid.sh"
source "$SCRIPTFOLDER/modules/bridge.sh"
source "$SCRIPTFOLDER/modules/burn.sh"
source "$SCRIPTFOLDER/modules/button.sh"
source "$SCRIPTFOLDER/modules/bootoption.sh"
source "$SCRIPTFOLDER/modules/container.sh"
source "$SCRIPTFOLDER/modules/default.sh"
source "$SCRIPTFOLDER/modules/detect.sh"
source "$SCRIPTFOLDER/modules/ethernet.sh"
source "$SCRIPTFOLDER/modules/expandfs.sh"
source "$SCRIPTFOLDER/modules/feedback.sh"
source "$SCRIPTFOLDER/modules/internet.sh"
source "$SCRIPTFOLDER/modules/help.sh"
source "$SCRIPTFOLDER/modules/image.sh"
source "$SCRIPTFOLDER/modules/led.sh"
source "$SCRIPTFOLDER/modules/locale.sh"
source "$SCRIPTFOLDER/modules/memory.sh"
source "$SCRIPTFOLDER/modules/temperature.sh"
source "$SCRIPTFOLDER/modules/networkmode.sh"
source "$SCRIPTFOLDER/modules/ntp.sh"
source "$SCRIPTFOLDER/modules/password.sh"
source "$SCRIPTFOLDER/modules/openvpn.sh"
source "$SCRIPTFOLDER/modules/rebootneeded.sh"
source "$SCRIPTFOLDER/modules/rename.sh"
source "$SCRIPTFOLDER/modules/restore.sh"
source "$SCRIPTFOLDER/modules/rtc.sh"
source "$SCRIPTFOLDER/modules/services.sh"
source "$SCRIPTFOLDER/modules/ssh.sh"
source "$SCRIPTFOLDER/modules/sshkey.sh"
source "$SCRIPTFOLDER/modules/sshtunnel.sh"
source "$SCRIPTFOLDER/modules/staticwifi.sh"
source "$SCRIPTFOLDER/modules/timezone.sh"
source "$SCRIPTFOLDER/modules/tor.sh"
source "$SCRIPTFOLDER/modules/upgrade.sh"
source "$SCRIPTFOLDER/modules/version.sh"
source "$SCRIPTFOLDER/modules/vnc.sh"
source "$SCRIPTFOLDER/modules/wifi.sh"
source "$SCRIPTFOLDER/modules/wificountry.sh"
source "$SCRIPTFOLDER/modules/clone.sh"
source "$SCRIPTFOLDER/modules/coralenv.sh"
source "$SCRIPTFOLDER/modules/speedtest.sh"



case $1 in
  expandfs)
    checkrpi
    checkroot
    expandfs
    ;;
  rename)
    checkroot
    rename "$2"
    ;;
  password)
    checkrpi
    checkroot
    password "$2"
    ;;
  sshkey)
    checkroot
    shift
    sshkey "$@"
    ;;
  version)
    version
    ;;
  image)
    image
    ;;
  detect)
    detect
    ;;
  detectrpi)
    detectrpi
    ;;
  wifi)
    checkrpi
    checkroot
    wifi "$2" "$3"
    ;;
  staticwifi)
    checkrpi
    checkroot
    staticwifi "$2" "$3" "$4" "$5" "$6" "$7"
    ;;
  container)
    checkrpi
    checkroot
    container "$2"
    ;;
  bluetooth)
    checkrpi
    checkroot
    bluetooth "$2"
    ;;
  bluetoothid)
    checkrpi
    bluetoothid "$2"
    ;;
  ethernet)
    checkrpi
    checkroot
    ethernet "$2" "$3" "$4" "$5"
    ;;
  ap)
    checkrpi
    checkroot
    shift
    ap "$@"
    ;;
  timezone)
    checkroot
    timezone "$2"
    ;;
  locale)
    checkroot
    locale "$2"
    ;;
  ssh)
    checkroot
    ssh "$2"
    ;;
  vnc)
    checkroot
    vnc "$2"
    ;;
  default)
    checkroot
    default "$2"
    ;;
  upgrade)
    shift
    upgrade "$@"
    ;;
  bridge)
    checkrpi
    checkroot
    shift
    bridge "$@"
    ;;
  wificountry)
    checkrpi
    checkroot
    wificountry "$2"
    ;;
  sshtunnel)
    checkroot
    sshtunnel "$2" "$3" "$4"
    ;;
  led)
    checkrpi
    led "$2" "$3"
    ;;
  rtc)
    checkrpi
    checkroot
    rtc "$2" "$3"
    ;;
  ntp)
    checkrpi
    checkroot
    ntp "$2"
    ;;
  networkmode)
    networkmode "$2"
    ;;
  button)
    checkrpi
    checkroot
    button "$2"
    ;;
  feedback)
    shift
    feedback "$*"
    ;;
  apchannel)
    checkrpi
    shift
    apchannel "$1"
    ;;
  clone)
    checkrpi
    checkroot
    shift
    clone "$1"
    ;;
  restore)
    checkrpi
    checkroot
    shift
    restore "$1"
    ;;
  burn)
    checkrpi
    checkroot
    shift
    burn "$1"
    ;;
  rebootneeded)
    rebootneeded
    ;;
  internet)
    internet
    ;;
  services)
    shift
    services "$@"
    ;;
  tor)
    checkroot
    shift
    tor "$@"
    ;;
  bootoption)
    checkrpi
    checkroot
    shift
    bootoption "$*"
    ;;
  openvpn)
    checkroot
    shift
    openvpn "$@"
    ;;
  coralenv)
    checkrpi
    checkroot
    shift
    coralenv "$@"
    ;;
  memory)
    shift
    memory "$@"
    ;;
  temperature)
    checkrpi
    temperature "$2"
    ;;
  speedtest)
    shift
    speedtest "$@"
    ;;
  help)
    help "$2"
    ;;
  *)
    help
    ;;
esac
