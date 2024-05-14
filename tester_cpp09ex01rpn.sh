#! /bin/bash

# ------------------------------------------------------------------------------
# 				------- EX 01 REVERSE POLISH NOTATION -------
# ------------------------------------------------------------------------------

dir=./
exec="./RPN"

#turn bool_ to 0 to skip specific tests
bool_makefile=1

# const
ITA="\033[3m"
BOLD="\033[1m"
UNDERL="\033[4m"
GREEN="\033[32m"
RED="\033[31m"
YEL="\033[33m"
END="\033[m"
BLU_BG="\033[36;1m"
YEL_BG="\033[43;1m"
RED_BG="\033[41;1m"

# print intro
echo "------------------------------------"
echo "------------------------------------"
echo -e "${BOLD}CPP module 09 exo 00 Tester${END}"
echo -e "Started at $(date +%R) - $(date +"%d %B %Y")"
echo -e "by $USER on $(uname) os"
echo -e "made by bguillau (@bastienkody)"
echo "------------------------------------"
echo "------------------------------------"

# ------------------------------------------------------------------------------
#				-----		MAKEFILE		-----
# ------------------------------------------------------------------------------
if [[ $bool_makefile == 1 ]] ; then 
echo -e "${YEL_BG}Makefile${END}"

#---------------
# makefile relink
echo -ne "${BLU_BG}Test Makefile${END}\t"
make re 1>/dev/null 2> stderrmake.txt
sleep 1
make  > stdoutmakebis.txt 2>&1
[[ -s stderrmake.txt ]] && echo -ne "${RED}make wrote on std err${END}" || echo -ne "${GREEN}no make error${END}" 
echo -n " -- "
cat stdoutmakebis.txt | egrep -viq "(nothin|already|date)" && echo -e "${RED}makefile relink?${END}" || echo -e "${GREEN}no relink${END}"
rm -rf stderrmake.txt stdoutmakebis.txt

#-------------------------
# makefile : flags and rule
echo -ne "${BLU_BG}Makefile flags${END}\t"
grep -sq -- "-Wall" Makefile && echo -ne "${GREEN}OK (-Wall)${END}" || echo -ne "${RED}-Wall not found${END}"
echo -n " -- "
grep -sq -- "-Wextra" Makefile && echo -ne "${GREEN}OK (-Wextra)${END}" || echo -ne "${RED}-Wextra not found${END}"
echo -n " -- "
grep -sq -- "-Werror" Makefile && echo -ne "${GREEN}OK (-Werror)${END}" || echo -ne "${RED}-Werror not found${END}"
echo -n " -- "
grep -sq -- "-std=c++98" Makefile && echo -ne "${GREEN}OK (std c++98)${END}" || echo -ne "${RED}Flag -std=c++98 not found${END}"
echo ""


else make >/dev/null ; fi

# ------------------------------------------------------------------------------
#				-----		TESTS		-----
# ------------------------------------------------------------------------------

################################################################################
echo -e "${YEL_BG}Arg error tests (format)${END}"

echo -e "${BLU_BG}0 -\t${exec} (no arg)${END}\t"
${exec}
echo "----------------------------------------------------------------"

echo -e "${BLU_BG}1 -\t${exec} jesuispasunrpn (word)${END}\t"
${exec} jesuispasunrpn
echo "----------------------------------------------------------------"

echo -e "${BLU_BG}2 -\t${exec} word1 word2 (multiword) ${END}\t"
${exec} word1 word2
echo "----------------------------------------------------------------"

echo -e "${BLU_BG}3 -\t${exec} \"1 1 +\" \"1 1 -\" (multi rpn arg) ${END}\t"
${exec} "1 1 +" "1 1 -"
echo "----------------------------------------------------------------"

echo -e "${BLU_BG}4 -\t${exec} \"1  1   +\" (lots of spaces : up to you to handle) ${END}\t"
${exec} "1  1   +"
echo "----------------------------------------------------------------"

echo -e "${BLU_BG}5 -\t${exec} \" 1 1 + \" (lead/preceding single space : up to you to handle) ${END}\t"
${exec} " 1 1 + "
echo "----------------------------------------------------------------"

echo -e "${BLU_BG}6 -\t${exec} \"  1 1 +   \" (lead/preceding multiple spaces : up to you to handle) ${END}\t"
${exec} "  1 1 +   "
echo "----------------------------------------------------------------"

echo -e "${BLU_BG}7 -\t${exec} \"1	1	+	\" (tabs) ${END}\t"
${exec} "1	1	+"
echo "----------------------------------------------------------------"

echo -e "${BLU_BG}8 -\t${exec} \"11+\" (no space) ${END}\t"
${exec} "11+"
echo "----------------------------------------------------------------"

################################################################################
echo -e "${YEL_BG}Arg error tests (rpn wrong data)${END}"

echo -e "${BLU_BG}0 -\t${exec} \"1\" (solo nb) ${END}\t"
${exec} "1"
echo "----------------------------------------------------------------"

echo -e "${BLU_BG}0bis -\t${exec} \"1 2 3\" (multi nb) ${END}\t"
${exec} "1 2 3"
echo "----------------------------------------------------------------"

echo -e "${BLU_BG}1 -\t${exec} \"+\" (solo ope) ${END}\t"
${exec} "+"
echo "----------------------------------------------------------------"

echo -e "${BLU_BG}1 -\t${exec} \"+ - *\" (multi ope) ${END}\t"
${exec} "+ - *"
echo "----------------------------------------------------------------"

echo -e "${BLU_BG}2 -\t${exec} \"1 +\" (one nb one ope) ${END}\t"
${exec} "1 +"
echo "----------------------------------------------------------------"

echo -e "${BLU_BG}3 -\t${exec} \"+ 1\" (one ope one nb) ${END}\t"
${exec} "+ 1"
echo "----------------------------------------------------------------"

echo -e "${BLU_BG}4 -\t${exec} \"1 + +\" (ope > nb) ${END}\t"
${exec} "1 + +"
echo "----------------------------------------------------------------"

echo -e "${BLU_BG}5 -\t${exec} \"+ 1 +\" (ope > nb) ${END}\t"
${exec} "+ 1 +"
echo "----------------------------------------------------------------"

echo -e "${BLU_BG}6 -\t${exec} \"+ + 1\" (ope > nb) ${END}\t"
${exec} "+ + 1"
echo "----------------------------------------------------------------"

echo -e "${BLU_BG}7 -\t${exec} \"+ 1 + 1\" (ope == nb) ${END}\t"
${exec} "+ 1 + 1"
echo "----------------------------------------------------------------"

echo -e "${BLU_BG}8 -\t${exec} \"+ + 1 1\" (ope == nb) ${END}\t"
${exec} "+ + 1 1"
echo "----------------------------------------------------------------"

echo -e "${BLU_BG}9 -\t${exec} \"1 + + 1\" (ope == nb) ${END}\t"
${exec} "1 + + 1"
echo "----------------------------------------------------------------"

echo -e "${BLU_BG}10 -\t${exec} \"1 1 + +\" (ope == nb) ${END}\t"
${exec} "1 1 + +"
echo "----------------------------------------------------------------"

echo -e "${BLU_BG}11 -\t${exec} \"12 33 + 42 -\" (nb > 10) ${END}\t"
${exec} "12 33 + 42 -"
echo "----------------------------------------------------------------"

echo -e "${BLU_BG}12 -\t${exec} \"1 3 + 420 -\" (nb > 10) ${END}\t"
${exec} "1 3 + 420 -"
echo "----------------------------------------------------------------"

echo -e "${BLU_BG}13 -\t${exec} \"1 2 %\" (bad ope) ${END}\t"
${exec} "1 2 %"
echo "----------------------------------------------------------------"

echo -e "${BLU_BG}14 -\t${exec} \"1 2 + 3 - 5 =\" (bad ope) ${END}\t"
${exec} "1 2 + 3 - 5 ="
echo "----------------------------------------------------------------"

echo -e "${BLU_BG}15 -\t${exec} \"1 - 2 3 + 5 +\" (bad order) ${END}\t"
${exec} "1 - 2 3 + 5 +"
echo "----------------------------------------------------------------"

echo -e "${BLU_BG}16 -\t${exec} \"- + 5 + 4 3 7\" (bad order) ${END}\t"
${exec} "- + 5 + 4 3 7"
echo "----------------------------------------------------------------"

echo -e "${BLU_BG}17 -\t${exec} \"+5 +4 -\" (positive nb with a + : up to you to handle) ${END}\t"
${exec} "+5 +4 -"
echo "----------------------------------------------------------------"

echo -e "${BLU_BG}18 -\t${exec} \"1 2 3 4 + + -\" (other rpn format : should be handled?) ${END}\t"
${exec} "1 2 3 4 + + -"
echo "----------------------------------------------------------------"

echo -e "${BLU_BG}19 -\t${exec} \"1.4 1.34 +\" (not integer) ${END}\t"
${exec} "1.4 1.34 +"
echo "----------------------------------------------------------------"

################################################################################
echo -e "${YEL_BG}Calculation test (only valid data)${END}"

echo -e "${BLU_BG}0 -\t${exec} \"1 1 +\" (expected: 2) ${END}\t"
${exec} "1 1 +"
echo "----------------------------------------------------------------"

echo -e "${BLU_BG}0bis -\t${exec} \"-1 -1 +\" (expected: -2) ${END}\t"
${exec} "-1 -1 +"
echo "----------------------------------------------------------------"

echo -e "${BLU_BG}1 -\t${exec} \"2 3 *\" (expected: 6) ${END}\t"
${exec} "2 3 *"
echo "----------------------------------------------------------------"

echo -e "${BLU_BG}2 -\t${exec} \"2 3 -\" (expected: -1) ${END}\t"
${exec} "2 3 -"
echo "----------------------------------------------------------------"

echo -e "${BLU_BG}3 -\t${exec} \"8 2 /\" (expected: 4) ${END}\t"
${exec} "8 2 /"
echo "----------------------------------------------------------------"

echo -e "${BLU_BG}4 -\t${exec} \"8 2 / 4 + 1 - 9 * 3 +\" (expected: 66) ${END}\t"
${exec} "8 2 / 4 + 1 - 9 * 3 +"
echo "----------------------------------------------------------------"

echo -e "${BLU_BG}5 -\t${exec} \"8 2 / 4 + 1 - 9 * 3 + -1 *\" (expected: -66) ${END}\t"
${exec} "8 2 / 4 + 1 - 9 * 3 + -1 *"
echo "----------------------------------------------------------------"

echo -e "${BLU_BG}6 -\t${exec} \"8 2 4 1 9 3 / + - * +\" (other rpn format, expected: 8) ${END}\t"
${exec} "8 2 4 1 9 3 / + - * +"
echo "----------------------------------------------------------------"

# ------------------------------------------------------------------------------
#				-----		OUTRO		-----
# ------------------------------------------------------------------------------
make fclean &>/dev/null
