Strict


Import mojo
Import myworld

Class MyCar Extends App
	
	Field camera:Camera
	Field course:Course
	
	Method OnCreate:Int()
		SetUpdateRate 60
		camera = New Camera
		course = New Course
		
		Local points:Float[]=[40.0,40,200,90,180,200,60,120]
		
		course.AddSection(points)
		
		Return 0
	End
	
	Method OnUpdate:Int()
		
		Return 0
		
	End
	
	Method OnRender:Int()
		Cls 255,255,200
		course.Render
	
		Return 0
	End

End

	Function Main:Int()
		New MyCar
		Return 0
	End
