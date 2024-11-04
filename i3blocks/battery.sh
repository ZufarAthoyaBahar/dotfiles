#!/bin/bash
# use strict;
# use warnings;
# use utf8;

# my $acpi;
# my $status;
# my $percent;
# my $ac_adapt;
# my $full_text;
# my $short_text;
# my $bat_number = $ENV{BAT_NUMBER} || 1;
# my $label = $ENV{LABEL} || "";

# # read the first line of the "acpi" command output
# open (ACPI, "acpi -b 2>/dev/null| grep 'Battery $bat_number' |") or die;
# $acpi = <ACPI>;
# close(ACPI);

# # fail on unexpected output
# if (not defined($acpi)) {
#     # don't print anything to stderr if there is no battery
#     exit(0);
# }
# elsif ($acpi !~ /: ([\w\s]+), (\d+)%/) {
# 	die "$acpi\n";
# }

# $status = $1;
# $percent = $2;
# $full_text = "$label$percent%";

# if ($status eq 'Discharging') {
# 	$full_text .= ' DIS';
# } elsif ($status eq 'Charging') {
# 	$full_text .= ' CHR';
# } elsif ($status eq 'Unknown') {
# 	open (AC_ADAPTER, "acpi -a |") or die;
# 	$ac_adapt = <AC_ADAPTER>;
# 	close(AC_ADAPTER);

# 	if ($ac_adapt =~ /: ([\w-]+)/) {
# 		$ac_adapt = $1;

# 		if ($ac_adapt eq 'on-line') {
# 			$full_text .= ' CHR';
# 		} elsif ($ac_adapt eq 'off-line') {
# 			$full_text .= ' DIS';
# 		}
# 	}
# }

# $short_text = $full_text;

# if ($acpi =~ /(\d\d:\d\d):/) {
# 	$full_text .= " ($1)";
# }

# # print text
# print "$full_text\n";
# print "$short_text\n";

# # consider color and urgent flag only on discharge
# if ($status eq 'Discharging') {

# 	if ($percent < 20) {
# 		print "#FF0000\n";
# 	} elsif ($percent < 40) {
# 		print "#FFAE00\n";
# 	} elsif ($percent < 60) {
# 		print "#FFF600\n";
# 	} elsif ($percent < 85) {
# 		print "#A8FF00\n";
# 	}

# 	if ($percent < 5) {
# 		exit(33);
# 	}
# }

# exit(0);

capacity=$(cat /sys/class/power_supply/BAT1/capacity)
status=$(cat /sys/class/power_supply/BAT1/status)
remaining=$(acpi -b | grep -oP '\d{2}:\d{2}')  # Ekstrak waktu tersisa

# Warna Hex untuk i3blocks
COLOR_GE80="#00FF00"   # Hijau
COLOR_GE60="#FFF600"   # Kuning
COLOR_GE40="#FFAE00"   # Kuning-oranye
COLOR_LOWR="#F75736"   # Merah
COLOR_DEFAULT="#FFFFFF" # Default warna (putih)

if [ "$status" = "Charging" ]; then
    icon=""
    color=$COLOR_GE80
elif [ "$capacity" -ge 90 ]; then
    icon="󰁹"  # Full
    color=$COLOR_GE80
elif [ "$capacity" -ge 80 ]; then
    icon="󰂂"  # Full
    color=$COLOR_GE80
elif [ "$capacity" -ge 70 ]; then
    icon="󰂁"  # 80%+
    color=$COLOR_GE60
elif [ "$capacity" -ge 60 ]; then
    icon="󰂀"  # 60%+
    color=$COLOR_GE60
elif [ "$capacity" -ge 50 ]; then
    icon="󰁿"  # 40%+
    color=$COLOR_GE60
elif [ "$capacity" -ge 40 ]; then
    icon="󰁾"  # 40%+
    color=$COLOR_GE60
elif [ "$capacity" -ge 30 ]; then
    icon="󰁽"  # 30%+
    color=$COLOR_GE40
elif [ "$capacity" -ge 20 ]; then
    icon="󰁼"  # 20%+
    color=$COLOR_LOWR
elif [ "$capacity" -ge 10 ]; then
    icon="󰁻"  # 10%+
    color=$COLOR_LOWR
else
    icon="󰁺"  # Low
    color=$COLOR_LOWR
fi

# Output ke i3blocks:
# Baris pertama: Teks lengkap
# Baris kedua: Teks singkat (opsional, bisa sama dengan baris pertama)
# Baris ketiga: Warna

if [ -n "$remaining" ]; then
    echo "$icon $capacity% ($remaining)"
else
    echo "$icon $capacity%"
fi

echo "$icon $capacity%"  # Baris kedua (opsional, sama dengan baris pertama)

echo "$color"  # Baris ketiga untuk warna
