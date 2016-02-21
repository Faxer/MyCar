Strict


Import mojo
Import myworld

Class MyCar Extends App
	
	Field camera:Camera
	Field course:Course
	Field thecar:Car
	Field speedrumble:Float 
	
	Method OnCreate:Int()
		SetUpdateRate 60
		camera = New Camera
		course = New Course
		

		Local carpoints:Float[]=[-20.0,-15,-15,-15,-5,-5,0,-10,5,-10,10,-5,10,2,15,-5,20,0,15,5,10,2,10,5,5,10,0,10,-5,5,-15,15,-20,15,-20,5,-10,5,-20,0,-10,-5,-20,-5]
		
		thecar = New Car (carpoints)
		
		thecar.rot = 40
		thecar.speed = 0.5
		thecar.x = 320
		thecar.y = 300
		
		course.firstx = 40
		course.secondx = 500
		course.firsty = 40
		course.secondy = 400
		
	
		
		Local points:Float[]=[40.0,40,500,40,500,400,40,400]
		
		course.AddSection(points)
		
		Return 0
	End
	
	Method OnUpdate:Int()
		speedrumble = thecar.speed
		
		If KeyDown(KEY_LEFT) thecar.rot += 2
		If KeyDown(KEY_RIGHT) thecar.rot -= 2	
		If KeyDown(KEY_UP) thecar.speed += 0.1
		If KeyDown(KEY_DOWN) thecar.speed -= 0.1
		If thecar.speed < 0 thecar.speed = 0
		
		If speedrumble > 1 speedrumble = 1
		If thecar.speed > 1 speedrumble = 1
		
		If thecar.x < course.firstx Print "firstx overlap"
		If thecar.x > course.secondx Print "secondx overlap"
		If thecar.y < course.firsty Print "firsty overlap"
		If thecar.y > course.secondy Print "secondy overlap"
		
		thecar.Update
		
		thecar.scale = 1 + Cos (Millisecs()*speedrumble)*0.5
		
		
		Return 0
		
	End
	
	Method OnRender:Int()
		Cls 255,255,200
		course.Render
		thecar.Draw
	
		Return 0
	End

End

	Function Main:Int()
		New MyCar
		Return 0
	End
