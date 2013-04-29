package com.spacecowboysoftware.minimalism 
{
	import org.flixel.*;
	/**
	 * ...
	 * @author Jesse Abram
	 */
	public class GameState extends FlxState
	{
		private var testText:FlxText;
		private var text2:FlxText;
		private var storyText:FlxText;
		private var backgroundSprite:FlxSprite;
		private var stabCount:uint = 0;
		private var leftEar:Boolean = false;
		private var rightEar:Boolean = false;
		private var leftEye:Boolean = false;
		private var rightEye:Boolean = false;
		private var bloodSprite:FlxSprite;
		private var blackSprite:FlxSprite;
		private var state:uint = 0;
		private var strings:Array = ["I guess you could call it a disconnect between reality and the interpretation of reality. And the icing on that can of worms cake, the *artistic* interpretation of reality. The more I began to comprehend just how free I was to reinterpret, the less appealing the input itself became to me. It just became a whole lot of chaff for me to sift through. Art became a chore, and reality became a coal mine of raw material. It started to feel pointless in itself. A larval state for something that I would be required to coax into metamorphosis.\n\nPress Enter to continue", 
									"Now, I know what you're all thinking right now. \"How precious - Look at the little art student, takes a couple of classes and suddenly he's one of the great masters! Looks like someone's taking their textbook a little bit too seriously!\" - I even think it *myself* sometimes. I feel pretentious even writing this right now. But then I swish the thoughts around in my head a bit more and realize that my thoughts were right on the mark, and not just overdramatic fancy. And life starts to lose its color again.\n\nPress Enter to continue",
									"I spent a lot of time in bed. Sometimes I'd have a stretch of a few days where I'd try putting brush to canvas, to see if I could satisfy myself by putting some of my perceptual realities into the real world. But then it hit me. It was like a feedback loop. By forming art, I was taking my new, pure ideas and sending them back into the mine. Back into the rough-hewn filthy reality that spawned them. When my works bounced back into my head, through my eyes, I saw them in the same dirty light in which I was seeing everything else, and had to reinterpret them anew.\n\nPress Enter to continue.",
									"The idea that followed was to make minimalism my focus. Before that, I'd been seeing art as a way to take the real world and evolve it, to dress it up into something fancier. Maybe I was heading in the wrong direction. My new theory was that if I took reality *backwards* to a primal, \"Pre-real\" state, put it onto canvas, and then interpreted that, maybe I'd finally be at peace with what I saw.\n\nPress Enter to continue",
									"But, \'the best laid plans\', and all that jazz - The theory was great, but in reality, it just led to more dissatisfaction and moping and daytime sleep.\n\nPress Enter to continue",
									"I now stand in the midst of my last-ditch effort. I've come to this place, in the mountains. It holds a lot of fond childhood memories, for me. I figured if there was one place I could formulate an all-encompassing plan to be at peace with reality, it would be here. Either through acceptance of what is, or through the purification of an ultimate philosophy of minimalism.\n\nPress Enter to continue",
									"You encounter a cluster of pretty flowers, down by the river.\n\nSmell the flowers? (Y/N)",
									"You see a bird on the ground, hopping around in search of bugs.\n\nWatch the bird? (Y/N)",
									"You see a trout swimming in the stream.\n\nMuse about its progress? (Y/N)"]
		
		private var first:Boolean = true;
		private var second:Boolean = false;
		private var scroll:Boolean = false;
		private var third:Boolean = false;
		private var fourth:Boolean = false;
		private var credits:FlxText;
		override public function create():void
		{
			credits = new FlxText(10, FlxG.height + 40, FlxG.width - 20, "Departing of the Sensory\n\nMade in 48 hours for Ludum Dare 26\n\nProgramming, Story, Art, and Sound by Jesse Abram\n\nUnder the hood: The Flixel game framework, made by Adam Saltsman\n\nTools used: Coded in AS3 using FlashDevelop with the Flex Compiler, Adobe Photoshop CS2 for the art, Apple's Garageband for the music, and BFXR (bfxr.net) for the stabbin' noise\n\nThank you for playing!");
			credits.alignment = "center";
			credits.size = 32;
			FlxG.bgColor = 0xff000000;
			backgroundSprite = new FlxSprite(0, 0);
			backgroundSprite.loadGraphic(Graphics.Background, true, false, 900, 900);
			backgroundSprite.addAnimation("Cycle", [0, 1, 2, 0, 1, 2, 0, 1, 2, 0, 1, 2, 0, 1, 2, 3, 3, 0, 1, 2, 0, 1, 2, 0, 1, 2, 0, 1, 2, 0, 1, 2, 4, 4], 10, true);
			backgroundSprite.addAnimation("Cycle2", [0, 1, 2], 10, true);
			backgroundSprite.addAnimation("Cycle3", [0, 1, 2, 0, 1, 2, 0, 1, 2, 0, 1, 2, 0, 1, 2, 3, 3, 0, 1, 2, 0, 1, 2, 0, 1, 2, 0, 1, 2, 0, 1, 2], 10, true);
			add(backgroundSprite);
			backgroundSprite.play("Cycle2");
			testText = new FlxText(0, 0, FlxG.width, "Departing of the Sensory");
			testText.alignment = "center";
			testText.size = 64;
			testText.color = 0x000000;
			add(testText);
			text2 = new FlxText(0, 175, FlxG.width, "By Jesse Abram\n\nPress Enter to begin");
			text2.alignment = "center";
			text2.size = 16;
			text2.color = 0x000000;
			add(text2);
			storyText = new FlxText(20, 20, FlxG.width - 40, "I graduated from art college two months previously. It was an enriching experience for me, all in all, but it left me with an itching dissatisfaction. I got to thinking more and more about the relationship between sense and perception, form and interpretation.\n\nPress Enter to continue");
			storyText.alignment = "left";
			storyText.size = 16;
			storyText.color = 0x000000;
			storyText.shadow = 0xffffff;
			FlxG.playMusic(Sounds.Minimalism);
			bloodSprite = new FlxSprite(0, 0, Graphics.Blood);
			blackSprite = new FlxSprite(0, 0, Graphics.Black);
		}
		
		override public function update():void
		{
			super.update();
			if (FlxG.keys.justPressed("Q"))
			{
				stabEye();
			}
			if (FlxG.keys.justPressed("W"))
			{
				stabLeftEar();
			}
			if (FlxG.keys.justPressed("E"))
			{
				stabRightEar();
			}
			switch (state)
			{
				case 0:
				
				if (FlxG.keys.justPressed("ENTER"))
				{
					remove(testText);
					remove(text2);
					state = 1;
					add(storyText);
				}
				break;
				
				case 1:
				if (FlxG.keys.justPressed("ENTER"))
				{
					storyText.text = strings[0];
					state = 2;
				}
				break;
				
				case 2:
				if (FlxG.keys.justPressed("ENTER"))
				{
					storyText.text = strings[1];
					state = 3;
				}
				break;
				
				case 3:
				if (FlxG.keys.justPressed("ENTER"))
				{
					storyText.text = strings[2];
					state = 4;
				}
				break;
				
				case 4:
				if (FlxG.keys.justPressed("ENTER"))
				{
					storyText.text = strings[3];
					state = 5;
					backgroundSprite.play("Cycle3");
				}
				break;
				
				case 5:
				if (FlxG.keys.justPressed("ENTER"))
				{
					storyText.text = strings[4];
					state = 6;
				}
				break;
				
				case 6:
				if (FlxG.keys.justPressed("ENTER"))
				{
					storyText.text = strings[5];
					state = 7;
					backgroundSprite.play("Cycle");
				}
				break;
				
				case 7:
				if (FlxG.keys.justPressed("ENTER"))
				{
					generateEncounter();
				}
				break;
				
				case 8:
				if (FlxG.keys.justPressed("Y"))
				{
					storyText.text = "You smell the flowers. Pleasant but not exhilarating.";
					generateEncounter();
				}
				else if (FlxG.keys.justPressed("N"))
				{
					storyText.text = "You walk past the flowers.";
					generateEncounter();
				}
				break;
				
				case 9:
				if (FlxG.keys.justPressed("Y"))
				{
					storyText.text = "You watch the bird. It amuses you, if only fleetingly.";
					generateEncounter();
				}
				else if (FlxG.keys.justPressed("N"))
				{
					storyText.text = "You ignore the bird.";
					generateEncounter();
				}
				break;
				
				case 10:
				if (FlxG.keys.justPressed("Y"))
				{
					storyText.text = "The trout is trying to swim against the current. It reminds you of yourself.";
					generateEncounter();
				}
				else if (FlxG.keys.justPressed("N"))
				{
					storyText.text = "You leave the trout to its business.";
					generateEncounter();
				}
				break;
				
				case 11:
				if (FlxG.keys.justPressed("Y"))
				{
					stabLeftEar();
					generateEncounter();
				}
				else if (FlxG.keys.justPressed("N"))
				{
					storyText.text = "You pass on that idea for now.";
					generateEncounter();
				}
				break;
				
				case 12:
				if (FlxG.keys.justPressed("Y"))
				{
					stabRightEar();
					generateEncounter();
				}
				else if (FlxG.keys.justPressed("N"))
				{
					storyText.text = "You pass on that idea for now.";
					generateEncounter();
				}
				break;
				
				case 13:
				if (FlxG.keys.justPressed("Y"))
				{
					stabEye();
					leftEye = true;
					generateEncounter();
				}
				else if (FlxG.keys.justPressed("N"))
				{
					storyText.text = "You pass on that idea for now.";
					generateEncounter();
				}
				break;
				
				case 14:
				if (FlxG.keys.justPressed("Y"))
				{
					stabEye();
					rightEye = true;
					generateEncounter();
				}
				else if (FlxG.keys.justPressed("N"))
				{
					storyText.text = "You pass on that idea for now.";
					generateEncounter();
				}
				break;
			}
		}
		
		private function leftEarQuestion():void
		{
			storyText.text = storyText.text + "\n\n" + "Stab left ear with your pair of scissors? (Y/N)";
			state = 11;
		}
		
		private function rightEarQuestion():void
		{
			storyText.text = storyText.text + "\n\n" + "Stab right ear with your pair of scissors? (Y/N)";
			state = 12;
		}
		
		private function leftEyeQuestion():void
		{
			storyText.text = storyText.text + "\n\n" + "Stab left eye with your pair of scissors? (Y/N)";
			state = 13;
		}
		
		private function rightEyeQuestion():void
		{
			storyText.text = storyText.text + "\n\n" + "Stab right eye with your pair of scissors? (Y/N)";
			state = 14;
		}
		
		private function generateEncounter():void
		{
			if (first)
			{
				state = 8;
				first = false;
				storyText.text = strings[6];
				second = true;
			}
			else if (second)
			{
				state = 9;
				second = false;
				storyText.text = storyText.text + "\n\n" + strings[7];
				third = true;
			}
			else if (third)
			{
				storyText.text = storyText.text + "\n\n" + strings[8];
				state = 10;
				third = false;
				fourth = true;
			}
			else if (fourth)
			{
				if (!leftEar && !rightEar) // If neither ear has been stabbed yet
				{
					var choice:uint;
					if(stabCount == 0)
						choice = Math.floor(Math.random() * 3);
					else
						choice = Math.floor(Math.random() * 2);
					if (choice == 0)
					{
						leftEarQuestion();
					}
					else if (choice == 1)
					{
						rightEarQuestion();
					}
					else if (choice == 2)
					{
						var choice2:uint = Math.floor(Math.random() * 2);
						if (stabCount == 0)
						{
							if (choice2 == 0)
							{
								leftEyeQuestion();
							}
							else if (choice2 == 1)
							{
								rightEyeQuestion();
							}
						}
						else
						{
							if (leftEye)
							{
								rightEyeQuestion();
							}
							else if (rightEye)
							{
								leftEyeQuestion();
							}
						}
					}
				}
				else if (!leftEar || !rightEar) //if one ear has been stabbed yet
				{
					if (stabCount > 0)
					{
						if (leftEar)
						{
							rightEarQuestion();
						}
						else if (rightEar)
						{
							leftEarQuestion();
						}
					}
					else if (stabCount == 0)
					{
						var choice3:uint = Math.floor(Math.random() * 2);
						if (choice3 == 0)
						{
							var choice5:uint = Math.floor(Math.random() * 2);
							if (choice5 == 0)
							{
								leftEyeQuestion();
							}
							else if (choice5 == 1)
							{
								rightEyeQuestion();
							}
						}
						else if (choice3 == 1)
						{
							if (leftEar)
							{
								rightEarQuestion();
							}
							else if (rightEar)
							{
								leftEarQuestion();
							}
						}
					}
				}
				else if(leftEar && rightEar)// If both ears have been stabbed
				{
					if (stabCount == 0)
					{
						var choice4:uint = Math.floor(Math.random() * 2);
						if (choice4 == 0)
						{
							leftEyeQuestion();
						}
						else if (choice4 == 1)
						{
							rightEyeQuestion();
						}
					}
					else
					{
						if (leftEye)
						{
							rightEyeQuestion();
						}
						else if (rightEye)
						{
							leftEyeQuestion();
						}
					}
				}
				else
				{
					storyText.text = "Error";
				}
				fourth = false;
				first = true;
			}
		}
		
		public function stabLeftEar():void
		{
			if (!leftEar)
			{
				var tempPan:int = FlxG.music._transform.pan;
				FlxG.music._transform.pan = -1;
				FlxG.play(Sounds.Stab);
				FlxG.music._transform.pan = tempPan;
			}
			if (rightEar == true)
			{
				FlxG.music.stop();
			}
			else
			{
				FlxG.music._transform.pan = 1;
			}
			leftEar = true;
		}
		
		public function stabRightEar():void
		{
			if (!rightEar)
			{
				var tempPan:int = FlxG.music._transform.pan;
				FlxG.music._transform.pan = 1;
				FlxG.play(Sounds.Stab);
				FlxG.music._transform.pan = tempPan;
			}
			if (leftEar == true)
			{
				FlxG.music.stop();
			}
			else
			{
				FlxG.music._transform.pan = -1;
			}
			rightEar = true;
		}
		
		public function stabEye():void
		{
			if (stabCount == 0)
			{
				add(bloodSprite);
				FlxG.play(Sounds.Stab);
			}
			else if (stabCount == 1)
			{
				add(blackSprite);
				FlxG.play(Sounds.Stab);
				add(credits);
				credits.velocity.y = -40;
			}
			stabCount++;
		}
		
	}

}