#!/bin/bash
echo none > /sys/class/leds/beaglebone:green:usr0/trigger
echo heartbeat > /sys/class/leds/beaglebone:green:usr0/trigger