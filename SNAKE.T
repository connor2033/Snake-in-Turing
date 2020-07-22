setscreen ("graphics:800;600")
setscreen ("offscreenonly")
var leng : int := 10
var dela : int := 50
var y : array 1 .. 250 of int
var x : array 1 .. 250 of int
var chars : array char of boolean
var up : boolean := false
var down : boolean := false
var left : boolean := false
var right : boolean := false
var fy : int
var fx : int
var fstart : boolean := true
var points : int := 0


for i : 1 .. leng
    x (i) := 60 + i * 18
    y (i) := 100
end for

fy := Rand.Int (1, 32) * 18 + 10
fx := Rand.Int (1, 40) * 18 + 6


loop
    cls



    drawfillbox (fx, fy, fx + 15, fy + 15, 38)
    if whatdotcolor (fx, fy) = 55 then
	fy := Rand.Int (1, 32) * 18 + 10
	fx := Rand.Int (1, 40) * 18 + 6
	drawfillbox (fx, fy, fx + 15, fy + 15, 38)
    end if


    Input.KeyDown (chars)

    if (chars (KEY_UP_ARROW) = true and down = false) then
	up := true
	down := false
	left := false
	right := false
    end if



    if (chars (KEY_DOWN_ARROW) = true and up = false) then
	up := false
	down := true
	left := false
	right := false
    end if


    if (chars (KEY_LEFT_ARROW) = true and right = false) then
	up := false
	down := false
	left := true
	right := false
    end if

    if (chars (KEY_RIGHT_ARROW) = true and left = false) then
	up := false
	down := false
	left := false
	right := true
    end if


    if (up = true) then

	%drawdot (x (1) + 7, y (1) + 45, red)
	if (y (1) + 15) > 610 then
	    y (1) := -8
	end if

	if whatdotcolor (x (1) + 7, y (1) + 45) = 38 then
	    drawfillbox (fx, fy, fx + 15, fy + 15, white)
	    points := points + 1


	    for i : leng + 1 .. leng + 5
		x (i) := x (leng)
		y (i) := y (leng)
	    end for
	    leng := leng + 5
	    fy := Rand.Int (1, 32) * 18 + 10
	    fx := Rand.Int (1, 40) * 18 + 6
	end if
	for decreasing i : leng .. 2
	    y (i) := y (i - 1)
	    x (i) := x (i - 1)
	end for
	y (1) := y (1) + 18
    end if




    if (down = true) then

	%drawdot (x (1) + 7, y (1) - 30, red)
	if (y (1)) < -15 then
	    y (1) := 604
	end if


	if whatdotcolor (x (1) + 7, y (1) - 30) = 38 then
	    drawfillbox (fx, fy, fx + 15, fy + 15, white)
	    points := points + 1
	    for i : leng + 1 .. leng + 5
		x (i) := x (leng)
		y (i) := y (leng)
	    end for
	    leng := leng + 5
	    fy := Rand.Int (1, 32) * 18 + 10
	    fx := Rand.Int (1, 40) * 18 + 6
	end if
	for decreasing i : leng .. 2
	    y (i) := y (i - 1)
	    x (i) := x (i - 1)
	end for
	y (1) := y (1) - 18
    end if




    if (left = true) then


	%drawdot (x (1) - 30, y (1) + 7, red)
	if (x (1)) < -15 then
	    x (1) := 798
	end if


	if whatdotcolor (x (1) - 30, y (1) + 7) = 38 then
	    drawfillbox (fx, fy, fx + 15, fy + 15, white)
	    points := points + 1
	    for i : leng + 1 .. leng + 5
		x (i) := x (leng)
		y (i) := y (leng)
	    end for
	    leng := leng + 5
	    fy := Rand.Int (1, 32) * 18 + 10
	    fx := Rand.Int (1, 40) * 18 + 6
	end if
	for decreasing i : leng .. 2
	    y (i) := y (i - 1)
	    x (i) := x (i - 1)
	end for
	x (1) := x (1) - 18
    end if




    if (right = true) then

	%drawdot (x (1) + 45, y (1) + 7, red)
	if (x (1)) > 800 then
	    x (1) := -12
	end if


	if whatdotcolor (x (1) + 45, y (1) + 7) = 38 then
	    drawfillbox (fx, fy, fx + 15, fy + 15, white)
	    points := points + 1
	    for i : leng + 1 .. leng + 5
		x (i) := x (leng)
		y (i) := y (leng)
	    end for
	    leng := leng + 5
	    fy := Rand.Int (1, 32) * 18 + 10
	    fx := Rand.Int (1, 40) * 18 + 6
	end if
	for decreasing i : leng .. 2
	    y (i) := y (i - 1)
	    x (i) := x (i - 1)
	end for
	x (1) := x (1) + 18

    end if


    Draw.Text (intstr (points), 30, 570, defFontID, red)
    
    drawfillbox (x (1), y (1), x (1) + 15, y (1) + 15, 49)

    for i : 2 .. leng
	drawfillbox (x (i), y (i), x (i) + 15, y (i) + 15, 55)
    end for

    if whatdotcolor (x (1), y (1)) = 55 then
	break
    end if





    View.Update
    Time.Delay (dela)
end loop
