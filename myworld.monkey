Strict

Import mojo
Class Camera

End Class


Class Course
	Field sections:= New List <Section>
	Field firstx:Float
	Field secondx:Float
	Field firsty:Float
	Field secondy:float
	
	
	Method Render:Void()
		For Local sec:= Eachin sections
		sec.Draw
		Next  
	
	End Method 
	

	Method AddSection:Void (points:Float[])
		sections.AddLast(New Section(points))
	
	End Method

End Class 

Class Polly

	Field points:Float[] 
	Field x:Float
	Field y:Float
	Field rot:Float 
	Field scale:Float = 1

	
	Method Draw:Void()
		PushMatrix()
		

		Translate (x,y)
		Rotate (rot)	
		Scale (scale,scale)
		
		SetColor 0,0,0
		'DrawPoly points
		Local last:Int = points.Length()-2 	
		For Local i:Int = 0 Until last Step 2 
			DrawLine points[i],points[i+1],points[i+2],points[i+3]
		Next 
		
		DrawLine points[0],points[1],points[last],points[last+1]
		
		PopMatrix()

	End Method
	

	Method New(points:Float[])
		Self.points=points
	
	End Method
	
End Class	


Class Section Extends Polly
	
	Method New(points:Float[])
		
		Super.New(points)
	
	End Method
	
	
End Class
	
	
Class Car Extends Polly
	
	Field speed:Float
	
	Method New(points:Float[])
		
		Super.New(points)
	
	End Method

	Method Update:Void()
		Local mx:Float = Cos(rot)*speed
		Local my:Float = -Sin(rot)*speed
		x += mx
		y += my
	
	End Method 
	
	
End Class 
	