{{/*
Expand the name of the chart.
*/}}
{{- define "zoo.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "zoo.fullname" -}}
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
{{- define "zoo.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "zoo.labels" -}}
helm.sh/chart: {{ include "zoo.chart" . }}
{{ include "zoo.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "zoo.selectorLabels" -}}
app.kubernetes.io/name: {{ include "zoo.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "zoo.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "zoo.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{- define "zoo.defaultSecret" -}}
{{- .Release.Name -}}
{{- end }}

{{- define "zoo.secret" -}}
{{- default (include "zoo.defaultSecret" .) .Values.existingSecret  -}}
{{- end }}

{{- define "zoo.defaultConfigmap" -}}
{{- .Release.Name -}}
{{- end }}

{{- define "zoo.configMap" -}}
{{- default (include "zoo.defaultConfigmap" .) .Values.existingConfigmap  -}}
{{- end }}