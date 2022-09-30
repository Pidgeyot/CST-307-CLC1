#Paige Mabbitt 
#Collaborated with Evan Yeomans, Conor Brace, James Miller, and Kayla Douglas
#CST-310
#9-27-22
#Program 2: CLC 1

#Read 2 integer numbers from the uesr and print out the larger one


.data 
	#define msg variables
	msg1: .asciiz "\nEnter the first integer number: "
	msg2: .asciiz "Enter the second integer number: "
	msg3: .asciiz "The larger integer number is: "


.text 
.globl main
main:
	#Print message 1
	li $v0, 4					#prepare to load string into syscall
	la $a0, msg1				#load msg1 into $a0
	syscall						#execute

	#Read first integer
	li $v0, 5					#read the first integer input
	syscall						#execute
	move $t0, $v0				#move integer into reg $t0
	
	#Print message 2
	li $v0, 4					#prepare to load string into syscall
	la $a0, msg2				#load msg2 into $a0
	syscall						#execute
	
	#Read second integer
	li $v0, 5					#read the second integer input
	syscall						#execute
	move $t1, $v0				#move integer into reg $t1
	
	#Print sum message
	li $v0, 4					#prepare to load string into syscall
	la $a0, msg3				#load msg3 into $a0
	syscall						#execute

	#branch if $t0 greater than $t1
	bgt $t0, $t1, print_num		#jumps to print_num if $t0 is larger

	#if $t0 is not larger, print $t1 and exit
	li $v0, 1					#prepare to load integer into syscall
	move $a0, $t1				#load $t1 into $a0
	syscall						#execute
	
	li $v0, 10					#system call for exit
	syscall						#execute
#--------------------------------------------
	#print num for if $t0 is bigger
	print_num:
	li $v0, 1					#prepare to load integer into syscall
	move $a0, $t0				#load the larger int number ($t0) into $a0
	syscall						#execute
	
	li $v0, 10					# system call for exit
	syscall						#execute