{{/*
Expand the name of the chart.
*/}}
{{- define "tree.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "tree.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "tree.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "tree.labels" -}}
helm.sh/chart: {{ include "tree.chart" . }}
{{ include "tree.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "tree.selectorLabels" -}}
app.kubernetes.io/name: {{ include "tree.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "tree.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "tree.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{- define "tree.defaultSecret" -}}
{{- .Release.Name -}}
{{- end }}

{{- define "tree.secret" -}}
{{- default (include "tree.defaultSecret" .) .Values.existingSecret  -}}
{{- end }}

{{- define "tree.defaultConfigmap" -}}
{{- .Release.Name -}}
{{- end }}

{{- define "tree.configMap" -}}
{{- default (include "tree.defaultConfigmap" .) .Values.existingConfigmap  -}}
{{- end }}
