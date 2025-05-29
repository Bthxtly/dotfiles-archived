#!/usr/bin/env sh

playerctl metadata --format '{{title}} - {{artist}} {{duration(position)}}|{{duration(mpris:length)}}'
