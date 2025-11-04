#!/bin/bash

systemctl enable podman.socket
systemctl enable sddm.service
systemctl set-default graphical.target
