package braid

import braid.course.Course;

class Link {

	String caption
	String url
	Integer position
	
	static belongsTo = [course: Course]

}
