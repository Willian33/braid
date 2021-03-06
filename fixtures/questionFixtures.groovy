import braid.Question

load "courseFixtures"

fixture{
	
	q1(Question,
	wording: '¿Qué significa la frase *tell, don\'t ask*?',
	level: 1,
	position: 1,
	tags: ['oop', 'polimorfismo'],
	course: taller
	)

	q2(Question,
	wording: '¿Qué significa la frase *no nos llame, nosotros lo llamamos*?',
	level: 3,
	position: 2,
	tags: ['oop'],
	course: taller
	)

	q3(Question,
	wording: '¿Qué relación existe entre una **clase** y los **objetos** que pueden crearse a partir de ella?',
	level: 2,
	position: 3,
	tags: ['oop', 'polimorfismo', 'testing'],
	course: taller
	)
}