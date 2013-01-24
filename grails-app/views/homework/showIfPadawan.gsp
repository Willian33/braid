<html>
<head>

<title>tarea: ${homework.title}</title>
<meta name="layout" content="main">
<r:require modules="bootstrap-modal" />
<g:javascript src="Markdown.Converter.js" />
<g:javascript src="Markdown.Sanitizer.js" />

<parameter name="homeworks" value="active" />
</head>
<body>

	<div class="span12">
		
		<legend>
			${homework.title} 
			<small class="pull-right">
				Entrega: <g:formatDate date="${homework.dueDate}" 
			  		format="EEE, d MMM yyyy HH:mm z" timeZone="America/Argentina/Buenos_Aires"/>
			</small>
		</legend>
		
		<div class="well">
		
			<legend>Consigna</legend>
			
			<div class="well">
				<markdown:renderHtml >${homework.wording}</markdown:renderHtml>
			</div>
			
			<legend>Mi respuesta</legend>
			<div id="previewArea" class="well preview md">-</div>
			
		</div>
		
		<g:if test="${!homework.outOfDate}">
			<div class="well">
				<g:form action="solve">
				
					<g:hiddenField name="homeworkId" value="${homework.id}"/>
					<g:hiddenField name="homeworkSolutionId" value="${command?.homeworkSolutionId}"/>
				
					<g:textArea rows="7" class="span12 wmd-panel ${hasErrors(bean:command,field:'text', 'error')}" 
						name="text" id="solution">${command?.text}</g:textArea>
					<small class="pull-right">
						* Recuerde utilizar 
						<a href="http://scottboms.com/downloads/documentation/markdown_cheatsheet.pdf" target="_blank">
							formato markdown
						</a>
					</small>
					<div class="row-fluid">
						<span class="span6">
							<label class="checkbox ${hasErrors(bean:command,field:'honorCode', 'error')}" for="honorCode">
						      <input id="honorCode" type="checkbox" name="honorCode"> Declaro estar de acuerdo con el 
						      <a href="#honorCodeModal" data-toggle="modal">Código de Honor</a>
						    </label>
						</span>
						<span class="span6">
							<g:submitButton id="submitHomework" class="btn btn-small btn-primary pull-right" name="submit" value="Responder"/>
						</span>
					</div>
					
				</g:form>
				
			</div>
		</g:if>

	</div>

<div id="honorCodeModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
    <h3 id="myModalLabel">Código de Honor</h3>
  </div>
  <div class="modal-body">
    <markdown:renderHtml>${course.honorCode}</markdown:renderHtml>
  </div>
</div>

	<script type="text/javascript">

		$(function() {
			$("#solution").on('keyup', function(){
				if ($(this).val() == '') {
					$("#submitHomework").attr('disabled','disabled')
				} else {
					$("#submitHomework").removeAttr('disabled')
				}
			});
		});

		$(function() {
		  // When using more than one `textarea` on your page, change the following line to match the one you’re after
		  var $textarea = $('textarea'),
		      $preview = $('#previewArea'),
		      convert = new Markdown.getSanitizingConverter().makeHtml;

		  // instead of `keyup`, consider using `input` using this plugin: http://mathiasbynens.be/notes/oninput#comment-1
		  $textarea.keyup(function() {
			    $preview.html(convert($textarea.val()));
		  }).trigger('keyup');
		});
	
	</script>

</body>
</html>