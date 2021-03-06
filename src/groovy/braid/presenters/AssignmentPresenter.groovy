package braid.presenters

import groovy.time.TimeCategory


class AssignmentPresenter {

	def assignment
	def course
	def now
	def solutions
	def command
	def padawan

	def getBestSolution(){
		solutions.max { it.score }
	}

	boolean canSubmit() {

		def result = true

		if (solutions) {
			result = !ungradedSolutions() || firstSolutionOldEnough()
		}

		return padawan && result 
	}

	private boolean firstSolutionOldEnough() {
		use(TimeCategory) {
			return solutions.first().dateCreated < now - 30.minutes
		}
	}

	private ungradedSolutions() {
		solutions.findAll { !it.graded }
	}
}
