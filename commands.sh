#! /bin/bash

IP=0
PORT=0


help()
{
    echo
    echo "  {-n} machine name              -- Set source directory (default: .)"
    echo "  {-i} IP address of the target  -- Set destination"
    echo "  {-p} port                      -- Set port number (default: 1234)"
    echo "  {-h}                           -- Print this help message and exit"
    exit 0
}

while getopts "n:i:p:h" opt; do
  case $opt in
    n)
      echo "[X] Name Provided, creating a directory named: $OPTARG under $PWD to save scans." >&2
      ;;
    i)
      IP = $OPTARG
      echo $IP
      ;;
    p)
      PORT = $OPTARG
      echo $IP
      ;;

    h)
      help
      ;;
    \?)
      help
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
    :)
      help
      echo "Option -$OPTARG requires an argument." >&2
      exit 1
      ;;
    *)
      help
      ;;
  esac
done

# Add Check for both IP and PORT and if both are legal run Nmap scan, Gobuster dir + dns as a starter.
# Testing