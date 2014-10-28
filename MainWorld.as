package{
	import flash.ui.MouseCursor;
	import net.flashpunk.World;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Data;
	import net.flashpunk.graphics.Text;
	import assets.Assets;
	import menubuttons.MenuContainer;
	import menubuttons.MenuButton;
	import menubuttons.MenuObject;
	import menubuttons.MenuObjectButton;
	import net.flashpunk.graphics.Stamp;
	import menubuttons.HoverText;
	import menubuttons.PageChanger;
	import menubuttons.UpgradeButton;
	import menubuttons.ComboText;
	import menubuttons.ReleaseButton;
	import assets.Broken;
	import menubuttons.SmallButton;
	import flash.sampler.NewObjectSample;
	import flash.net.navigateToURL;
	import flash.net.URLRequest;
	
	public class MainWorld extends World {
		// don't even bother making sense of all of these variables immediately
		//  just see how they're used in-code
		private var
			imoutos:Number = 0,
			clickCount:Number = 0,
			clickCountMultiplier:Number = 0,
			totalIPSpent:Number = 0,
			IPS:Number = 0,
			IPSMod:Number = 1,
			IPCClickMod:Number = 1,
			BuyMod:Number = 1,
			BuyFreeze:Number = 0,
			timer:int = 0,
			autoSaveTimer:int = 0,
			startingx:int = 246,
			startingy:int = 161,
			menubuttonheight:int = 32,
			menubuttondisplace:int = 94,
			saveButton:SmallButton = new SmallButton(20, 20, Assets._savebutton, saveGame),
			webButton:SmallButton = new SmallButton(180, 20, Assets._webbutton, GoToWebsite),
			headString:String = Assets.headString,
			eyesString:String = Assets.eyesString,
			bodyString:String = Assets.bodyString,
			colourString:String = Assets.colourString,
			upgradeString:String = Assets.upgradeString,
			menuHead:MenuButton = new MenuButton(startingx, startingy - menubuttonheight, headString, false, changeMenu),
			menuBody:MenuButton = new MenuButton(startingx + menubuttondisplace, startingy - menubuttonheight, bodyString, true, changeMenu),
			//menuColours:MenuButton = new MenuButton(startingx + 2*menubuttondisplace, startingy - menubuttonheight, colourString, true, changeMenu),
			//menuUpgrades:MenuButton = new MenuButton(startingx + 3*menubuttondisplace, startingy - menubuttonheight, upgradeString, true, changeMenu),
			menuUpgrades:MenuButton = new MenuButton(startingx + 2*menubuttondisplace, startingy - menubuttonheight, upgradeString, true, changeMenu),
			menuRelease:MenuButton = new MenuButton(startingx + 3*menubuttondisplace, startingy - menubuttonheight, "Releases", true, changeMenu),
			currentMenuTab:String = headString,
			headItemsArray:Array = new Array(),
			eyesItemsArray:Array = new Array(),
			bodyItemsArray:Array = new Array(),
			upgradesItemsArray:Array = new Array(),
			headMenuObjectButtons:Array = new Array(),
			bodyMenuObjectButtons:Array = new Array(),
			coloursMenuObjectButtons:Array = new Array(),
			upgradesMenuObjectButtons:Array = new Array(),
			emptyList:Array = new Array(),
			headCurrent:int,
			eyesCurrent:int,
			bodyCurrent:int,
			currentMenuObjectButtons:Array = new Array(),
			lastUsedHead:int = 0,
			lastUsedEyes:int = Assets.maxheads,
			lastUsedBody:int = 0,
			pageButtons:Array = new Array(),
			currentpage:int = 0,
			maxitemsperpage:int = 6,
			firsttimestarting:Boolean = true,
			mainImouto:char_Imouto,
			clickhand:clicker = new clicker(68, 50, "mainclicker"),
			smallclickhand:clicker = new clicker(190, 150, "upgradeone"),
			hiredclickhand:clicker = new clicker(-30, 225, "upgradetwo"),
			log:Logger = new Logger(460),
			incomelog:Logger = new Logger(0),
			hoverTexts:Array = new Array(),
			comboText:ComboText = new ComboText(startingx, 30),
			gameWasntSaved:Boolean = true, //Default value for reading nonexistent save data is TRUE.
			releasebutton:ReleaseButton = new ReleaseButton(284, 170, Release),
			yepbroken:Boolean = false,
			
			//temp holder variables for creating less vars
			// because screw garbage collectors
			i:int = 0,
			countx:int = startingx + 15,
			county:int = startingy + 15,
			hoverTextIndex:int = 0,
			maxitems:int = 0,
			currentarray:Array,
			currentItem:MenuObject,
			currentrow:int,
			upgrade:UpgradeButton,
			item:MenuObjectButton;
		
		public function MainWorld() {
			super();
			//initialization steps
			add(new ui_Background()); //add background image
			add(clickhand);
			add(smallclickhand);
			add(hiredclickhand);
			add(log);
			add(incomelog);
			smallclickhand.makeVisible(false);
			hiredclickhand.makeVisible(false);
			add(new MenuContainer(startingx, startingy)); //add menu item image
			Data.load("imoutos");
			gameWasntSaved = Data.readBool("saved");
			if(gameWasntSaved == false){
				log.log("Savegame loaded.");
				if(Data.readInt("freeIP", 0) > Number(Data.readString("freeIPString", "0"))){
					imoutos = Data.readInt("freeIP", 0);
				} else {
					imoutos = Number(Data.readString("freeIPString", "0"));
				}
				if(Data.readInt("totalIPSpent", 0) > Number(Data.readString("totalIPSpentString", "0"))){
					imoutos = Data.readInt("totalIPSpent", 0);
				} else {
					imoutos += Number(Data.readString("totalIPSpentString", "0"));
				}
				trace("Reading from previous total IP. New IP: " + imoutos.toFixed(2));
			} else {
				log.log("No savegame found.");
			}
			//add the the menu changing buttons
			add(menuHead);
			add(menuBody);
			//add(menuColours); //THIS IS UNUSED BECAUSE COLOUR SWAPS ARE EXPENSIVE
			add(menuUpgrades);
			add(menuRelease);
			
			add(saveButton);
			add(webButton);
			
			//set starting items and items array
			headItemsArray = Assets.MapHead();
			headCurrent = 0;
			eyesItemsArray = Assets.MapEyes();
			eyesCurrent = 0;
			bodyItemsArray = Assets.MapBody();
			bodyCurrent = 0;
			upgradesMenuObjectButtons = Assets.MapUpgrades();
			
			//initialize the page-changing buttons
			for(i = 0; i < 8; i++){this.pageButtons.push(new PageChanger(i + 1, changeMenuPage));}
		
			//create the text overlay on top of the ~six currently visible menu buttons
			// as opposed to having an extra Text() for every menu button, this method saves maybe ~0.2mb per menuobject on runtime
			countx = startingx + 15;
			county = startingy + 15;
			for(i = 0; i < maxitemsperpage; i++){
				hoverTexts.push(new HoverText(countx, county, "ERROR"));
				add(hoverTexts[i]);
				county = county + 38;
			}
			
			//prefabricate all menu button objects
			initializeMenus();
			
			//add the clickable imouto
			mainImouto = new char_Imouto(headItemsArray, eyesItemsArray, bodyItemsArray, incrementImouto);
			add(mainImouto);
			
			//add the text that shows the current combo effect
			add(comboText);
			setCombo();

			//save file so the computer knows it's been run before
			saveGame();

			//the first visible menu is the head menu (why not upgrades menu?)
			changeMenu(headString);
		}

		override public function begin():void {
			super.begin();
		}
		
		private function saveGame():void{
			Data.writeBool("saved", false);
			Data.writeString("totalIPSpentString", totalIPSpent.toString());
			Data.writeString("freeIPString", imoutos.toString());
			Data.save("imoutos");
			log.log("Game saved. Total conserved Imouto Power: " + (totalIPSpent + imoutos).toFixed(2));
		}
		
		private function initializeMenus():void{
			//Heads==================================================================
			countx = startingx + 15;
			county = startingy + 15;
			hoverTextIndex = 0;
			for (i = 0; i < headItemsArray.length; i++){
				//The y-position of each menu object doesn't have to be dynamic because all menu buttons are immediately visible
				// So instead, set the y position of everything right away by simple counting:
				hoverTextIndex = i % maxitemsperpage;
				if(hoverTextIndex == 0){
					county = startingy + 15;
				}
				headMenuObjectButtons.push(new MenuObjectButton(countx, county, headItemsArray[i], hoverTexts, hoverTextIndex, changeItemEquipped));
				county = county + 38;
				
			}
			//Eyes are still part of the 'head' menu despite the items being in its own array, so do a continued iteration
			for (i = headItemsArray.length; i < eyesItemsArray.length + headItemsArray.length; i++){
				hoverTextIndex = i % maxitemsperpage;
				if(hoverTextIndex == 0){
					county = startingy + 15;
				}
				headMenuObjectButtons.push(new MenuObjectButton(countx, county, eyesItemsArray[i - headItemsArray.length], hoverTexts, hoverTextIndex, changeItemEquipped));
				county = county + 38;
			}
			
			//Body==================================================================
			countx = startingx + 15;
			county = startingy + 15;
			hoverTextIndex = 0;
			for(i = 0; i < bodyItemsArray.length; i++){
				hoverTextIndex = i % maxitemsperpage;
				if(hoverTextIndex == 0){
					county = startingy + 15;
				}
				bodyMenuObjectButtons.push(new MenuObjectButton(countx, county, bodyItemsArray[i], hoverTexts, hoverTextIndex, changeItemEquipped));
				county = county + 38;
			}
			
			//Upgrades==================================================================
			countx = startingx + 15;
			county = startingy + 15;
			hoverTextIndex = 0;
			for(i = 0; i < upgradesMenuObjectButtons.length; i++){
				hoverTextIndex = i % maxitemsperpage;
				if(hoverTextIndex == 0){
					county = startingy + 15;
				}
				//Upgrade buttons work slightly differently; the objects are previously generated so now they just need updated positions
				upgradesMenuObjectButtons[i].updateButton(countx, county, hoverTexts, hoverTextIndex, buyUpgrade);
				county = county + 38;
			}
		}
		
		override public function update():void{
			if(this.yepbroken == true){
				return;
			}
			if(this.BuyFreeze > 0){
				BuyFreeze = BuyFreeze - 1;
			}
			else
			{
				if(this.clickCountMultiplier > 0)
				{
					incomelog.log("Imouto power level: (" + this.imoutos.toFixed(0) + " + " + ((this.IPS * this.IPSMod) * Math.pow(1.5, this.clickCount)).toFixed(2) + " IP/s)");
				} else {
					incomelog.log("Imouto power level: (" + this.imoutos.toFixed(0) + " + " + (this.IPS * this.IPSMod).toFixed(2) + " IP/s)");
				}
			}
			Input.mouseCursor = MouseCursor.AUTO;
			super.update();
			timer++;
			autoSaveTimer++;
			if(timer == 20){
				hiredclickhand.moveRight();
			} else if (timer == 24){
				smallclickhand.moveLeft();
				hiredclickhand.moveLeft();
			} else if (timer == 30)
			{
				// After 30 frames has passed, the counter resets.
				timer = 0;
				smallclickhand.moveRight();
				this.incrementImoutoPerSecond();
			}
			if (autoSaveTimer == 4500){
				autoSaveTimer = 0;
				saveGame();
			}
		}
		
		public function buyUpgrade(upgradeprice:Number, rownum:int, addIPS:Number):void{
			if(this.imoutos >= upgradeprice){
				totalIPSpent += (upgradeprice * this.BuyMod);
				this.upgradesMenuObjectButtons[rownum].buyOne();
				this.imoutos = this.imoutos - (upgradeprice * this.BuyMod);
				this.IPS += addIPS;
				if(this.BuyMod != 1){
					log.log("Bought an item! Discount = " + (BuyMod * 100) + "%!");
				}
				else{
					log.log("Bought an item!");
				}
				checkUpgrades();
				setCombo();
				if(rownum == 0){
					smallclickhand.makeVisible(true);
				} else if(rownum == 1){
					hiredclickhand.makeVisible(true);
				}
			}
		}
		
		private function incrementImouto(buttonReleased:Boolean):void{
			if(this.yepbroken == true){
				return;
			}
			if(this.BuyFreeze > 0){
				log.log("No IP gained! Remaining IP Freeze Duration: " + Math.floor(this.BuyFreeze / 30));
				return;
			}
			if(buttonReleased == true){
				log.log("Click: Imouto power level + " + (1 * this.IPCClickMod).toFixed(2) + ")");
				clickCount += 1;
				clickhand.moveUp();
				this.imoutos += (1 * this.IPCClickMod);
				checkUpgrades();
			} else {
				clickhand.moveDown();
			}
		}
		
		private function incrementImoutoPerSecond():void{
			if(this.BuyFreeze > 0){
				incomelog.log("No IP gained! Remaining IP Freeze Duration: " + Math.floor(this.BuyFreeze / 30));
			} else {
				if(this.clickCountMultiplier > 0)
				{
					this.imoutos += (this.IPS * this.IPSMod) * Math.pow(2, this.clickCount);
				} else if(this.IPS > 0){
					this.imoutos += (this.IPS * this.IPSMod);
				}
				checkUpgrades();
			}
			clickCount = 0;
		}
		
		private function checkUpgrades():void{
			if(currentMenuTab == this.upgradeString){
				for each (upgrade in upgradesMenuObjectButtons){
					upgrade.updateAvailability(this.imoutos);
				}
			}
		}
		
		private function changeMenu(identityreturned:String):void{
			if(this.yepbroken == true){
				return;
			}
			//log.log("Clicked on: " + identityreturned);
			if(firsttimestarting == false){
				if(currentMenuTab == identityreturned){
					return;
				}
			}
			firsttimestarting = false;
			currentMenuTab = identityreturned;
			
			menuHead.disableGraphic(true);
			menuBody.disableGraphic(true);
			//menuColours.disableGraphic(true);
			menuUpgrades.disableGraphic(true);
			
			destroyMenus();
			destroyPages();
			currentpage = 0;

			if(identityreturned == headString){
				menuHead.disableGraphic(false);
				currentMenuObjectButtons = headMenuObjectButtons;
				changeToMenuHead();
				remove(releasebutton);
			} else if(identityreturned == bodyString){;
				menuBody.disableGraphic(false);
				currentMenuObjectButtons = bodyMenuObjectButtons;
				changeToMenuBody();
				remove(releasebutton);
			} else if(identityreturned == colourString){
				//menuColours.disableGraphic(false);
				currentMenuObjectButtons = coloursMenuObjectButtons;
				changeToMenuColours();
				remove(releasebutton);
			} else if(identityreturned == upgradeString){
				menuUpgrades.disableGraphic(false);
				currentMenuObjectButtons = upgradesMenuObjectButtons;
				changeToMenuUpgrades();
				remove(releasebutton);
			} else if(identityreturned == "Releases"){
				add(releasebutton);
				currentMenuObjectButtons = emptyList;
			}
			addPageButtons();
			updateTexts();
		}
		
		private function destroyMenus():void{
			for(i = (currentpage * 6); i < Math.min(currentMenuObjectButtons.length, (currentpage + 1) * 6); i++){
				remove(currentMenuObjectButtons[i]);
			}
		}
		
		private function destroyPages():void{
			if(currentMenuObjectButtons.length > maxitemsperpage){
				for(i = 0; i < Math.ceil(currentMenuObjectButtons.length / maxitemsperpage); i++){
					remove(pageButtons[i]);
				}
			}
		}
		
		private function addPageButtons():void{
			if(currentMenuObjectButtons.length > maxitemsperpage){
				for(i = 0; i < Math.ceil(currentMenuObjectButtons.length / maxitemsperpage); i++){
					add(pageButtons[i]);
					this.pageButtons[i].changeLocation(Math.ceil(currentMenuObjectButtons.length / maxitemsperpage) + 1, startingx + 18, startingy + Assets._menubg.height - 44, Assets._menubg.width);
				}
			}
		}
		
		private function changeMenuPage(newpage:int):void{
			if(currentpage != newpage - 1){
				destroyMenus();
				currentpage = newpage - 1;
				
				if(currentMenuTab == headString){
					changeToMenuHead();
				} else if(currentMenuTab == bodyString){
					changeToMenuBody();
				} else if(currentMenuTab == colourString){
				} else if(currentMenuTab == upgradeString){
					changeToMenuUpgrades();
				}
				updateTexts();
			}
		}
		
		private function changeToMenuHead():void{
			if((currentpage * 6 + 1) > headItemsArray.length + eyesItemsArray.length){
				throw "ATTEMPTED TO ACCESS AN UNREACHABLE MENU PAGE";
			}
			
			for(i = (currentpage * 6); i < Math.min(currentMenuObjectButtons.length, (currentpage + 1) * 6); i++){
				add(currentMenuObjectButtons[i]);
			}
				
			currentMenuObjectButtons[lastUsedEyes]._active = true;
			currentMenuObjectButtons[lastUsedHead]._active = true;
			currentMenuObjectButtons[lastUsedEyes].updateGraphic();
			currentMenuObjectButtons[lastUsedHead].updateGraphic();
		}
		
		private function changeToMenuBody():void{
			if((currentpage * 6 + 1) > headItemsArray.length + eyesItemsArray.length){
				throw "ATTEMPTED TO ACCESS AN UNREACHABLE MENU PAGE";
			}

			for(i = (currentpage * 6); i < Math.min(currentMenuObjectButtons.length, (currentpage + 1) * 6); i++){
				add(currentMenuObjectButtons[i]);
			}
			
			currentMenuObjectButtons[lastUsedBody]._active = true;
			currentMenuObjectButtons[lastUsedBody].updateGraphic();
		}
		
		private function changeToMenuColours():void{
			//UNUSED BECAUSE I DON'T WANT TO MULTIPLY THE NUMBER OF ASSETS
		}
		
		private function changeToMenuUpgrades():void{
			for(i = (currentpage * 6); i < Math.min(currentMenuObjectButtons.length, (currentpage + 1) * 6); i++){
				add(currentMenuObjectButtons[i]);
			}
			checkUpgrades();
		}
		
		private function updateTexts(){
			for(i = 0; i < maxitemsperpage; i++){
				this.hoverTexts[i].changeText("");
			}
			maxitems = Math.min(currentMenuObjectButtons.length, (currentpage + 1) * 6);
			for(i = (currentpage * 6); i < maxitems; i++){
				currentMenuObjectButtons[i].updateGraphic();
			}
		}
		
				
		public function setCombo(){
			//Check Assets page to make sense of these numbers
			// They correspond to the 'rownum' attribute of each item in the assets arrays
			IPSMod = 1;
			IPCClickMod = 1;
			BuyMod = 1;
			clickCountMultiplier = 0;
			if(lastUsedHead == 0 && lastUsedEyes == Assets.maxheads && lastUsedBody == 0){
				comboText.changeCombo("The Beginner", "You get nothing!");
			} else if (lastUsedHead == 3 && lastUsedEyes == Assets.maxheads + 1){
				comboText.changeCombo("Tsundere", "I-it's not like I want you to click me or anything! Gain 2x IP/s");
				IPSMod = 2;
			} else if (lastUsedHead == 4 && lastUsedEyes == Assets.maxheads + 2 && lastUsedBody == 6){
				comboText.changeCombo("Miko Complete", "Gain 2.5x IP/s; 100x gain from clicking");
				IPSMod = 2.5;
				IPCClickMod = 100;
			} else if ((lastUsedHead == 9 || lastUsedHead == 10) && lastUsedBody == 5){
				comboText.changeCombo("The Tomboy", "Going strong! Clicking gives IP/s divided by 2: " + Math.floor(IPS * IPSMod)/2 + "; IP/s divided by 2");
				IPCClickMod = (IPS * IPSMod) / 2;
				IPSMod = 0.5;
			} else if (lastUsedHead == 6 && lastUsedEyes == Assets.maxheads + 1){
				comboText.changeCombo("TIMPOPO-CHANG", "KAWAII!\nClicking gives IP/s divided by 4: " + Math.floor(IPS * IPSMod)/4);
				IPCClickMod = (IPS * IPSMod) / 4;
			} else if (lastUsedHead == 16 && lastUsedEyes == Assets.maxheads + 8){
				comboText.changeCombo("A Loli Vampire", "Vampiric drain! Drain 200*IP/s; Clicking gives 100*IP/s: " + Math.floor(IPS*100));
				IPCClickMod = IPS * 100;
				IPSMod = -200;
			} else if (lastUsedHead == 11 && lastUsedEyes == Assets.maxheads + 11 && lastUsedBody == 8){
				comboText.changeCombo("/AGDG/ Set", "Clicking gives IP/s * 4: " + Math.floor(IPS * IPSMod)*4 + "; IP/s is 0.");
				IPCClickMod = (IPS * IPSMod) * 4;
				IPSMod = 0;
			} else if (lastUsedBody == 4 && lastUsedHead == 13 && (lastUsedEyes == Assets.maxheads + 7 || lastUsedEyes == Assets.maxheads + 6)){
				comboText.changeCombo("The NEET", "I'll add an effect tomorrow... I promise!");
			} else if (lastUsedBody == 10 && lastUsedHead == 14 && lastUsedEyes == Assets.maxheads + 3){
				comboText.changeCombo("Delinquent", "Spend half as much to buy upgrades (you still need the full IP before buying). Gain no IP for 5 minutes.");
				incomelog.log("IP Freeze refreshed!");
				BuyFreeze = 9000;
				BuyMod = 0.5;
			} else if (lastUsedBody == 9 && lastUsedHead == 1){
				comboText.changeCombo("Island Wind", "I told you, there's no escape from *********! Clicking gives IP/s * 10: " + Math.floor(IPS * 10));
				IPCClickMod = (IPS * 10);
			} else if (lastUsedBody == 11 && lastUsedHead == 4){
				comboText.changeCombo("Yamato Nadeshiko", "Instant 100,000,000 IP!");
				if(Data.readBool("YamatoUnused") == true){
					this.imoutos += 100000000;
					this.totalIPSpent += 100000000;
					Data.writeBool("YamatoUnused", false);
					saveGame();
					log.log("IP Boost!");
				} else {
					comboText.changeCombo("Yamato Nadeshiko", "Instant 100,000,000 IP! (Already used)");
				}
			} else if (lastUsedBody == 12 && lastUsedHead == 18 && lastUsedEyes == Assets.maxheads + 9){
				comboText.changeCombo("/IGG/ Set", "1.5x IP/s with each click. The multiplier is reset every second.");
				clickCountMultiplier = 1;
			} else if (lastUsedHead == 18 && lastUsedEyes == Assets.maxheads + 9){
				comboText.changeCombo("Imouto Grandmas", "The game is twice as efficient.\n\"A nice little sister to generate Imouto Power.\"");
				IPCClickMod = (IPS * 2);
				IPSMod = 2;
				BuyMod = 0.5;
			} else if (lastUsedBody == 13){
				comboText.changeCombo("Oh", "This could be safe, guys");
				IPCClickMod = (IPS * 50);
				IPSMod = 50;			
			} else if (lastUsedBody == 14){
				comboText.changeCombo("Oh god", "This can't be safe, guys");
				IPCClickMod = (IPS * 500);
				IPSMod = 500;				
			} else {
				comboText.changeCombo("Not-The-Beginner", "5x gain from clicking");
				IPSMod = 1;
				IPCClickMod = 5;
			}
		}
		
		private function changeItemEquipped(itemtype:String, price:Number, bought:Boolean, rownum:int):void{
			currentrow = rownum;
			if(itemtype == eyesString){
				currentarray = eyesItemsArray;
				currentrow += Assets.maxheads;
			} else if(itemtype == headString){
				currentarray = headItemsArray;
			} else if(itemtype == bodyString){
				currentarray = bodyItemsArray;
			}
			
			if(bought){
				//Goal: If the selected item is on AFTER page 1,
				// then set index = (currentMenuObjectButtons index) + (7 * pagenum)
				// When accessing back to currentMenuObjectButtons, compare
				// current page and last used index to tell which one should be active ATM
				//log.log("Switching to item: " + currentarray[rownum]._labeltext);
				//Update imouto graphic==============================
				if(itemtype == eyesString){
					currentItem = currentarray[rownum];
					mainImouto.changeGraphic(null, null, currentItem.img(), null);
				} else if(itemtype == headString){
					currentItem = currentarray[currentrow];
					mainImouto.changeGraphic(currentItem.img(), currentItem.back(), null, null);
				} else if(itemtype == bodyString){
					currentItem = currentarray[currentrow];
					mainImouto.changeGraphic(null, null, null, currentItem.img());
				}
				
				//Update UI==========================================
				currentMenuObjectButtons[currentrow]._active = true;
				currentMenuObjectButtons[currentrow].updateGraphic();
				if(itemtype == eyesString){
					if(lastUsedEyes != currentrow){
						currentMenuObjectButtons[lastUsedEyes]._active = false;
						currentMenuObjectButtons[lastUsedEyes].updateGraphic();
						lastUsedEyes = currentrow;
					}
				} else if(itemtype == headString){
					if(lastUsedHead != currentrow){
						currentMenuObjectButtons[lastUsedHead]._active = false;
						currentMenuObjectButtons[lastUsedHead].updateGraphic();
						lastUsedHead = currentrow;
					}
				} else if(itemtype == bodyString){
					if(lastUsedBody != currentrow){
						currentMenuObjectButtons[lastUsedBody]._active = false;
						currentMenuObjectButtons[lastUsedBody].updateGraphic();
						lastUsedBody = currentrow;
					}
				}
				//Set the combo effect created/replaced by the new set of items
				setCombo();
			} else {
				if(this.imoutos >= price){
					totalIPSpent += price;
					currentarray[rownum]._bought = true;
					//log.log("Item bought: " + currentarray[rownum]._labeltext);
					this.imoutos = this.imoutos - price;
					currentMenuObjectButtons[currentrow].updateGraphic();
				} else {
					//log.log("Not enough power! Imouto power = " + this.imoutos.toFixed(0) + " but price = " + price);
				}
			}
			updateTexts();
		}
		
		public function Release(){
			if(this.imoutos >= 9999999999){
				if(this.yepbroken == false){
					add(new Broken());
					this.IPS = 0;
					this.imoutos = 0;
					this.totalIPSpent = 0;
					saveGame();
					yepbroken = true;
				}
			}
		}
		
		public function GoToWebsite(){
			navigateToURL(new URLRequest("http://imoutoliciouslnt.blogspot.ca/"), "_blank");
		}
	}
}