Framer.Defaults.Animation = 
  time: 0.2
  curve: 'spring'
  curveOptions:
    tension: 500
    friction: 35
    velocity: 10


bg = new Layer
	width: 751,
	height: 1334,
	backgroundColor: "#fff",
	
content = new Layer
	x: 0,
	y: 0,
	width: 751,
	height: 1334,
	backgroundColor: "#fff",
content.scrollVertical = true

header = new Layer 
	x:0, y:0, width:750, height:100, image:"images/header-red.png",
	superLayer: content
	
content.states.add
	origin: { opacity: 1 }
	fadeOut: { opacity: 0.5 }	
	up: { y: -content.height }
	
#---------------Dial page----------------#
dialOverlay = new Layer
	x: 0,
	y: 0,
	width: 751,
	height: 1334,
	opacity: 0,
	backgroundColor: "#000"

dialOverlay.states.add
	show: { opacity: 0.5 }
	hidden: { opacity: 0 }

dialOverlay.placeBefore(dialButton)

dialToNextPage = new Layer
	y: dialOverlay.height - 400,
	width: 400,
	height: 200,
	superLayer: dialOverlay,
	opacity: 0

dialToNextPage.centerX()

dialToNextPage.on Events.Click, ->
	cardWrapper1.states.switch "hidden"
	cardWrapper2.states.switch "display"
	collectionBg.states.switch "origin"
	dialOverlay.states.next()
	dialDefault.states.next()

dialDefault = new Layer 
	x:0, y:0, width:650, height:650, image:"images/dialNY.png",
	opacity: 0

dialDefault.states.add
	show: { opacity: 1 }
	hide: { opacity: 0 }
	
dialDefault.center()

newYork = new Layer 
	x:dialDefault.width - 168, y:90, width:180, height:180, image:"images/libertyNY.png", superLayer: dialDefault

newYorkStyle = new Layer
	x: 30,
	y: 140,
	width: 50,
	height: 50,
	superLayer: dialDefault,
	borderRadius: "50%"
newYorkStyle.style=
	border: "5px solid white"
	backgroundColor: "rgba(255, 255, 255, 0)"
	
vancouverIcon = new Layer 
	x:0, y:-20, width:140, height:140, image:"images/inukshukVan.png", superLayer: dialDefault, opacity: 0

vancouverIcon.centerX()

vancouverStyle = new Layer
	x: dialDefault.width - 82,
	y: 455,
	width: 50,
	height: 50,
	superLayer: dialDefault,
	borderRadius: "50%",
	opacity: 0
vancouverStyle.style=
	border: "5px solid white"
	backgroundColor: "rgba(255, 255, 255, 0)"

stripVancouver = new Layer 
	x:0, y:47, width:80, height:70, image:"images/3stripsVan.png", superLayer: dialDefault
stripVancouver.centerX()

stripVancouver.states.add
	hidden: { opacity: 0 }
	show: { opacity: 1 }
	
stripNewYork = new Layer 
	x:dialDefault.width-170, y:169, width:90, height:90, image:"images/3stripsNY.png", superLayer: dialDefault, opacity: 0

newYorkCasual = new Layer 
	x:0, y:260, width:230, height:59, image:"images/textCasual.png", superLayer: dialDefault

newYorkCasual.centerX()

vancouverMinimal = new Layer 
	x:0, y:260, width:230, height:59, image:"images/textMinimal.png", superLayer: dialDefault, opacity: 0

vancouverMinimal.centerX()

newYorkText = new Layer 
	x:0, y:340, width:230, height:59, image:"images/textNY.png", superLayer: dialDefault
newYorkText.centerX()

vancouverText = new Layer 
	x:0, y:340, width:250, height:40, image:"images/textVan.png", superLayer: dialDefault, opacity: 0
	
vancouverText.centerX()

newYorkCasual.states.add
	hidden: { opacity: 0 }
	show: { opacity: 1 }

newYorkText.states.add
	hidden: { opacity: 0 } 
	show: { opacity: 1 }

vancouverMinimal.states.add
	show: { opacity: 1 }
	hidden: { opacity: 0 }

vancouverText.states.add
	show: { opacity: 1 } 
	hidden: { opacity: 0 }
	
stripNewYork.states.add
	show: { opacity: 1 }
	hidden: { opacity: 0 }
	
vancouverIcon.states.add
	show: { opacity: 1 }
	hidden: { opacity: 0 }

newYork.states.add 
	hidden: { opacity: 0 }
	show: { opacity: 1 }

vancouverStyle.states.add
	show: { opacity: 1 }
	hidden: { opacity: 0 }

newYorkStyle.states.add
	hidden: { opacity: 0 }
	show: { opacity: 1}

vancouverIcon.on Events.Click, ->
	newYork.states.next()
	vancouverIcon.states.next()
	stripNewYork.states.next()
	stripVancouver.states.next()
	newYorkText.states.next()
	vancouverText.states.next()

newYork.on Events.Click, ->
	vancouverIcon.states.next()
	newYork.states.next()
	stripNewYork.states.next()
	stripVancouver.states.next()
	newYorkText.states.next()
	vancouverText.states.next()
		
vancouverStyle.on Events.Click, ->
	vancouverStyle.states.next()
	newYorkStyle.states.next()
	newYorkCasual.states.next()
	vancouverMinimal.states.next()

newYorkStyle.on Events.Click, ->
	vancouverStyle.states.next()
	newYorkStyle.states.next()
	newYorkCasual.states.next()
	vancouverMinimal.states.next()


#---------------Dial Button----------------#
dialButton = new Layer 
	x: bg.width - 180
	y: bg.height - 180
	width: 150, 
	height: 150, 
	image: "images/Oval 36.png"

dialButton.on Events.Click, ->
	dialOverlay.states.switch "show"
	dialDefault.states.switch "show"

dialStyleText = new Layer
	x: 18,
	y: 40,
	width: dialButton.width,
	superLayer: dialButton,
	backgroundColor: "rgba(0, 0, 0, 0)"

dialStyleText.html = "<h3>CASUAL</h3>"	
dialStyleText.style=
	fontSize: "24px"
	color: "black"

dialCityText = new Layer
	x: 55,
	y: 90,
	width: dialButton.width,
	superLayer: dialButton,
	backgroundColor: "rgba(0, 0, 0, 0)"

dialCityText.html = "<h3>NY</h3>"	
dialCityText.style=
	fontSize: "24px"
	color: "black"
	
	










# 
# 
# dialStyleText2 = new Layer
# 	x: 18,
# 	y: 40,
# 	width: dialButton.width,
# 	superLayer: dialButton,
# 	backgroundColor: "rgba(0, 0, 0, 0)"
# 
# dialStyleText2.html = "<h3>MINIMAL</h3>"	
# dialStyleText2.style=
# 	fontSize: "24px"
# 	color: "black"
# 
# dialCityText2 = new Layer
# 	x: 55,
# 	y: 90,
# 	width: dialButton.width,
# 	superLayer: dialButton,
# 	backgroundColor: "rgba(0, 0, 0, 0)"
# 
# dialCityText2.html = "<h3>VAN</h3>"	
# dialCityText2.style=
# 	fontSize: "24px"
# 	color: "black"
#---------------My Collection----------------#
collectionBg = new Layer
	x: bg.width,
	y: 0,
	width: 750, height: bg.height,
	backgroundColor: "rgba(0,0,0,0)"

closeArea = new Layer
	x: 0,
	y: 0,
	width: 200,
	height: bg.height,
	opacity:0, 
	backgroundColor: "red",
	superLayer: collectionBg
	
navBg = new Layer 
	x:200, y:0, width:550, height:1334, image:"images/Rectangle 45.png",
	superLayer: collectionBg	
	
collectionText = new Layer 
	x:50, y:80, width:300, height:27, image:"images/MY COLLECTIONS.png",
	superLayer: navBg

collectionBg.states.add
    origin: { x: bg.width }
    shown: { x: 0 }

collectionOne = new Layer	
	x: 50,
	y: 200,
	width: 350,
	height: 404,
	superLayer: navBg,
	backgroundColor: "rgba(0, 0, 0, 0)"
imageLayer22 = new Layer 
	x:0, y:0, width:353, height:409, image:"images/collectionImages1.png", superLayer: collectionOne
	
collectionTwo = new Layer	
	x: 50,
	y: 200 + 350 + 104,
	width: 350,
	height: 404,
	superLayer: navBg,
	backgroundColor: "rgba(0, 0, 0, 0)"

imageLayer25 = new Layer 
	x:0, y:0, width:348, height:409, image:"images/collectionImages2.png", superLayer: collectionTwo
	
collectionThree = new Layer	
	x: 50,
	y: collectionTwo.y + collectionTwo.height + 50,
	width: 350,
	height: 500,
	superLayer: navBg,
	backgroundColor: "rgba(0, 0, 0, 0)"

imageLayer26 = new Layer 
	x:0, y:0, width:348, height:404, image:"images/collectionImages3.png", superLayer: collectionThree
	
navBg.scrollVertical = true

#---------------Go to the product page on click----------------#
collectionTwo.on Events.Click, ->
	cardWrapper1.states.switch "hideFurther"
	cardWrapper2.states.switch "hideFurther"
	collectionBg.states.switch "origin"
	content.states.switch "origin"
	productPageWrapper.states.switch "show"

#---------------Nav Button----------------#
navButton = new Layer 
	x:content.width - 60, y:27, width:36, height:53, image:"images/collection-button.png",
	superLayer: content

navButton.states.add
  zoom: scale: 1.4
	

numberBox = new Layer
	x: content.width - 170,
	y: 25,
	height: 50,
	superLayer: content,
	backgroundColor: "#E74949"

numberOne = new Layer 
	x:0, y:60, width:28, height:24, image:"images/+1 2.png", superLayer: numberBox, opacity: 1, scale: 1

numberOne.centerX()

numberOne.states.add
	up: { y: 10 }
	bigger: { scale: 1.5 }
	show: { opacity: 1 }
	hide: { opacity: 0.5 }
	smaller: { scale: 1 }
	down: { y: 60 }
	

	
	
	
	 


navButton.on Events.Click, -> 
	collectionBg.states.switch "shown"
	content.states.switch "fadeOut"
closeArea.on Events.Click, -> 
	collectionBg.states.switch "origin"
	content.states.switch "origin"
#---------------Header text----------------#
headerText = new Layer 
	x:0, y:150, width: 580, height:35, image:"images/Browse and add to yo.png",
	superLayer: content
headerText.centerX()

#---------------Card wrapper----------------#
cardWrapper1 = new Layer
	x: 0,
	y: headerText.y + headerText.height + 50,
	width: bg.width,
	height: content.height,
	superLayer: content,
	backgroundColor: "rgba(0, 0, 0, 0)"
	
cardWrapper1.scrollVertical = true
cardWrapper1.states.add
	hidden: { x: -cardWrapper1.width }
	display: { x: 0 }
	hideFurther: { x: -cardWrapper1.width * 2 }
#---------------Card wrapper2----------------#
cardWrapper2 = new Layer	
	x: bg.width,
	y: headerText.y + headerText.height + 50
	width: bg.width,
	height: content.height
	superLayer: content,
	backgroundColor: "rgba(0, 0, 0, 0)"

cardWrapper2.scrollVertical = true
cardWrapper2.states.add
	hidden: { x: 750 }
	display: { x: 0 }
	hideFurther: { x: -cardWrapper2.width }

secondEntirePage = new Layer 
	x:cardWrapper2.x, y:0, width:716, height:3972, image:"images/asasfdasdf.png", superLayer: cardWrapper2

secondEntirePage.centerX()
    
secondEntirePage.on Events.Click, ->
	cardWrapper2.states.switch "hidden"
	cardWrapper1.states.switch "display"
	
#---------------Story card 1----------------#
storyCard1 = new Layer
	x: 0, y:0, width: 716, height: 1000, superLayer: cardWrapper1,
	backgroundColor: "#FAFAFA"
storyCard1.centerX()

storyCard1.style =
	boxShadow: "0px 4px 4px #888888"
	
story1 = new Layer
	x: 5, y: 0, width: 705, height: 180, superLayer: storyCard1,
	backgroundColor: "#fafafa"

story1.html = "<h2>I'm not a rebel, but I feel like one...</h2>"

story1.style=
	lineHeight: "1.4",
	color: "#7D7D7D",
	padding: "30px 20px",
	fontWeight: "100"
	
storyCardImage1 = new Layer 
	x:0, y:story1.y + story1.height, width:716, height:706, image:"images/storyCard1.png",
	superLayer: storyCard1
	
likeNumber = new Layer 
	x:85, y:storyCard1.height - 72, width:45, height:29, image:"images/80.png", superLayer: storyCard1

grayHeart = new Layer 
	x:30, y:storyCard1.height - 76, width:41, height:37, image:"images/Oval 85.png", superLayer: storyCard1
	
grayShare = new Layer 
	x:grayHeart.x + 130, y:storyCard1.height - 78, width:49, height:41, image:"images/Shape.png",
	superLayer: storyCard1
shareNumber = new Layer 
	x:grayShare.x + 65, y:storyCard1.height - 73, width:64, height:30, image:"images/120.png",
	superLayer: storyCard1
















addToCollectionButton = new Layer 
	x:storyCard1.width - 70, y:storyCard1.height - 73, width:44, height:44, image:"images/ppppp.png", superLayer: storyCard1

addToCollectionButton.on Events.TouchStart, ->
	navButton.states.switch "zoom"
	numberOne.states.switch "up"
addToCollectionButton.on Events.TouchEnd, ->
	navButton.states.switch "default"
	numberOne.states.switch "show"
	numberOne.states.switch "bigger"
	numberOne.animate
		properties:
			y: -numberOne.height - 20
		delay: 0.5






#---------------Story card 2----------------#	
storyCard2 = new Layer
	x: 0, y:storyCard1.y + storyCard1.height + 100, width: 716, height: 1044, superLayer: cardWrapper1,
	backgroundColor: "#FAFAFA"
storyCard2.centerX()

storyCard2.style =
	boxShadow: "0px 4px 4px #888888"

story2 = new Layer
	x: 5, y: 0, width: 705, height: 180, superLayer: storyCard2,
	backgroundColor: "#fafafa"

story2.html = "<h2>As I look down to my wrist, I see a time piece...</h2>"

story2.style=
	lineHeight: "1.4",
	color: "#7D7D7D",
	padding: "30px 20px",
	fontWeight: "100"

storyCardImage2 = new Layer 
	x:0, y:story2.y + story2.height, width:750, height:750, image:"images/storyPic2.png", superLayer: storyCard2

likeNumber21 = new Layer 
	x:85, y:storyCard2.height - 72, width:35, height:29,
	image:"images/81.png", superLayer: storyCard2, scale: 0
	
likeNumber2 = new Layer 
	x:85, y:storyCard2.height - 72, width:45, height:29, image:"images/80.png", superLayer: storyCard2
	
pinkHeartButton2 = new Layer 
	x:30, y:storyCard2.height - 76, width:41, height:37, image:"images/pinkHeart.png", superLayer: storyCard2, scale: 0
	
grayHeart2 = new Layer 
	x:30, y:storyCard2.height - 76, width:41, height:37, image:"images/Oval 85.png", superLayer: storyCard2

likeNumber21.states.add
	small: { scale: 0 }
	big: { scale: 1 }

likeNumber2.states.add
	small: { scale: 0 }
	big: { scale: 1 }

pinkHeartButton2.states.add
	small: { scale: 0 }
	big: { scale: 1 }

grayHeart2.states.add
	small: { scale: 0 }
	big: { scale: 1 }


grayHeart2.on Events.Click, -> 
	grayHeart2.states.switch "small"
	pinkHeartButton2.states.switch "big"
	likeNumber2.states.switch "small"
	likeNumber21.states.switch "big"

pinkHeartButton2.on Events.Click, ->
	pinkHeartButton2.states.switch "small"
	grayHeart2.states.switch "big"
	likeNumber21.states.switch "small"
	likeNumber2.states.switch "big"
		
grayShare = new Layer 
	x:grayHeart.x + 130, y:storyCard2.height - 78, width:49, height:41, image:"images/Shape.png",
	superLayer: storyCard2
shareNumber = new Layer 
	x:grayShare.x + 65, y:storyCard2.height - 73, width:64, height:30, image:"images/120.png",
	superLayer: storyCard2

addToCollectionButton = new Layer 
	x:storyCard2.width - 70, y:storyCard2.height - 73, width:44, height:44, image:"images/ppppp.png", superLayer: storyCard2

#---------------Story card 3----------------#
storyCard3 = new Layer
	x: 0, y:storyCard2.y + storyCard2.height + 100, width: 716, height: 1045, superLayer: cardWrapper1,
	backgroundColor: "#FAFAFA"
storyCard3.centerX()

storyCard3.horizontalScroll = true;

storyCard3.style =
	boxShadow: "0px 4px 4px #888888"

story3 = new Layer
	x: 5, y: 0, width: 705, height: 180, superLayer: storyCard3,
	backgroundColor: "#fafafa"

story3.html = "<h2>I travel with my band in between New York and Paris...</h2>"

story3.style=
	lineHeight: "1.4",
	color: "#7D7D7D",
	padding: "30px 20px",
	fontWeight: "100"
	
storyCardImage3 = new Layer 
	x:0, y:story3.y + story3.height, width:storyCard3.width, height:751, image:"images/BLACK CLASSINESS(skin_family).png", superLayer: storyCard3

storyCardImage3.states.add 
	flip: {rotationY: 180, opacity: 0.1}

storyCardImage3.states.animationOptions = {
	time: 0.5,
	curve: "bezier-curve",
	curveOptions: "ease-in"	
}

storyTelling1 = new Layer 
	x:0, y:story3.y + story3.height, width:2148, height:751,
	image:"images/stories.png", opacity: 0, superLayer: storyCard3
	
storyTelling1.states.add
	show: { opacity: 1 }
	
storyTelling1.states.animationOptions = {
	time: 0.5,
	curve: "bezier-curve",
	curveOptions: "ease-in"	
}

moveStory1 = new Layer
	x: storyCard3.width/2, y: 0, 
	width: storyCard3.width/2, height: 751, superLayer: storyTelling1, opacity: 0.1

moveStory2To1 = new Layer
	x: storyCard3.width, y: 0, 
	width: storyCard3.width/2, height: 751, superLayer: storyTelling1, opacity: 0.1
	
moveStory2To3= new Layer
	x: storyCard3.width + storyCard3.width/2, y: 0, 
	width: storyCard3.width/2, height: 751, superLayer: storyTelling1, opacity: 0.1
	
moveStory3To2= new Layer
	x: storyCard3.width * 2, y: 0, 
	width: storyCard3.width/2, height: 751, superLayer: storyTelling1, opacity: 0.1

storyTelling1.states.add
	second: { x: -storyCard3.width }
	third: { x: -storyCard3.width * 2 }
	first: { x: 0 }

moveStory1.on Events.Click, -> 
	storyTelling1.states.switch "second"

moveStory2To1.on Events.Click, ->
	storyTelling1.states.switch "first"

moveStory2To3.on Events.Click, ->
	storyTelling1.states.switch "third"

moveStory3To2.on Events.Click, ->
	storyTelling1.states.switch "second"

storyCardImage3.on Events.Click, ->
	storyCardImage3.states.next()
	storyTelling1.states.next()

likeNumber = new Layer 
	x:85, y:storyCard3.height - 72, width:45, height:29, image:"images/80.png", superLayer: storyCard3

grayHeart = new Layer 
	x:30, y:storyCard3.height - 76, width:41, height:37, image:"images/Oval 85.png", superLayer: storyCard3
	
grayShare = new Layer 
	x:grayHeart.x + 130, y:storyCard3.height - 78, width:49, height:41, image:"images/Shape.png",
	superLayer: storyCard3
shareNumber = new Layer 
	x:grayShare.x + 65, y:storyCard3.height - 73, width:64, height:30, image:"images/120.png",
	superLayer: storyCard3

addToCollectionButton = new Layer 
	x:storyCard3.width - 70, y:storyCard3.height - 73, width:44, height:44, image:"images/ppppp.png", superLayer: storyCard3

#---------------Story card 3----------------#
storyCard4 = new Layer
	x: 0, y:storyCard3.y + storyCard3.height + 100, width: 716, height: 830, superLayer: cardWrapper1,
	backgroundColor: "#FAFAFA"
storyCard4.centerX()

storyCard4.style =
	boxShadow: "0px 4px 4px #888888"

storyCardImage4 = new Layer 
	x:0, y:0, width:storyCard4.width, height:708, image:"images/gasdfasdf.png", superLayer: storyCard4

story4 = new Layer
	x: 0, y: 0, width: storyCard4.width, height: 180, superLayer: storyCard4,
	backgroundColor: "#fafafa"

story4.html = "<h2>I feel like our music bridges the invisible gap between...</h2>"

story4.style=
	lineHeight: "1.4",
	color: "#7D7D7D",
	padding: "30px 20px",
	fontWeight: "100"

likeNumber = new Layer 
	x:85, y:storyCard4.height - 72, width:45, height:29, image:"images/80.png", superLayer: storyCard4

grayHeart = new Layer 
	x:30, y:storyCard4.height - 76, width:41, height:37, image:"images/Oval 85.png", superLayer: storyCard4
	
grayShare = new Layer 
	x:grayHeart.x + 130, y:storyCard4.height - 78, width:49, height:41, image:"images/Shape.png",
	superLayer: storyCard4
shareNumber = new Layer 
	x:grayShare.x + 65, y:storyCard4.height - 73, width:64, height:30, image:"images/120.png",
	superLayer: storyCard4

addToCollectionButton = new Layer 
	x:storyCard4.width - 70, y:storyCard4.height - 73, width:44, height:44, image:"images/ppppp.png", superLayer: storyCard4


#-----------------Product pages-----------------#
productPageWrapper = new Layer
	x: bg.width * 2,
	y: headerText.y - 20,
	width: content.width,
	height: content.height,
	backgroundColor: "rgba(255, 255, 255, 1)",
	superLayer: content

productPageWrapper.states.add
	show: { x: 0 }
	hide: { x: bg.width * 2 }

productPageWrapper.scrollVertical = true

imageLayer27 = new Layer 
	x:12, y:0, width:727, height:3739, image:"images/product-page-1.png", superLayer: productPageWrapper

productOneToTwo = new Layer
	x: imageLayer27.width/2, width: imageLayer27.width/2, height: productPageWrapper.height, superLayer: imageLayer27, backgroundColor: "rgba(0,0,0,0)"
	
imageLayer28 = new Layer 
	x:productPageWrapper.width + 12, y:0, width:727, height:3739, image:"images/product-2.png", superLayer: productPageWrapper

productTwoToOne = new Layer
	x: 0, width: imageLayer28.width/2, height: productPageWrapper.height, superLayer: imageLayer28, backgroundColor: "rgba(0,0,0,0)"
	
productTwoToThree = new Layer
	x: imageLayer28.width/2, width: imageLayer28.width/2, height: productPageWrapper.height, superLayer: imageLayer28, backgroundColor: "rgba(0,0,0,0)"
	
imageLayer29 = new Layer 
	x:productPageWrapper.width * 2 + 12, y:0, width:727, height:3739, image:"images/product-page-3.png", superLayer: productPageWrapper

productThreeToTwo = new Layer
	x: 0, width: imageLayer29.width/2, height: productPageWrapper.height, superLayer: imageLayer29, backgroundColor: "rgba(0,0,0,0)"


imageLayer27.states.add 
	origin: { x: 0 }
	firstLeft: { x: -productPageWrapper.width }
	secondLeft: { x: -productPageWrapper.width * 2 }

imageLayer28.states.add
	origin: { x: productPageWrapper.width }
	firstLeft: { x: 0 }
	secondLeft: { x: -productPageWrapper.width }
	
imageLayer29.states.add
	origin: { x: productPageWrapper.width * 2 }
	firstLeft: { x: -productPageWrapper.width }
	secondLeft: { x: 0 }
	right: { x: productPageWrapper.width }

productOneToTwo.on Events.Click, ->
	imageLayer27.states.switch "firstLeft"
	imageLayer28.states.switch "firstLeft"
	imageLayer29.states.switch "firstLeft"

productTwoToThree.on Events.Click, ->
	imageLayer29.states.switch "secondLeft"
	imageLayer28.states.switch "secondLeft"
	imageLayer27.states.switch "secondLeft"

productTwoToOne.on Events.Click, ->
	imageLayer27.states.switch "origin"
	imageLayer28.states.switch "origin"
	imageLayer29.states.switch "origin"

productThreeToTwo.on Events.Click, ->
	imageLayer27.states.switch "firstLeft"
	imageLayer28.states.switch "firstLeft"
	imageLayer29.states.switch "right"





