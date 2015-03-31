#!/bin/bash


echo "Print two numbers"
read num1 num2
echo "What operation do you want to do?"
echo "Options are add, subtract, multiply, exponentiate, divide, modulo and all"
read oper

	case $oper in
		"add")
			echo "$num1 + $num2 =" $[$num1 + $num2]
			;;
		"subtract")
			echo "$num1 - $num2 =" $[$num1 - $num2]
			;;
		"multiply")
			echo "$num1 * $num2 =" $[$num1 * $num2]
			;;
		"exponentiate")
			echo "$num1 ** $num2 =" $[$num1 ** $num2]
			;;
		"divide")
			echo "$num1 / $num2 =" $[$num1 / $num2]
			;;
		"modulo")
			echo "$num1 % $num2 =" $[$num1 % $num2]
			;;
		"all")
			echo "$num1 + $num2 =" $[$num1 + $num2]
			echo "$num1 - $num2 =" $[$num1 - $num2]
			echo "$num1 * $num2 =" $[$num1 * $num2]
			echo "$num1 ** $num2 =" $[$num1 ** $num2]
			echo "$num1 / $num2 =" $[$num1 / $num2]
			echo "$num1 % $num2 =" $[$num1 % $num2]
		;;
		*)
			exit
			;;
	esac

