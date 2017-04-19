#!/bin/bash
sudo dmidecode | grep -q ThinkPad && echo true || echo false
