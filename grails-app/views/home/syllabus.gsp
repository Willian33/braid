<html>
<head>

<title>plan de estudios</title>
<meta name="layout" content="main">

<parameter name="syllabus" value="active" />
</head>
<body>


	<div class="span12">
		<legend> Plan de estudios </legend>

		<g:if test="${flash.msg}">
			<div class="alert alert-info">
				${flash.msg}
			</div>
		</g:if>
		
		<sec:ifAnyGranted roles="ROLE_YODA, ROLE_JEDI">
			<div class="well">
				<g:form controller="home" action="saveSyllabus">
					<div class="row-fluid">
						<g:textArea rows="7" class="span12 wmd-panel" name="syllabus">${course.syllabus}</g:textArea>
						<small class="pull-right">
							* Recuerde utilizar 
							<a href="http://scottboms.com/downloads/documentation/markdown_cheatsheet.pdf" target="_blank">
								formato markdown
							</a>
						</small>
					</div>
					
					<div class="row-fluid">
						<g:submitButton id="submitHonorCode" class="btn btn-small btn-primary pull-right" name="submit" value="Modificar Plan de Estudios"/>
					</div>
				</g:form>
			</div>
		</sec:ifAnyGranted>

		<sec:ifAnyGranted roles="ROLE_JAR_JAR, ROLE_PADAWAN">

			<div class="syllabus md">
				<markdown:renderHtml>${course.syllabus}</markdown:renderHtml>
			</div>
		
		</sec:ifAnyGranted>

	</div>

</body>
</html>