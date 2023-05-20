#! /bin/bash

IP=0
PORT=0
WORDLIST=0
findwordlist()
{
  # TODO: add search from root
  PATH=/foo/bar
  if [ -f $PATH ]; then
    WORDLIST=$PATH
    echo "File Found"
    return 
  fi
  echo "File not Found"
}

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

# ! Check that everything works correctly

findwordlist
nmap IP &
gobuster -u $IP -w $WORDLIST

