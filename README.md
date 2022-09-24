# 📱 Cards
This is a game in which you will need to choose 2 cards that will be face down. The objective of the game is to find all matching cards. The app is made without using Storyboard.

## ⚡ Let's see how this game works:

On the start screen there is a thematic logo and 2 or 3 buttons. If the game has already started, has not been completed and the user returned to the start screen, then the "Продолжить" ("Continue") button appears, which allows you to return to the current game. When you click on the "Игра" ("Game") button, the progress will be erased and you can start a new game.

<body>
  <p>
    <img src="https://raw.githubusercontent.com/Scooterminsk/Cards/main/Screenshots/StartScreenDefault.png" alt="Start Screen Default" style="height: 800px;">
    <img src="https://raw.githubusercontent.com/Scooterminsk/Cards/main/Screenshots/StartScreenContinue.png" alt="Start Screen Continue" style="height: 800px;">
  </p>
 </body>
 
 Now let's click on the "Игра" ("Game") button, and then on the game screen, the "Начать игру" ("Start the game") button. Depending on the settings, a certain number of cards appear face down on the field. The score label is updated according to the number of pairs of cards on the field.
 
 <img src="https://raw.githubusercontent.com/Scooterminsk/Cards/main/Screenshots/Gameplay.png" alt="Gameplay" style="height: 800px;"/>

<br />

If you click on the "Флип!" ("Flip!") button, then all cards will turn face up. In this state, they can be turned over only by pressing this button again, each one cannot be turned over separately. Each individual card can only be moved.

 <img src="https://raw.githubusercontent.com/Scooterminsk/Cards/main/Screenshots/FlipButton.png" alt="Flip Button" style="height: 800px;"/>

<br />

In addition to the buttons discussed, we also see a button that returns to the start screen and a button with which you can go to the settings screen. Let's press it. Below you can see the settings screen itself, as well as screens that you can go to next:
- Selecting the number of pairs of cards;
- Choice of types of figures;
- Choice of colors of figures;
- Selecting the type of figures on the card backs.
It is worth noting that the application implements long-term storage of settings data in UserDefaults.

 <img src="https://raw.githubusercontent.com/Scooterminsk/Cards/main/Screenshots/SettingsScreen.png" alt="Settings Screen" style="height: 800px;"/>

<br />

<body>
  <p>
    <img src="https://raw.githubusercontent.com/Scooterminsk/Cards/main/Screenshots/CardPairsCount.png" alt="Card Pairs Count" style="height: 800px;">
    <img src="https://raw.githubusercontent.com/Scooterminsk/Cards/main/Screenshots/FigureTypes.png" alt="Figure Types" style="height: 800px;">
    <img src="https://raw.githubusercontent.com/Scooterminsk/Cards/main/Screenshots/CardColors.png" alt="Card Colors" style="height: 800px;">
    <img src="https://raw.githubusercontent.com/Scooterminsk/Cards/main/Screenshots/BackShapes.png" alt="Back Shapes" style="height: 800px;">
  </p>
 </body>

Now back to the gameplay itself. When the user turns over all the cards, an Alert will appear, which will congratulate him on his victory and offer to start a new game or return to the start screen.

 <img src="https://raw.githubusercontent.com/Scooterminsk/Cards/main/Screenshots/WinAlert.png" alt="Win Alert" style="height: 800px;"/>

<br />

## 🎉 Thanks for reading the documentation, now you can check the project files.
