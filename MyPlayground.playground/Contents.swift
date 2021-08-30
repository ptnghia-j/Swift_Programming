import UIKit

var numOfAnimeWatched = 10
var favoriteAnime = "DragonBall"

switch favoriteAnime {
case "DragonBall", "Ranma":
    print("Gotta love the classics!")
default:
    print("")
    
}

switch numOfAnimeWatched {
case 0...4:
    print("You need to watch more anime!")
case 5...10:
    print("Way to go!")
case 11...20:
    print("Anime lover")
default:
    print("すばらしい")
    
}
