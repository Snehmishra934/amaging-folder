#!/bin/bash

# Get birthdate
read -p "Enter your birthdate (YYYY-MM-DD): " birthdate

# Validate date
if ! date -d "$birthdate" &>/dev/null; then
    echo "Invalid date format. Please use YYYY-MM-DD."
    exit 1
fi

# Extract date components
IFS='-' read -r year month day <<< "$birthdate"
month=$((10#$month))
day=$((10#$day))

# Determine zodiac sign
determine_zodiac() {
    if (( month == 1 )); then
        (( day <= 19 )) && echo "Capricorn" || echo "Aquarius"
    elif (( month == 2 )); then
        (( day <= 18 )) && echo "Aquarius" || echo "Pisces"
    elif (( month == 3 )); then
        (( day <= 20 )) && echo "Pisces" || echo "Aries"
    elif (( month == 4 )); then
        (( day <= 19 )) && echo "Aries" || echo "Taurus"
    elif (( month == 5 )); then
        (( day <= 20 )) && echo "Taurus" || echo "Gemini"
    elif (( month == 6 )); then
        (( day <= 20 )) && echo "Gemini" || echo "Cancer"
    elif (( month == 7 )); then
        (( day <= 22 )) && echo "Cancer" || echo "Leo"
    elif (( month == 8 )); then
        (( day <= 22 )) && echo "Leo" || echo "Virgo"
    elif (( month == 9 )); then
        (( day <= 22 )) && echo "Virgo" || echo "Libra"
    elif (( month == 10 )); then
        (( day <= 22 )) && echo "Libra" || echo "Scorpio"
    elif (( month == 11 )); then
        (( day <= 21 )) && echo "Scorpio" || echo "Sagittarius"
    elif (( month == 12 )); then
        (( day <= 21 )) && echo "Sagittarius" || echo "Capricorn"
    fi
}

# Get prediction
get_prediction() {
    case $1 in
        Aries)        echo "This week brings bold opportunities! Expect unexpected adventures." ;;
        Taurus)       echo "Financial gains are likely. Stay grounded and trust your instincts." ;;
        Gemini)       echo "Your social circle will expand. Important news arrives Wednesday." ;;
        Cancer)       echo "Focus on home life. A nostalgic reunion is coming soon." ;;
        Leo)          echo "Creativity peaks! Shine bright and others will follow your lead." ;;
        Virgo)        echo "Organization leads to success. Health improvements are likely." ;;
        Libra)        echo "Balance is key. A important relationship decision approaches." ;;
        Scorpio)      echo "Mystery surrounds you. Trust your intuition for hidden truths." ;;
        Sagittarius)  echo "Travel opportunities arise. Philosophical insights will guide you." ;;
        Capricorn)    echo "Career progress ahead. Long-term plans start coming together." ;;
        Aquarius)     echo "Innovation strikes! Your unique ideas will attract attention." ;;
        Pisces)       echo "Artistic inspiration flows. Pay attention to dream messages." ;;
    esac
}

# Main execution
zodiac_sign=$(determine_zodiac)
echo -e "\n=== Stellar Insights for $zodiac_sign ==="
get_prediction "$zodiac_sign"
echo -e "\n[Remember: Astrology is for fun! Your future is yours to create.]"
