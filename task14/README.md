# BANDIT OVER THE WIRE CHALLENGE 
Level 0-1 
Password: NH2SXQwcBdpmTEzi3bvBHMM9H66vVXjL 
Steps: 
Using the ssh command I got on the server using the command ssh bandit0@bandit.labs.overthewire.org -p 2220 
Then I was told to enter the password which was given and it was bandit0 
I got on to the server  
To enter to level 1 I first found the password which was uisng ls to find the file within the server and then cat to read the file and got the first password to login to the level 1 
I typed  ssh bandit1@bandit.labs.overthewire.org -p 2220 and entered the password 
Level 1-2: 
Password: rRGizSaX8Mk1RTb1CNQoXTcYZWU6lgzi 
Steps: 
Use the Level 1 credentials to log in. 
I typed the following commands 
ls  
cat ./-  
I found the password then I  
I typed  ssh bandit2@bandit.labs.overthewire.org -p 2220 and entered the password 
Level  2-3: 
Password: aBZ0W5EmUfAf7kHTQeOwd8bauFJ2lAiG 
Steps: 
Using the ssh command I got on the server using the command ssh bandit2@bandit.labs.overthewire.org -p 2220 
ls  
cat  'spaces in this filename'  
Found the password for the next level 
I typed  ssh bandit3@bandit.labs.overthewire.org -p 2220 and entered the password 
Level 3-4: 
Password: 2EW7BBs6aMMoJ2HjW067dm8EgX26xNe 
Steps: 
ls  
cd inhere/ 
 ls  
ls -al  
cat .hidden  
Found the password using the command  
Then I typed  ssh bandit4@bandit.labs.overthewire.org -p 2220 and entered the password 
Level 4-5: 
Password: lrIWWI6bB37kxfiCQZqUdOIYfr6eEeqR 
Steps: 
ls -la  
cd inhere/  
ls file ./*  
cat ./-file07 
Then I found the password  
Then I typed  ssh bandit5@bandit.labs.overthewire.org -p 2220 and entered the password 
 
Level 5-6: 
Password: P4L4vucdmLnm8I7Vl7jG1ApGSfjYKqJU 
Steps: 
ls  
cd inhere/  
ls find . -size 1033c  
cat ./maybehere07/.file2 
Then I found the password  
Then I typed  ssh bandit6@bandit.labs.overthewire.org -p 2220 and entered the password 
Level 6-7: 
Password: z7WtoNQU2XfjmMtWA8u5rN4vzqu4v99S 
Steps: 
ls  
cd inhere/  
ls find . -size 1033c  
cat ./maybehere07/.file2  
Then I found the password  
Then I typed  ssh bandit7@bandit.labs.overthewire.org -p 2220 and entered the password 
 
Level 7-8: 
Password: TESKZC0XvTetK0S9xNwm25STk5iWrBvP 
ls  
cat data.txt | grep millionth 
I found the password and then  
Then I typed  ssh bandit8@bandit.labs.overthewire.org -p 2220 and entered the password 
Level 8-9: 
Password: EN632PlfYiZbn3PhVK3XOGSlNInNE00t 
ls 
cat data.txt | sort | uniq –u 
I found the password and then  
Then I typed  ssh bandit9@bandit.labs.overthewire.org -p 2220 and entered the password 
Level 9-10 
Password: G7w8LIi6J3kTb8A7j9LgrywtEUlyyp6s 
ls 
 strings data.txt | grep = 
I found the password and then  
Then I typed  ssh bandit10@bandit.labs.overthewire.org -p 2220 and entered the password 
Level 10-11 
Password: 6zPeziLdR2RKNdNYFNb6nVCKzphlXHBM 
ls  
cat data.txt | base64 –decode 
I found the password and then  
Then I typed  ssh bandit11@bandit.labs.overthewire.org -p 2220 and entered the password 
Level 11-12 
Password: JVNBBFSmZwKKOP0XbFXOoW8chDz5yVRv 
ls  
cat data.txt | tr a-zA-Z n-za-mN-ZA-M 
I found the password and then  
Then I typed  ssh bandit12@bandit.labs.overthewire.org -p 2220 and entered the password 
 
Level 12-13 
Password: wbWdlBxEir4CaE8LaPhauuOo6pwRmrDw 
ls  
cat data.txt 
mkdir /tmp/pavan  
cp data.txt /tmp/pavan  
cd /tmp/pavan  
ls file data.txt xxd -r data.txt data1  
file data1  
mv data1 data2.gz  
gzip -d data2.gz 
file data2  
mv data2 data3.bz2  
bzip2 -d data3.bz2  
file data3  
mv data3 data4.gz  
gzip -d data4.gz  
file data4 tar -xvf data4 
file data5.bin t 
ar -xvf data5.bin  
file data6.bin  
mv data6.bin data7.bz2  
bzip2 -d data7.bz2  
file data7 tar -xvf data7 
file data8.bin  
mv data8.bin data9.gz  
gzip -d data9.gz  
file data9  
cat data9  
I found the password and then  
Then I typed  ssh bandit13@bandit.labs.overthewire.org -p 2220 and entered the password 
 
Level 13-14 
Password: fGrHPx402xGC7U7rXKDaxiWFTOiF0ENq 
Ls 
We find a ssh key we use  
ssh bandit14@bandit.labs.overthewire.org -p 2220 -I sshkey.private 
Level 14-15 
Password: jN2kgmIXJ6fShzhT2avhotn4Zcka6tnt 
cat /etc/bandit_pass/bandit14  
telnet localhost 30000  
ssh bandit13@bandit.labs.overthewire.org -p 2220 
Level 15-16 
Password: JQttfApK4SeyHwDlI9SXGR50qclOAil1 
openssl s_client -connect localhost:30001 –ign_eof 
I found the password and then  
Then I typed  ssh bandit16@bandit.labs.overthewire.org -p 2220 and entered the password 
Level 16-17 
Password: VwOSWtCA7lRKkTfbr2IDh6awj9RNZM5e 
nmap -A localhost -p 31000-32000 
openssl s_client -connect localhost:31790 
mkdir /tmp/gautham_ssh  
cd /tmp/gautham_ssh  
nano gautham.private 
chmod 600 gautham.private 
I found the password and then  
Then I typed  ssh bandit17@bandit.labs.overthewire.org -p 2220 and entered the password 
Level 17-18 
Level 18 - 19 
Password1: awhqfNnAbc1naukrpqDYcF95h7HoMTrC 
 
Password2: hga5tuuCLF6fFzUpnagiMN8ssu9LFrdg 
ls  
diff passwords.old passwords.new  
I found the password and then  
Then I typed  ssh -T bandit18@bandit.labs.overthewire.org -p 2220 and entered the password 
Then 
ls  
cat readme  
Then I typed  ssh  bandit19@bandit.labs.overthewire.org -p 2220 and entered the password 
Level 19-20 
Password: VxCazJaVykI6W36BkBU0mJTCM8rR95XT 
ls  
./bandit20-do 
 ./bandit20-do cat /etc/bandit_pass/bandit20  
Then I typed  ssh bandit20@bandit.labs.overthewire.org -p 2220 and entered the password 
 
 
 
 
