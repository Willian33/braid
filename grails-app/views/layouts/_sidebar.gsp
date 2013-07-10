<%@page import="braid.course.Option"%>

<ul class="nav nav-tabs span2">
	<sec:ifAllGranted roles="ROLE_JEDI">
		<li class="${pageProperty(name:'page.dashboard')}"><g:link
				class="bbnotgood" controller="home" action="dashboard">
				<strong>Dashboard</strong>
			</g:link></li>
	</sec:ifAllGranted>

	<li class="${pageProperty(name:'page.announcements')}"><g:link
			class="bbnotgood" controller="home" action="announcements">
								Anuncios
							</g:link></li>
	<li class="${pageProperty(name:'page.syllabus')}"><g:link
			class="bbnotgood" controller="home" action="syllabus">
							Plan de estudios
						</g:link></li>
	<g:if test="${coursePresenter.hasOption(Option.questions)}">
		<li class="${pageProperty(name:'page.questions')}"><g:link
				class="bbnotgood" controller="question" action="list">
							Preguntas teóricas
						</g:link></li>
	</g:if>
	<g:if test="${coursePresenter.hasOption(Option.homework)}">
		<li class="${pageProperty(name:'page.homeworks')}"><g:link
				class="bbnotgood" controller="homework" action="list">
							Tareas
						</g:link></li>
	</g:if>

	<g:if test="${coursePresenter.hasOption(Option.assignment)}">
		<li class="${pageProperty(name:'page.assignments')}"><g:link
				class="bbnotgood" controller="assignment" action="list">
							Trabajos prácticos
						</g:link></li>
	</g:if>

	<g:if test="${coursePresenter.hasOption(Option.exams)}">
		<li><a
			href="http://github.com/${coursePresenter.githubUsername}/parciales"
			class="bbnotgood"> Evaluaciones </a></li>
	</g:if>

	<sec:ifAnyGranted roles="ROLE_YODA, ROLE_JEDI">
		<li class="${pageProperty(name:'page.students')}"><g:link
				class="bbnotgood" controller="user" action="list">
								Estudiantes
							</g:link></li>
	</sec:ifAnyGranted>
	<li class="${pageProperty(name:'page.honorCode')}"><g:link
			class="bbnotgood" controller="home" action="honorCode">
			<strong>Código de Honor</strong>
		</g:link></li>
</ul>