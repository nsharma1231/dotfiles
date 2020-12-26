#set prompt \033[38;2;93;122;142mgdb \033[1;38;2;75;75;75m \033[0m

set $64BITS = 1

define gtfo
    quit
end
document gtfo
alias for quitting
end

define cls
    shell clear
end
document cls
alias for clearing the screen
end

define flags
# OF (overflow) flag
    if (($eflags >> 0xB) & 1)
        printf "O "
        set $_of_flag = 1
    else
        printf "o "
        set $_of_flag = 0
    end
    if (($eflags >> 0xA) & 1)
        printf "D "
    else
        printf "d "
    end
    if (($eflags >> 9) & 1)
        printf "I "
    else
        printf "i "
    end
    if (($eflags >> 8) & 1)
        printf "T "
    else
        printf "t "
    end
# SF (sign) flag
    if (($eflags >> 7) & 1)
        printf "S "
        set $_sf_flag = 1
    else
        printf "s "
        set $_sf_flag = 0
    end
# ZF (zero) flag
    if (($eflags >> 6) & 1)
        printf "Z "
    set $_zf_flag = 1
    else
        printf "z "
    set $_zf_flag = 0
    end
    if (($eflags >> 4) & 1)
        printf "A "
    else
        printf "a "
    end
# PF (parity) flag
    if (($eflags >> 2) & 1)
        printf "P "
    set $_pf_flag = 1
    else
        printf "p "
    set $_pf_flag = 0
    end
# CF (carry) flag
    if ($eflags & 1)
        printf "C "
    set $_cf_flag = 1
    else
        printf "c "
    set $_cf_flag = 0
    end
    printf "\n"
end
document flags
Print flags register.
end


define eflags
    printf "     OF <%d>  DF <%d>  IF <%d>  TF <%d>",\
           (($eflags >> 0xB) & 1), (($eflags >> 0xA) & 1), \
           (($eflags >> 9) & 1), (($eflags >> 8) & 1)
    printf "  SF <%d>  ZF <%d>  AF <%d>  PF <%d>  CF <%d>\n",\
           (($eflags >> 7) & 1), (($eflags >> 6) & 1),\
           (($eflags >> 4) & 1), (($eflags >> 2) & 1), ($eflags & 1)
    printf "     ID <%d>  VIP <%d> VIF <%d> AC <%d>",\
           (($eflags >> 0x15) & 1), (($eflags >> 0x14) & 1), \
           (($eflags >> 0x13) & 1), (($eflags >> 0x12) & 1)
    printf "  VM <%d>  RF <%d>  NT <%d>  IOPL <%d>\n",\
           (($eflags >> 0x11) & 1), (($eflags >> 0x10) & 1),\
           (($eflags >> 0xE) & 1), (($eflags >> 0xC) & 3)
end
document eflags
Print eflags register.
end


#print all registers
define reg
 if ($64BITS == 1)
# 64bits stuff
    printf "  "
    echo \033[32m
    printf "rax:"
    echo \033[0m
    printf " 0x%016lX  ", $rax
    echo \033[32m
    printf "rbx:"
    echo \033[0m
    printf " 0x%016lX  ", $rbx
    echo \033[32m
    printf "rcx:"
    echo \033[0m
    printf " 0x%016lX  ", $rcx
    echo \033[32m
    printf "rdx:"
    echo \033[0m
    printf " 0x%016lX  ", $rdx
    echo \033[32m
    printf "rflags: "
    echo \033[0m\033[1m
    flags
    echo \033[0m
    printf "  "
    echo \033[32m
    printf "rsi:"
    echo \033[0m
    printf " 0x%016lX  ", $rsi
    echo \033[32m
    printf "rdi:"
    echo \033[0m
    printf " 0x%016lX  ", $rdi
    echo \033[32m
    printf "rbp:"
    echo \033[0m
    printf " 0x%016lX  ", $rbp
    echo \033[32m
    printf "rsp:"
    echo \033[0m
    printf " 0x%016lX  ", $rsp
    echo \033[32m
    printf "rip:"
    echo \033[0m
    printf " 0x%016lX\n  ", $rip
    echo \033[32m
    printf "r8 :"
    echo \033[0m
    printf " 0x%016lX  ", $r8
    echo \033[32m
    printf "r9 :"
    echo \033[0m
    printf " 0x%016lX  ", $r9
    echo \033[32m
    printf "r10:"
    echo \033[0m
    printf " 0x%016lX  ", $r10
    echo \033[32m
    printf "r11:"
    echo \033[0m
    printf " 0x%016lX  ", $r11
    echo \033[32m
    printf "r12:"
    echo \033[0m
    printf " 0x%016lX\n  ", $r12
    echo \033[32m
    printf "r13:"
    echo \033[0m
    printf " 0x%016lX  ", $r13
    echo \033[32m
    printf "r14:"
    echo \033[0m
    printf " 0x%016lX  ", $r14
    echo \033[32m
    printf "r15:"
    echo \033[0m
    printf " 0x%016lX\n  ", $r15
    echo \033[32m
    printf "cs:"
    echo \033[0m
    printf " %04X  ", $cs
    echo \033[32m
    printf "ds:"
    echo \033[0m
    printf " %04X  ", $ds
    echo \033[32m
    printf "es:"
    echo \033[0m
    printf " %04X  ", $es
    echo \033[32m
    printf "fs:"
    echo \033[0m
    printf " %04X  ", $fs
    echo \033[32m
    printf "gs:"
    echo \033[0m
    printf " %04X  ", $gs
    echo \033[32m
    printf "ss:"
    echo \033[0m
    printf " %04X", $ss
    echo \033[0m
# 32bits stuff
 else
    printf "  "
    echo \033[32m
    printf "EAX:"
    echo \033[0m
    printf " 0x%08X  ", $eax
    echo \033[32m
    printf "EBX:"
    echo \033[0m
    printf " 0x%08X  ", $ebx
    echo \033[32m
    printf "ECX:"
    echo \033[0m
    printf " 0x%08X  ", $ecx
    echo \033[32m
    printf "EDX:"
    echo \033[0m
    printf " 0x%08X  ", $edx
    echo \033[1m\033[4m\033[31m
    flags
    echo \033[0m
    printf "  "
    echo \033[32m
    printf "ESI:"
    echo \033[0m
    printf " 0x%08X  ", $esi
    echo \033[32m
    printf "EDI:"
    echo \033[0m
    printf " 0x%08X  ", $edi
    echo \033[32m
    printf "EBP:"
    echo \033[0m
    printf " 0x%08X  ", $ebp
    echo \033[32m
    printf "ESP:"
    echo \033[0m
    printf " 0x%08X  ", $esp
    echo \033[32m
    printf "EIP:"
    echo \033[0m
    printf " 0x%08X\n  ", $eip
    echo \033[32m
    printf "CS:"
    echo \033[0m
    printf " %04X  ", $cs
    echo \033[32m
    printf "DS:"
    echo \033[0m
    printf " %04X  ", $ds
    echo \033[32m
    printf "ES:"
    echo \033[0m
    printf " %04X  ", $es
    echo \033[32m
    printf "FS:"
    echo \033[0m
    printf " %04X  ", $fs
    echo \033[32m
    printf "GS:"
    echo \033[0m
    printf " %04X  ", $gs
    echo \033[32m
    printf "SS:"
    echo \033[0m
    printf " %04X", $ss
    echo \033[0m
 end
# call smallregisters
    smallregisters
# display conditional jump routine
    if ($64BITS == 1)
     printf "\t\t\t\t"
    end
    dumpjump
    printf "\n"
end
document reg
Print CPU registers.
end


#print program arguments
define argv
    show args
end
document argv
Print program arguments.
end

#stack alias
define stack
    if $argc == 0
        info stack
    end
    if $argc == 1
        info stack $arg0
    end
    if $argc > 1
        help stack
    end
end
document stack
Print backtrace of the call stack, or innermost COUNT frames.
Usage: stack <COUNT>
end

#list breakpoints
define bpl
    info breakpoints
end
document bpl
List all breakpoints.
end

#break program on init
define init
    set $SHOW_NEST_INSN = 0
    tbreak _init
    r
end
document init
Run program and break on _init().
end

#print smaller cpu registers??
define smallregisters
 if ($64BITS == 1)
#64bits stuff
	# from rax
	set $eax = $rax & 0xffffffff
	set $ax = $rax & 0xffff
	set $al = $ax & 0xff
	set $ah = $ax >> 8
	# from rbx
	set $bx = $rbx & 0xffff
	set $bl = $bx & 0xff
	set $bh = $bx >> 8
	# from rcx
	set $ecx = $rcx & 0xffffffff
	set $cx = $rcx & 0xffff
	set $cl = $cx & 0xff
	set $ch = $cx >> 8
	# from rdx
	set $edx = $rdx & 0xffffffff
	set $dx = $rdx & 0xffff
	set $dl = $dx & 0xff
	set $dh = $dx >> 8
	# from rsi
	set $esi = $rsi & 0xffffffff
	set $si = $rsi & 0xffff
	# from rdi
	set $edi = $rdi & 0xffffffff
	set $di = $rdi & 0xffff		
#32 bits stuff
 else
	# from eax
	set $ax = $eax & 0xffff
	set $al = $ax & 0xff
	set $ah = $ax >> 8
	# from ebx
	set $bx = $ebx & 0xffff
	set $bl = $bx & 0xff
	set $bh = $bx >> 8
	# from ecx
	set $cx = $ecx & 0xffff
	set $cl = $cx & 0xff
	set $ch = $cx >> 8
	# from edx
	set $dx = $edx & 0xffff
	set $dl = $dx & 0xff
	set $dh = $dx >> 8
	# from esi
	set $si = $esi & 0xffff
	# from edi
	set $di = $edi & 0xffff		
 end
 
end
document smallregisters
Create the 16 and 8 bit cpu registers (gdb doesn't have them by default)
And 32bits if we are dealing with 64bits binaries
end


#display if conditional jump will be taken
define dumpjump
## grab the first two bytes from the instruction so we can determine the jump instruction
 set $_byte1 = *(unsigned char *)$pc
 set $_byte2 = *(unsigned char *)($pc+1)
## and now check what kind of jump we have (in case it's a jump instruction)
## I changed the flags routine to save the flag into a variable, so we don't need to repeat the process :) (search for "define flags")

## opcode 0x77: JA, JNBE (jump if CF=0 and ZF=0)
## opcode 0x0F87: JNBE, JA
 if ( ($_byte1 == 0x77) || ($_byte1 == 0x0F && $_byte2 == 0x87) )
 	# cf=0 and zf=0
 	if ($_cf_flag == 0 && $_zf_flag == 0)
		echo \033[31m
   		printf "  Jump is taken (c=0 and z=0)"
  	else
	# cf != 0 or zf != 0
   		echo \033[31m
   		printf "  Jump is NOT taken (c!=0 or z!=0)"
  	end 
 end

## opcode 0x73: JAE, JNB, JNC (jump if CF=0)
## opcode 0x0F83: JNC, JNB, JAE (jump if CF=0)
 if ( ($_byte1 == 0x73) || ($_byte1 == 0x0F && $_byte2 == 0x83) )
 	# cf=0
 	if ($_cf_flag == 0)
		echo \033[31m
   		printf "  Jump is taken (c=0)"
  	else
	# cf != 0
   		echo \033[31m
   		printf "  Jump is NOT taken (c!=0)"
  	end 
 end
 	
## opcode 0x72: JB, JC, JNAE (jump if CF=1)
## opcode 0x0F82: JNAE, JB, JC
 if ( ($_byte1 == 0x72) || ($_byte1 == 0x0F && $_byte2 == 0x82) )
 	# cf=1
 	if ($_cf_flag == 1)
		echo \033[31m
   		printf "  Jump is taken (c=1)"
  	else
	# cf != 1
   		echo \033[31m
   		printf "  Jump is NOT taken (c!=1)"
  	end 
 end

## opcode 0x76: JBE, JNA (jump if CF=1 or ZF=1)
## opcode 0x0F86: JBE, JNA
 if ( ($_byte1 == 0x76) || ($_byte1 == 0x0F && $_byte2 == 0x86) )
 	# cf=1 or zf=1
 	if (($_cf_flag == 1) || ($_zf_flag == 1))
		echo \033[31m
   		printf "  Jump is taken (c=1 or z=1)"
  	else
	# cf != 1 or zf != 1
   		echo \033[31m
   		printf "  Jump is NOT taken (c!=1 or z!=1)"
  	end 
 end

## opcode 0xE3: JCXZ, JECXZ, JRCXZ (jump if CX=0 or ECX=0 or RCX=0)
 if ($_byte1 == 0xE3)
 	# cx=0 or ecx=0
 	if (($ecx == 0) || ($cx == 0))
		echo \033[31m
   		printf "  Jump is taken (cx=0 or ecx=0)"
  	else
	#
   		echo \033[31m
   		printf "  Jump is NOT taken (cx!=0 or ecx!=0)"
  	end 
 end

## opcode 0x74: JE, JZ (jump if ZF=1)
## opcode 0x0F84: JZ, JE, JZ (jump if ZF=1)
 if ( ($_byte1 == 0x74) || ($_byte1 == 0x0F && $_byte2 == 0x84) )
 # ZF = 1
  	if ($_zf_flag == 1)
   		echo \033[31m
   		printf "  Jump is taken (z=1)"
  	else
 # ZF = 0
   		echo \033[31m
   		printf "  Jump is NOT taken (z!=1)"
  	end 
 end

## opcode 0x7F: JG, JNLE (jump if ZF=0 and SF=OF)
## opcode 0x0F8F: JNLE, JG (jump if ZF=0 and SF=OF)
 if ( ($_byte1 == 0x7F) || ($_byte1 == 0x0F && $_byte2 == 0x8F) )
 # zf = 0 and sf = of
  	if (($_zf_flag == 0) && ($_sf_flag == $_of_flag))
   		echo \033[31m
   		printf "  Jump is taken (z=0 and s=o)"
  	else
 #
   		echo \033[31m
   		printf "  Jump is NOT taken (z!=0 or s!=o)"
  	end 
 end

## opcode 0x7D: JGE, JNL (jump if SF=OF)
## opcode 0x0F8D: JNL, JGE (jump if SF=OF)
 if ( ($_byte1 == 0x7D) || ($_byte1 == 0x0F && $_byte2 == 0x8D) )
 # sf = of
  	if ($_sf_flag == $_of_flag)
   		echo \033[31m
   		printf "  Jump is taken (s=o)"
  	else
 #
   		echo \033[31m
   		printf "  Jump is NOT taken (s!=o)"
  	end 
 end

## opcode: 0x7C: JL, JNGE (jump if SF != OF)
## opcode: 0x0F8C: JNGE, JL (jump if SF != OF)
 if ( ($_byte1 == 0x7C) || ($_byte1 == 0x0F && $_byte2 == 0x8C) )
 # sf != of
  	if ($_sf_flag != $_of_flag)
   		echo \033[31m
   		printf "  Jump is taken (s!=o)"
  	else
 #
   		echo \033[31m
   		printf "  Jump is NOT taken (s=o)"
  	end 
 end

## opcode 0x7E: JLE, JNG (jump if ZF = 1 or SF != OF)
## opcode 0x0F8E: JNG, JLE (jump if ZF = 1 or SF != OF)
 if ( ($_byte1 == 0x7E) || ($_byte1 == 0x0F && $_byte2 == 0x8E) )
 # zf = 1 or sf != of
  	if (($_zf_flag == 1) || ($_sf_flag != $_of_flag))
   		echo \033[31m
   		printf "  Jump is taken (zf=1 or sf!=of)"
  	else
 #
   		echo \033[31m
   		printf "  Jump is NOT taken (zf!=1 or sf=of)"
  	end 
 end

## opcode 0x75: JNE, JNZ (jump if ZF = 0)
## opcode 0x0F85: JNE, JNZ (jump if ZF = 0)
 if ( ($_byte1 == 0x75) || ($_byte1 == 0x0F && $_byte2 == 0x85) )
 # ZF = 0
  	if ($_zf_flag == 0)
   		echo \033[31m
   		printf "  Jump is taken (z=0)"
  	else
 # ZF = 1
   		echo \033[31m
   		printf "  Jump is NOT taken (z!=0)"
  	end 
 end
 
## opcode 0x71: JNO (OF = 0)
## opcode 0x0F81: JNO (OF = 0)
 if ( ($_byte1 == 0x71) || ($_byte1 == 0x0F && $_byte2 == 0x81) )
 # OF = 0
	if ($_of_flag == 0)
   		echo \033[31m
   		printf "  Jump is taken (o=0)"
	else
 # OF != 0
   		echo \033[31m
   		printf "  Jump is NOT taken (o!=0)"
  	end 
 end

## opcode 0x7B: JNP, JPO (jump if PF = 0)
## opcode 0x0F8B: JPO (jump if PF = 0)
 if ( ($_byte1 == 0x7B) || ($_byte1 == 0x0F && $_byte2 == 0x8B) )
 # PF = 0
  	if ($_pf_flag == 0)
   		echo \033[31m
   		printf "  Jump is NOT taken (p=0)"
  	else
 # PF != 0
   		echo \033[31m
   		printf "  Jump is taken (p!=0)"
  	end 
 end

## opcode 0x79: JNS (jump if SF = 0)
## opcode 0x0F89: JNS (jump if SF = 0)
 if ( ($_byte1 == 0x79) || ($_byte1 == 0x0F && $_byte2 == 0x89) )
 # SF = 0
  	if ($_sf_flag == 0)
   		echo \033[31m
   		printf "  Jump is taken (s=0)"
  	else
 # SF != 0
   		echo \033[31m
   		printf "  Jump is NOT taken (s!=0)"
  	end 
 end

## opcode 0x70: JO (jump if OF=1)
## opcode 0x0F80: JO (jump if OF=1)
 if ( ($_byte1 == 0x70) || ($_byte1 == 0x0F && $_byte2 == 0x80) )
 # OF = 1
	if ($_of_flag == 1)
		echo \033[31m
   		printf "  Jump is taken (o=1)"
  	else
 # OF != 1
   		echo \033[31m
   		printf "  Jump is NOT taken (o!=1)"
  	end 
 end

## opcode 0x7A: JP, JPE (jump if PF=1)
## opcode 0x0F8A: JP, JPE (jump if PF=1)
 if ( ($_byte1 == 0x7A) || ($_byte1 == 0x0F && $_byte2 == 0x8A) )
 # PF = 1
  	if ($_pf_flag == 1)
   		echo \033[31m
   		printf "  Jump is taken (p=1)"
  	else
 # PF = 0
   		echo \033[31m
   		printf "  Jump is NOT taken (p!=1)"
  	end 
 end

## opcode 0x78: JS (jump if SF=1)
## opcode 0x0F88: JS (jump if SF=1)
 if ( ($_byte1 == 0x78) || ($_byte1 == 0x0F && $_byte2 == 0x88) )
 # SF = 1
	if ($_sf_flag == 1)
   		echo \033[31m
   		printf "  Jump is taken (s=1)"
  	else
 # SF != 1
   		echo \033[31m
   		printf "  Jump is NOT taken (s!=1)"
  	end 
 end

# end of dumpjump function
end
document dumpjump
Display if conditional jump will be taken or not
end

