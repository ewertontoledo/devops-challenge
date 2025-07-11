{{/*
Retorna o nome do chart
*/}}
{{- define "devops-challenge-app.name" -}}
{{- .Chart.Name -}}
{{- end }}

{{/*
Retorna o nome completo do chart usando release name
*/}}
{{- define "devops-challenge-app.fullname" -}}
{{- printf "%s-%s" .Release.Name (include "devops-challenge-app.name" .) | trunc 63 | trimSuffix "-" -}}
{{- end }}
