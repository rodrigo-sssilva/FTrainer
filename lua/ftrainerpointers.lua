--Used addresses
--1.21.5-language
--main object list pointer is now FP.exe+1938C74
--marked pointers have not been updated yet
--the update causes direct writing to varGotoFrame to crash the game
--so it's not possible to progress on the pointer update for now.
varTrueX = "[[[fp.exe+1938C74]+1da8]+14]+1a8"
varTrueY = "[[[fp.exe+1938C74]+1da8]+14]+1b0"
varCharacter = "[[fp.exe+1938C74]+10c00]+8"
varCharacterB = "[[[fp.exe+1938C74]+1da8]+14]+f0"
varFrame = "fp.exe+1DD4D50"
varGotoFrame = "[fp.exe+14D2458]+10a00"
varCheckFlag = "[[fp.exe+1938C74]+10c00]+20"
varCheckX = "[[fp.exe+1938C74]+10c00]+28"
varCheckY = "[[fp.exe+1938C74]+10c00]+30"
varGlobalCycle = "[[fp.exe+1938C74]+10c00]+18"
varPosX = "fp.exe+1489790" --
varPosY = "fp.exe+1489798" --
varSpeedX = "[[[fp.exe+1938C74]+ 1da8] +14]+ f8"
varSpeedY = "[[[fp.exe+1938C74]+ 1da8] +14]+ 120"
varAngle = "[[[fp.exe+1938C74]+ 1da8] +14]+ 158"
varIgt = "[[[fp.exe+14D2458]+3c8]+14]+1b8" --
varMeter = "[[[fp.exe+14D2458]+de8]+14]+f0" --
varState = "[[[fp.exe+1938C74]+ 1da8] +14]+ 150"
varGrounded = "[[[fp.exe+1938C74]+ 1da8] +14]+ 148"
varLives = "fp.exe+14D24C4" --
varDifficulty = "[[fp.exe+1938C74]+10c00]+60"
varHealth = "[fp.exe+14BE958]+68" --
varShield = "fp.exe+14896F0" --
varShieldHP = "fp.exe+14896F8" --
varCrystals = "[fp.exe+14BE938]+68" --
varPaused = "[fp.exe+14D2458]+111b5" --old was 10f79
varPausedB = "[fp.exe+14D2458]+1155a" --
varInputLock = "[[[fp.exe+14D2458]+248]+14]+150" --
varGlobalFlags = "[[[fp.exe+14D2458]+3c8]+14]+1c0" --
varBikeHealth = "[[[FP.exe+14C0D7C]+8]+14]+100" --
varSuperBoost = "[[[fp.exe+14D2458]+23e8]+14]+1c0" --
varBossSeed = "fp.exe+14F63A8" --
varFadein = "[[[FP.exe+14C08DC]+8]+14]+f8" --
varFadeinB = "[[[fp.exe+14D2458]+ 2488] +14]+ f0" --
varWater = "FP.exe+1488F18" --
varInvincibility = "[[[fp.exe+14D2458]+dc8]+14]+110" --
varExplode = "[[[fp.exe+14D2458]+e08]+14]+100" --
varHealthBar = "[fp.exe+14BE958]+90" --
varCameraX = "[[[fp.exe+1938C74]+2d48]+14]+f0" --
varCameraY = "[[[fp.exe+1938C74]+2d48]+14]+f8" --
varAVs = "[[fp.exe+1938C74]+1da8]+14" --
varCrystalCount = "FP.exe+1488F58" --
varOrbCount = "FP.exe+1488F80" --
varCrystalDisplay = "[[fp.exe+14D2458]+d88]+a8" --
varCrystalDisplay2 = "[[fp.exe+14D2458]+d88]+74" --
varCrystalPosX = "[[fp.exe+14D2458]+d88]+4" --
varCrystalPosY = "[[fp.exe+14D2458]+d88]+8" --
varLivesDisplay = "[[fp.exe+14D2458]+2d68]+8" --
varLivesDisplay2 = "[[fp.exe+14D2458]+2488]+8" --
varDrawing = "[fp.exe+14D2458]+109dc" --
varJump = "[[[fp.exe+14D2458]+21e8]+14]+f0" --
varJump2 = "[[[fp.exe+14D2458]+31c8]+14]+f8" --
varBoxExplode = "[[[FP.exe+14C01FC]+40]+14]+100" --
varBlock = "[[[fp.exe+14D2458]+3228]+14]+f0" --
varKeyCard = "[[fp.exe+14D2458]+ac28]+68" --


-- Tool Assist related pointers
varInputBreakValue = 0x1C8D94
varInputBreak = "FP.exe+1C8D94"
varPBreak = "FP.exe+1877C9"
varFFBreak = "FP.exe+188065"
varInputUp = "[[[fp.exe+1938C74]+288]+14]+f0"
varInputDown = "[[[fp.exe+1938C74]+288]+14]+f8"
varInputLeft = "[[[fp.exe+1938C74]+288]+14]+100"
varInputRight = "[[[fp.exe+1938C74]+288]+14]+108"
varInputJump = "[[[fp.exe+1938C74]+288]+14]+110"
varInputAttack = "[[[fp.exe+1938C74]+288]+14]+118"
varInputSpecial = "[[[fp.exe+1938C74]+288]+14]+120"
varInputPause = "[[[fp.exe+1938C74]+288]+14]+128"
