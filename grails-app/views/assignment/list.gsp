<html>
<head>

<title>trabajos prácticos</title>
<meta name="layout" content="main">

<parameter name="assignments" value="active" />
</head>
<body>

	<div class="span12">
		<legend> Trabajos prácticos

			<sec:ifAllGranted roles="ROLE_JEDI">
				<g:link controller="assignment" action="create" class="btn btn-success pull-right">
					Nuevo trabajo práctico
				</g:link>
			</sec:ifAllGranted>

		</legend>

		<div class="alert alert-info">
			<strong><g:message code="braid.homework.dueDates.title"/></strong>
			<p><g:message code="braid.homework.dueDates.message"/></p>
		</div>

		<table class="table table-hover table-striped">
			<thead>
				<tr>
					<th>Título</th>
					<th>Fecha de entrega</th>
					<th>&nbsp;</th>
				</tr>
			</thead>
			<tbody>
				<g:each in="${assignments}" var="assignment">
					<tr>
						<td>
							${assignment.title}
						</td>
						<td><g:formatDate date="${assignment.dueDate}"
								timeZone="America/Argentina/Buenos_Aires" /></td>
						<td>
							<g:link class="btn btn-small" action="show" id="${assignment.id}">
								Ver detalles
							</g:link>
							<sec:ifAllGranted roles="ROLE_JEDI">
								<g:link class="btn btn-small" action="statistics" id="${assignment.id}">
									Ver estadísticas
								</g:link>
							</sec:ifAllGranted>
						</td>
					</tr>
				</g:each>
			</tbody>
		</table>

	</div>

</body>
</html>