# file "AwkLab.data"
# separator is a :
# first field is the Name which have two words separated by a space
# coluns -> name:phone:balance:num:contribution

# 1. Print all the First Names in file "AwkLab.data" $1 contains full name print only the first name
echo "1."
awk -F: '{print $1}' AwkLab.data | awk '{print $1}'

# 2. Print phone numbers for Tom and Frodo after their names
echo "2."
awk -F: '$1 ~ /Tom|Frodo/ {print $1, $2}' AwkLab.data

# 3. Print Peregrin’s full name and phone number area code only.
echo "3."
awk -F: '$1 ~ /Peregrin/ {print $1, $2}' AwkLab.data | awk '{print $1, $2, substr($3,2,3)}'

# 4. Print all phone numbers (full number) in the 123 area code along with the names
echo "4."
# awk -F: '$2 ~ /123/ {print $1, $2, $3}' AwkLab.data

# 5. Print all Last names beginning with either a T or D (careful of middle names!)
echo "5."
# awk -F: ' {print $1}' AwkLab.data | awk '{if (length($3) > 1) {print $3} else {print $2}}' | awk '/^T|^D/'

# 6. Print all first names containing four or less characters.
echo "6."
awk -F: '{print $1}' AwkLab.data | awk '{print $1}' | awk 'length($1) <= 4'
# 7. Print the first names and area codes of all those in the 916 area code.
echo "7."
# awk -F: '$2 ~ /916/ {print $1, $2, $3}' AwkLab.data | awk '{print $1, substr($3,2,3)}'

# 8. Print Sacharissa’s campaign contributions following her name. Each
# value should be printed with a leading dollar sign; e.g., $250 $100 $175.
echo "8."
awk -F: '$1 ~ /Sacharissa/ {print $1,"$"$5}' AwkLab.data

# 9. Print last names followed by a comma and the phone number. Be
# careful of the last names’s format
echo "9."
awk -F: '{print $1, $2}' AwkLab.data | awk '{if(length($6) > 1) {print $3,", " $4, $5} else {print $2,", " $3, $4}}'

# 10. Print the first and last names of those who contributed more than $110
# in the last month. Make sure to include their last month contribution
# amount after the name
echo "10."
awk -F: '($5 > 110) {print $1, "$"$5}' AwkLab.data | awk '(length($4) > 1) {print $1,  $3, $4} (length($4) <= 1) {print $1, $2, $3}'

# 11. Print the last names, phone numbers, and first month contribution of
# those who contributed less than $150 in the first month.
echo "11."
awk -F : '($4 < 150) {print $1, $2, $4}' AwkLab.data | awk '{if (length($6) > 1) {print $3, $4, $5} else {print $2, $3, $4}}'

# 12. Print the first names and contribution of those who contributed between $10 and $200 in the first month.
echo "12."
awk -F: '($4 > 10 && $4 < 200) {print $1, $4}' AwkLab.data | awk '{print $1, $2, $3}'

# 13. Print the first name, last names and total contributions of those who
# contributed less than $700 over the three-month period.
echo "13."
awk -F: '($4 + $5 + $6 < 700) {print $1, $4 + $5 + $6}' AwkLab.data | awk '(length($4) > 1) {print $1, $3, "$"$4} (length($4) <= 1) {print $1, $2, "$"$3}'

# 14. Print the first names and first letter of the last name, and average
# contribution of those who had an average contribution of more then $300
echo "14."
awk -F: '($4 + $5 + $6) / 3 > 300 {print $1, $4 + $5 + $6}' AwkLab.data | awk '{print $1, substr($2,1,1), ($3 / 3)}'


# 15. Print the last name and area code of those not in the 916 area code
echo "15."
awk -F: '$2 !~ /916/ {print $1, $2}' AwkLab.data | awk '{if (length($5) > 1) {print $3, substr($4,2,3)} else {print $2, substr($3,2,3)}}'


# 16. Print each record preceded by the number of the record 
echo "16."
awk -F: '{print NR, $0}' AwkLab.data

# 17. Print the name and total contribution of each person.
echo "17."
awk -F: '{print $1, $4 + $5 + $6}' AwkLab.data | awk '(length($4) > 1) {print $1, $3, "$"$4} (length($4) <= 1) {print $1, $2, "$"$3}'

# 18. Add $10 to Tiffany Aching’s first contribution and print her full name
# and first contribution.
echo "18."
awk -F: '$1 ~ /Tiffany/ {print $1,"$" $4 + 10}' AwkLab.data

# 19. Change Samwise Gamgee’s name to Sean Astin
echo "19."   
awk -F: '$1 ~ /Samwise/ {print " Sean Astin", $2, $3, $4, $5, $6} $1 !~ /Samwise/ {print $0}' AwkLab.data > temp
# cat temp 



