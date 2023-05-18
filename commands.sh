#! /bin/bash

help()
{
    echo
    echo "  {-n} machine name              -- Set source directory (default: .)"
    echo "  {-a} IP address of the target  -- Set destination"
    echo "  {-p} port                      -- Set port number (default: 1234)"
    echo "  {-h|--help}                    -- Print this help message and exit"
    exit 0
}

case 
