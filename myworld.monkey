Strict

Import mojo
Class Camera

End Class


Class Course
	Field sections:= New List <Section>
	
	Method Render:void()
		For Local sec:= Eachin sections
		sec.Draw
		Next  
	
	End Method 
	
	Method AddSection:Void (points:Float[])
		sections.AddLast(New Section(points))
	
	End method

End Class 

Class Section

	Field points:Float[] 
	Method Draw:Void()
		SetColor 0,0,0
		'DrawPoly points
		For Local i:Int = 0 Until points.Length()-2 Step 2 
		DrawLine points[i],points[i+1],points[i+2],points[i+3]
		Next 
		
	End Method
	
	Method New(points:Float[])
	Self.points=points
	
	End Method
	
End Class