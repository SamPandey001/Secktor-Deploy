# Secktor-Deploy

## Deploy in any shell including Termux
-  [Termux Installation Video tutorial](https://youtu.be/ZgYFPWJdgms)
-  All you need is patient and Internet and shell or phone with termux.
-  If you don't have termux install from [Termux here with no issues.](https://f-droid.org/repo/com.termux_118.apk)
-  First fork Repo and edit sample-config.env to config.env
-  Fill variables in config.env file.
-  Don't put OWNER_NUMBER,MONGODB_URI,SESSION_ID as it can be stolen.
-  Put them during installation when it asks.
-  Open shell or termux and run this commands

  ```
  bash <(curl -L https://github.com/SamPandey001/Secktor-Deploy/raw/main/install.sh)
  ```
- If you see pop up (curl is not installed) run

        apt-get install curl

-  Put your github username when it asks
-  Volla!! bot is alive.

-  Restart bot.
   Send command to bot ```.restart``` or
    
- Stop Bot

         ctrl+c then npm stop secktor

- Start again.

         cd Secktor-Md
         npm start
         
- Change env variables.
  1. to make a file.
  
         touch config.env
      
   2. To edit
       
          nano config.env
       
    3. To save and exit
    
           ctrl+o and ctrl+x
        
    4. To change session and restart
           
           cd Secktor-Md/lib/auth_info_baileys && rm -rf *
           cd .. && npm start
        

- SUPPORT GROUP: <a href="https://chat.whatsapp.com/Bl2F9UTVU4CBfZU6eVnrbCl"><img alt="WhatsApp" src="https://camo.githubusercontent.com/2157131829ac512183ee8f8b6c6f803688a4cc66a2e686602844e80478401a7c/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f4a6f696e2047726f75702d3235443336363f7374796c653d666f722d7468652d6261646765266c6f676f3d7768617473617070266c6f676f436f6c6f723d7768697465"/></a>
