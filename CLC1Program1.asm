#Paige Mabbitt 
#Collaborated with Evan Yeomans, Conor Brace, James Miller, and Kayla Douglas
#CST-310
#9-27-22
#Program 1: CLC 1

#Print sum of two given integers

.data
	ask1: .asciiz "Please type a number: "
	ask2: .asciiz "Please type a second number: "
	sumMsg: .asciiz "Sum = "
	lf:	  .asciiz "\n"

.text
.globl main
main:
	#Ask user for number 1
	li $v0, 4		#print string on syscall
	la $a0,ask1		#load ask1 into a0
	syscall			#execute

	#Get and save number 1
	li $v0, 5		#intake ingeter
	syscall			#execute
	move $t0, $v0	#move integer from a0 to temp reg 0

	#Ask user for number 2
	li $v0, 4		#print string on syscall
	la $a0,ask2		#load ask2 into a0
	syscall			#execute

	#Get and save number 2
	li $v0, 5		#intake ingeter
	syscall			#execute
	move $t1, $v0		#move integer from a0 to temp reg 1

	#initialize registers
	li $t2, 0		#initialize sum

	#Add numbers together
	add $t2, $t0, $t1
	
	#load and print sum msg	
	li $v0, 4		#print string on syscall
	la $a0, sumMsg		#load sumMsg into a0
	syscall			#execute

	#load and print sum (integer)
	li $v0, 1		#print integer on syscall
	move $a0, $t2		#load sum (in $t2) into a0
	syscall			#execute

	#Print newline
	li $v0, 4		#print string on syscall
	la $a0, lf		#load lf into a0
	syscall			#execute

	#exit
	li $v0, 10		#load exit program into syscall
	syscall			#execute
