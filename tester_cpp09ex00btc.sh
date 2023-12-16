#! /bin/bash

# ------------------------------------------------------------------------------
# 					------- EX 00 BTC EXCHANGE-------
# ------------------------------------------------------------------------------

#	expected files : Makefile, main.cpp, BitcoinExchange.{cpp, hpp} in repo ex00
dir=./ex00/
exec="./ex00/btc"

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
BLU_BG="\033[44m"
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
echo -ne "${BLU_BG}Test Makefile${END}\t\t"
make re -C $dir 1>/dev/null 2> stderrmake.txt
make -C $dir > stdoutmakebis.txt 2>&1
[[ -s stderrmake.txt ]] && echo -ne "${RED}make wrote on std err${END}" || echo -ne "${GREEN}no make error${END}" 
echo -n " -- "
cat stdoutmakebis.txt | egrep -viq "(nothin|already|date)" && echo -e "${RED}makefile relink?${END}" || echo -e "${GREEN}no relink${END}"
rm -rf stderrmake.txt stdoutmakebis.txt

#-------------------------
# makefile : flags and rule
echo -ne "${BLU_BG}Makefile flags${END}\t\t"
grep -sq -- "-Wall" ${dir}Makefile && echo -ne "${GREEN}OK (-Wall)${END}" || echo -ne "${RED}-Wall not found${END}"
echo -n " -- "
grep -sq -- "-Wextra" ${dir}Makefile && echo -ne "${GREEN}OK (-Wextra)${END}" || echo -ne "${RED}-Wextra not found${END}"
echo -n " -- "
grep -sq -- "-Werror" ${dir}Makefile && echo -ne "${GREEN}OK (-Werror)${END}" || echo -ne "${RED}-Werror not found${END}"
echo -n " -- "
grep -sq -- "-std=c++98" ${dir}Makefile && echo -ne "${GREEN}OK (std c++98)${END}" || echo -ne "${RED}Flag -std=c++98 not found${END}"
echo ""


else make >/dev/null ; fi

# ------------------------------------------------------------------------------
#				-----		TESTS		-----
# ------------------------------------------------------------------------------


echo -e "${YEL_BG}Arg error tests${END}"

echo -e "${BLU_BG}${exec} (no arg)${END}\t"
${exec}
echo "----------------------------------------------------------------"

echo -e "${BLU_BG}${exec} \"\" (empty name)${END}\t"
${exec} ""
echo "----------------------------------------------------------------"

echo -e "${BLU_BG}${exec} input_wrong_name.txt ${END}\t"
${exec} input_wrong_name.txt
echo "----------------------------------------------------------------"


echo -e "${YEL_BG}Format error for input.txt${END}"

echo -e "${BLUE_BG}1 - Empty line (linefeed only) : ${END}"
cp inputstxt/input0.txt ./ && mv input0.txt input.txt
${exec} input.txt
rm input.txt

echo -e "${BLUE_BG}1 - Multiple title line (date | value) : ${END}"
cp inputstxt/input1.txt ./ && mv input1.txt input.txt
${exec} input.txt
rm input.txt

echo -e "${BLUE_BG}1 - No title line (date | value) : ${END}"
cp inputstxt/input2.txt ./ && mv input2.txt input.txt
${exec} input.txt
rm input.txt

echo -e "${BLUE_BG}1 - Different name for title line (La date | valeur) : ${END}"
cp inputstxt/input3.txt ./ && mv input3.txt input.txt
${exec} input.txt
rm input.txt

echo -e "${BLUE_BG}1 - Date erros (bad day/month/year, hexa, octal, overflow) : ${END}"
cp inputstxt/input4.txt ./ && mv input4.txt input.txt
${exec} input.txt
rm input.txt

echo -e "${BLUE_BG}1 - Btc value erros : ${END}"
cp inputstxt/input5.txt ./ && mv input5.txt input.txt
${exec} input.txt
rm input.txt

#echo -e "${YEL_BG}Normal tests${END}"


# ------------------------------------------------------------------------------
#				-----		OUTRO		-----
# ------------------------------------------------------------------------------
make fclean &>/dev/null